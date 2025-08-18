/**
 * 65C816 Database Query Tests
 * 
 * This script tests various queries against the 65C816 instruction set database
 * to ensure the schema and relationships work correctly.
 */

import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function testBasicQueries() {
  console.log('🧪 Testing basic queries...');
  
  // Test 1: Count total records
  const instructionSetCount = await prisma.instructionSet.count();
  const addressingModeCount = await prisma.addressingMode.count();
  const instructionGroupCount = await prisma.instructionGroup.count();
  const instructionCount = await prisma.instruction.count();
  const variantCount = await prisma.instructionVariant.count();
  
  console.log(`📊 Record counts:`);
  console.log(`   - Instruction Sets: ${instructionSetCount}`);
  console.log(`   - Addressing Modes: ${addressingModeCount}`);
  console.log(`   - Instruction Groups: ${instructionGroupCount}`);
  console.log(`   - Instructions: ${instructionCount}`);
  console.log(`   - Instruction Variants: ${variantCount}`);
}

async function testInstructionLookups() {
  console.log('🔍 Testing instruction lookups...');
  
  // Test 2: Find LDA instruction with all its variants
  const ldaInstruction = await prisma.instruction.findFirst({
    where: { mnemonic: 'LDA' },
    include: {
      variants: {
        include: {
          addressingMode: true
        }
      },
      instructionGroup: true
    }
  });
  
  if (ldaInstruction) {
    console.log(`✅ Found LDA instruction with ${ldaInstruction.variants.length} variants`);
    console.log(`   - Description: ${ldaInstruction.description}`);
    console.log(`   - Group: ${ldaInstruction.instructionGroup.name}`);
    console.log(`   - Affected Flags: ${ldaInstruction.affectedFlags.join(', ')}`);
    
    // Show a few variants
    ldaInstruction.variants.slice(0, 3).forEach((variant, i) => {
      console.log(`   - Variant ${i + 1}: ${variant.addressingMode.mode} (Opcode: ${variant.opcode})`);
    });
  } else {
    console.error('❌ LDA instruction not found');
  }
}

async function testOpcodeMapping() {
  console.log('🎯 Testing opcode mapping...');
  
  // Test 3: Look up instructions by specific opcodes
  const testOpcodes = [169, 173, 175]; // LDA immediate, absolute, absolute long
  
  for (const opcode of testOpcodes) {
    const variant = await prisma.instructionVariant.findUnique({
      where: { opcode },
      include: {
        instruction: true,
        addressingMode: true
      }
    });
    
    if (variant) {
      console.log(`✅ Opcode ${opcode}: ${variant.instruction.mnemonic} (${variant.addressingMode.mode})`);
    } else {
      console.error(`❌ Opcode ${opcode} not found`);
    }
  }
}

async function testComplexQueries() {
  console.log('🔬 Testing complex queries...');
  
  // Test 4: Find all instructions that affect the Z flag
  const zFlagInstructions = await prisma.instruction.findMany({
    where: {
      affectedFlags: {
        has: 'Z'
      }
    },
    select: {
      mnemonic: true,
      description: true
    }
  });
  
  console.log(`✅ Found ${zFlagInstructions.length} instructions that affect the Z flag`);
  
  // Test 5: Find all immediate addressing mode instructions
  const immediateInstructions = await prisma.instructionVariant.findMany({
    where: {
      addressingMode: {
        mode: 'Immediate'
      }
    },
    include: {
      instruction: {
        select: {
          mnemonic: true
        }
      },
      addressingMode: {
        select: {
          mode: true
        }
      }
    }
  });
  
  console.log(`✅ Found ${immediateInstructions.length} immediate addressing mode variants`);
  
  // Show unique mnemonics
  const uniqueMnemonics = [...new Set(immediateInstructions.map(v => v.instruction.mnemonic))];
  console.log(`   - Unique instructions: ${uniqueMnemonics.join(', ')}`);
}

async function testJSONFields() {
  console.log('📋 Testing JSON fields...');
  
  // Test 6: Query cycle timing JSON data
  const complexInstruction = await prisma.instructionVariant.findFirst({
    where: {
      instruction: {
        mnemonic: 'LDA'
      },
      addressingMode: {
        mode: 'DirectPage'
      }
    },
    select: {
      opcode: true,
      cycleTiming: true,
      instruction: {
        select: {
          mnemonic: true
        }
      },
      addressingMode: {
        select: {
          mode: true,
          validationPatterns: true
        }
      }
    }
  });
  
  if (complexInstruction) {
    console.log(`✅ Found complex instruction: ${complexInstruction.instruction.mnemonic} (${complexInstruction.addressingMode.mode})`);
    console.log(`   - Cycle Timing:`, complexInstruction.cycleTiming);
    console.log(`   - Validation Patterns:`, complexInstruction.addressingMode.validationPatterns);
  }
}

async function testRelationships() {
  console.log('🔗 Testing relationships...');
  
  // Test 7: Get complete instruction set with nested relationships
  const instructionSet = await prisma.instructionSet.findFirst({
    include: {
      instructionGroups: {
        include: {
          instructions: {
            include: {
              variants: {
                include: {
                  addressingMode: true
                }
              }
            }
          }
        }
      }
    }
  });
  
  if (instructionSet) {
    const totalInstructions = instructionSet.instructionGroups.reduce((sum, group) => 
      sum + group.instructions.length, 0);
    const totalVariants = instructionSet.instructionGroups.reduce((sum, group) => 
      sum + group.instructions.reduce((varSum, instruction) => 
        varSum + instruction.variants.length, 0), 0);
    
    console.log(`✅ Complete instruction set loaded:`);
    console.log(`   - Name: ${instructionSet.name}`);
    console.log(`   - Version: ${instructionSet.version}`);
    console.log(`   - Groups: ${instructionSet.instructionGroups.length}`);
    console.log(`   - Instructions: ${totalInstructions}`);
    console.log(`   - Variants: ${totalVariants}`);
    
    // Validate against metadata
    if (totalInstructions === instructionSet.totalInstructions && 
        totalVariants === instructionSet.totalVariants) {
      console.log('✅ Data integrity check passed!');
    } else {
      console.warn('⚠️  Data integrity check failed:');
      console.warn(`   - Expected instructions: ${instructionSet.totalInstructions}, Got: ${totalInstructions}`);
      console.warn(`   - Expected variants: ${instructionSet.totalVariants}, Got: ${totalVariants}`);
    }
  }
}

async function performanceTest() {
  console.log('⚡ Performance testing...');
  
  // Test 8: Measure query performance
  const start = Date.now();
  
  const allInstructions = await prisma.instruction.findMany({
    include: {
      variants: {
        include: {
          addressingMode: true
        }
      }
    }
  });
  
  const end = Date.now();
  const duration = end - start;
  
  console.log(`✅ Loaded all ${allInstructions.length} instructions with variants in ${duration}ms`);
  
  if (duration < 1000) {
    console.log('✅ Performance: Excellent (< 1s)');
  } else if (duration < 3000) {
    console.log('⚠️  Performance: Good (1-3s)');
  } else {
    console.log('🐌 Performance: Needs improvement (> 3s)');
  }
}

async function main() {
  console.log('🚀 Starting 65C816 database tests...');
  
  try {
    await testBasicQueries();
    await testInstructionLookups();
    await testOpcodeMapping();
    await testComplexQueries();
    await testJSONFields();
    await testRelationships();
    await performanceTest();
    
    console.log('🎉 All tests completed successfully!');
  } catch (error) {
    console.error('❌ Test failed:', error);
    throw error;
  }
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
