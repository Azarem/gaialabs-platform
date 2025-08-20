/**
 * 65C816 Instruction Set Database Seeder
 * 
 * This script seeds the database with 65C816 processor instruction set data
 * from the JSON files in the data/65c816 directory.
 */

import { PrismaClient } from '@prisma/client';
import { readFileSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

// ES module equivalent of __dirname
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const prisma = new PrismaClient();

// Path to the 65c816 data directory (relative to project root)
const DATA_DIR = '../../../../data/65c816';

// Type definitions matching the JSON structure
interface CycleTiming {
  base: number;
  m_flag_penalty?: number;
  x_flag_penalty?: number;
  m_double_penalty?: number;
  direct_page_penalty?: number;
  page_boundary_penalty?: number;
  branch_taken_penalty?: number;
  emulation_page_penalty?: number;
  description: string;
  note?: string;
}

interface InstructionVariant {
  addressingMode: string;
  opcode: number;
  size: number | 'flag-dependent';
  cycles: CycleTiming;
}

interface Instruction {
  mnemonic: string;
  description: string;
  affectsFlags: string[];
  variants: InstructionVariant[];
}

interface InstructionGroup {
  description: string;
  instructions: Record<string, Instruction>;
}

interface Metadata {
  name: string;
  version: string;
  description: string;
  baseProcessor: string;
  generatedFrom: string;
  totalInstructions: number;
  totalVariants: number;
  cycleNotation: any;
}

interface AddressingModeData {
  metadata: any;
  addressingModes: Record<string, any>;
}

interface ValidationRulesData {
  [key: string]: any;
}

// No longer needed - using strings directly instead of enum mapping

// Instruction group category mapping
const INSTRUCTION_GROUP_CATEGORIES: Record<string, string> = {
  'loadstore': 'LoadStore',
  'arithmetic': 'Arithmetic',
  'logical': 'Logical',
  'shift': 'Shift',
  'controlflow': 'ControlFlow',
  'branch': 'Branch',
  'system': 'System',
  'interrupt': 'Interrupt',
  'flags': 'Flags',
  'stack': 'Stack',
  'transfer': 'Transfer',
  'blockmove': 'BlockMove',
  'special': 'Special'
};

// Processor flag mapping
const PROCESSOR_FLAG_MAP: Record<string, string> = {
  'N': 'N',
  'V': 'V',
  'M': 'M',
  'X': 'X',
  'D': 'D',
  'I': 'I',
  'Z': 'Z',
  'C': 'C',
  'B': 'B',
  'E': 'E',
  '*': 'WILDCARD'
};

function readJsonFile<T>(filename: string): T {
  const filePath = join(__dirname, DATA_DIR, filename);
  const content = readFileSync(filePath, 'utf-8');
  return JSON.parse(content);
}

function mapProcessorFlags(flags: string[]): string[] {
  return flags.map(flag => PROCESSOR_FLAG_MAP[flag] || flag);
}

async function seedAddressingModes(instructionSetId: string) {
  console.log('🔄 Seeding addressing modes...');
  
  const addressingData = readJsonFile<AddressingModeData>('addressing-mode.json');
  
  const addressingModes = [];
  for (const [key, mode] of Object.entries(addressingData.addressingModes)) {
    // Use the mode value directly as a string
    const modeValue = mode.mode;
    if (!modeValue) {
      console.warn(`⚠️  Missing mode value for: ${key}`);
      continue;
    }
    
    // Parse numeric fields that might be strings or ranges
    const parseNumericField = (value: any): number => {
      if (typeof value === 'number') return value;
      if (typeof value === 'string') {
        // Handle ranges like "2-3" by taking the first number
        const match = value.match(/^\d+/);
        return match ? parseInt(match[0], 10) : 0;
      }
      return 0;
    };
    
    addressingModes.push({
      instructionSetId,
      mode: modeValue,
      shorthand: mode.shorthand || key.toLowerCase(),
      name: modeValue, // Name should be the same as mode
      operandType: mode.operandType, // Use the operand type from JSON
      description: mode.description,
      length: parseNumericField(mode.length),
      format: mode.format,
      formatString: mode.formatString,
      parseRegex: mode.parseRegex,
      operandSize: parseNumericField(mode.operandSize),
      supportsSymbols: mode.supportsSymbols || false,
      bankWrapping: mode.bankWrapping || false,
      pageWrapping: mode.pageWrapping || false,
      validationPatterns: mode.validationPatterns || {},
      examples: mode.examples || []
    });
  }
  
  for (const mode of addressingModes) {
    await prisma.addressingMode.upsert({
      where: { 
        instructionSetId_mode: {
          instructionSetId: mode.instructionSetId,
          mode: mode.mode
        }
      },
      update: mode,
      create: mode
    });
  }
  
  console.log(`✅ Created ${addressingModes.length} addressing modes`);
  return addressingModes;
}

async function seedInstructionSet() {
  console.log('🔄 Seeding instruction set metadata...');
  
  const metadata = readJsonFile<Metadata>('metadata.json');
  const validationRules = readJsonFile<ValidationRulesData>('validation-rules.json');
  
  const instructionSet = await prisma.instructionSet.upsert({
    where: { name: metadata.name },
    update: {
      version: metadata.version,
      description: metadata.description,
      baseProcessor: metadata.baseProcessor,
      generatedFrom: metadata.generatedFrom,
      totalInstructions: metadata.totalInstructions,
      totalVariants: metadata.totalVariants,
      cycleNotation: metadata.cycleNotation,
      metadata: metadata
    },
    create: {
      name: metadata.name,
      version: metadata.version,
      description: metadata.description,
      baseProcessor: metadata.baseProcessor,
      generatedFrom: metadata.generatedFrom,
      totalInstructions: metadata.totalInstructions,
      totalVariants: metadata.totalVariants,
      cycleNotation: metadata.cycleNotation,
      metadata: metadata
    }
  });
  
  console.log(`✅ Created instruction set: ${instructionSet.name}`);
  
  // Seed validation rules
  for (const [category, rules] of Object.entries(validationRules)) {
    await prisma.validationRule.upsert({
      where: { 
        instructionSetId_name_category: {
          instructionSetId: instructionSet.id,
          name: category,
          category: 'validation'
        }
      },
      update: { rules },
      create: {
        instructionSetId: instructionSet.id,
        name: category,
        category: 'validation',
        rules
      }
    });
  }
  
  console.log('✅ Created validation rules');
  return instructionSet;
}

async function seedInstructionGroups(instructionSetId: string) {
  console.log('🔄 Seeding instruction groups...');
  
  // List of all instruction group files
  const groupFiles = [
    'load-store.json',
    'arithmetic.json',
    'logical.json',
    'shift.json',
    'control-flow.json',
    'branch.json',
    'system.json',
    'interrupt.json',
    'flags.json',
    'stack.json',
    'transfer.json',
    'block-move.json',
    'special.json'
  ];
  
  for (const filename of groupFiles) {
    const groupName = filename.replace('.json', '').replace('-', '');
    const category = INSTRUCTION_GROUP_CATEGORIES[groupName];
    
    if (!category) {
      console.warn(`⚠️  Unknown category for group: ${groupName}`);
      console.warn(`⚠️  Available categories:`, Object.keys(INSTRUCTION_GROUP_CATEGORIES));
      continue;
    }
    
    try {
      const groupData = readJsonFile<InstructionGroup>(filename);
      
      const instructionGroup = await prisma.instructionGroup.upsert({
        where: { 
          instructionSetId_name: {
            instructionSetId,
            name: groupName
          }
        },
        update: {
          category: category as any,
          description: groupData.description
        },
        create: {
          instructionSetId,
          name: groupName,
          category: category as any,
          description: groupData.description
        }
      });
      
      console.log(`✅ Created instruction group: ${groupName}`);
      
      // Seed instructions in this group
      await seedInstructions(instructionGroup.id, groupData.instructions, instructionSetId);
      
    } catch (error) {
      console.error(`❌ Error processing ${filename}:`, error);
    }
  }
}

async function seedInstructions(instructionGroupId: string, instructions: Record<string, Instruction>, instructionSetId: string) {
  console.log('🔄 Seeding instructions...');
  
  for (const [mnemonic, instruction] of Object.entries(instructions)) {
    const mappedFlags = mapProcessorFlags(instruction.affectsFlags);
    
    const instructionRecord = await prisma.instruction.upsert({
      where: {
        instructionGroupId_mnemonic: {
          instructionGroupId,
          mnemonic
        }
      },
      update: {
        description: instruction.description,
        affectedFlags: mappedFlags
      },
      create: {
        instructionGroupId,
        mnemonic,
        description: instruction.description,
        affectedFlags: mappedFlags
      }
    });
    
    // Seed instruction variants
    await seedInstructionVariants(instructionRecord.id, instruction.variants, instructionSetId);
  }
  
  console.log(`✅ Seeded ${Object.keys(instructions).length} instructions`);
}

async function seedInstructionVariants(instructionId: string, variants: InstructionVariant[], instructionSetId: string) {
  for (const variant of variants) {
    // Use the addressing mode value directly
    const addressingModeValue = variant.addressingMode;
    if (!addressingModeValue) {
      console.warn(`⚠️  Missing addressing mode for variant with opcode: ${variant.opcode}`);
      continue;
    }
    
    // Find the addressing mode record by instructionSetId and mode
    const addressingMode = await prisma.addressingMode.findUnique({
      where: { 
        instructionSetId_mode: {
          instructionSetId,
          mode: addressingModeValue
        }
      }
    });
    
    if (!addressingMode) {
      console.error(`❌ Addressing mode not found: ${addressingModeValue} for instruction set ${instructionSetId}`);
      continue;
    }
    
    const isFlagDependent = variant.size === 'flag-dependent';
    const size = isFlagDependent ? null : (variant.size as number);
    
    try {
      await prisma.instructionVariant.upsert({
        where: { opcode: variant.opcode },
        update: {
          size,
          isFlagDependent,
          cycleTiming: variant.cycles,
          instructionId,
          addressingModeId: addressingMode.id
        },
        create: {
          opcode: variant.opcode,
          size,
          isFlagDependent,
          cycleTiming: variant.cycles,
          instructionId,
          addressingModeId: addressingMode.id
        }
      });
    } catch (error) {
      console.error(`❌ Error creating variant for opcode ${variant.opcode}:`, error);
    }
  }
}

async function main() {
  console.log('🚀 Starting 65C816 instruction set seeding...');
  
  try {
    // Clear existing 65C816 data
    console.log('🧹 Clearing existing 65C816 data...');
    await prisma.instructionVariant.deleteMany({});
    await prisma.instruction.deleteMany({});
    await prisma.instructionGroup.deleteMany({});
    await prisma.validationRule.deleteMany({});
    await prisma.addressingMode.deleteMany({});
    await prisma.instructionSet.deleteMany({});
    
    // Seed in order due to relationships
    const instructionSet = await seedInstructionSet();
    await seedAddressingModes(instructionSet.id);
    await seedInstructionGroups(instructionSet.id);
    
    console.log('🎉 65C816 instruction set seeding completed successfully!');
    
    // Print summary statistics
    const stats = await prisma.instructionSet.findUnique({
      where: { id: instructionSet.id },
      include: {
        instructionGroups: {
          include: {
            instructions: {
              include: {
                variants: true
              }
            }
          }
        }
      }
    });
    
    if (stats) {
      const totalInstructions = stats.instructionGroups.reduce((sum, group) => 
        sum + Object.keys(group.instructions).length, 0);
      const totalVariants = stats.instructionGroups.reduce((sum, group) => 
        sum + group.instructions.reduce((variantSum, instruction) => 
          variantSum + instruction.variants.length, 0), 0);
      
      console.log(`📊 Summary:`);
      console.log(`   - Instruction Groups: ${stats.instructionGroups.length}`);
      console.log(`   - Instructions: ${totalInstructions}`);
      console.log(`   - Instruction Variants: ${totalVariants}`);
    }
    
  } catch (error) {
    console.error('❌ Seeding failed:', error);
    throw error;
  }
}

// Export the function for use in main seed script
export { main as seed65C816 };

// Only run directly if this file is executed directly
if (process.argv[1]?.includes('seed-65c816.ts')) {
  main()
    .catch((e) => {
      console.error(e);
      process.exit(1);
    })
    .finally(async () => {
      await prisma.$disconnect();
    });
}
