/**
 * 65C816 Modular Instruction Set
 * Complete TypeScript integration with JSON data modules
 * 
 * Usage:
 *   import { LoadStore, getInstructionByOpcode } from '@gaialabs/65c816-instruction-set';
 *   import instructionSet from '@gaialabs/65c816-instruction-set';
 */

// Import JSON data modules
import addressingMode from './addressing-mode.json';
import metadata from './metadata.json';
import validationRules from './validation-rules.json';
import loadStore from './load-store.json';
import arithmetic from './arithmetic.json';
import logical from './logical.json';
import shift from './shift.json';
import controlFlow from './control-flow.json';
import branch from './branch.json';
import system from './system.json';
import interrupt from './interrupt.json';
import stack from './stack.json';
import transfer from './transfer.json';
import blockMove from './block-move.json';
import special from './special.json';
import flags from './flags.json';

// Re-export all type definitions
export * from './types';

// Import core types for typing JSON imports
import type { 
  InstructionSetMetadata, 
  InstructionGroup, 
  CompleteInstructionSet,
  Instruction,
  InstructionVariant,
  OpcodeValue,
  InstructionMnemonic
} from './types';

// Typed JSON exports
export const Metadata = metadata as InstructionSetMetadata;
export const ValidationRules = validationRules as Record<string, any>;
export const LoadStore = loadStore as InstructionGroup;
export const Arithmetic = arithmetic as InstructionGroup;
export const Logical = logical as InstructionGroup;
export const Shift = shift as InstructionGroup;
export const ControlFlow = controlFlow as InstructionGroup;
export const Branch = branch as InstructionGroup;
export const System = system as InstructionGroup;
export const Interrupt = interrupt as InstructionGroup;
export const Stack = stack as InstructionGroup;
export const Transfer = transfer as InstructionGroup;
export const BlockMove = blockMove as InstructionGroup;
export const Special = special as InstructionGroup;
export const Flags = flags as InstructionGroup;

// Note: Additional category imports will be added as files are created
// export const Arithmetic = arithmetic as InstructionGroup;
// export const Logical = logical as InstructionGroup;
// ... etc.

/**
 * Complete 65C816 instruction set with all 13 categories implemented
 * Contains all 92 instructions with 256 variants across all addressing modes
 */
export const completeInstructionSet: CompleteInstructionSet = {
  metadata: Metadata,
  instructionGroups: {
    LoadStore,
    Arithmetic,
    Logical,
    Shift,
    ControlFlow,
    Branch,
    System,
    Interrupt,
    Stack,
    Transfer,
    BlockMove,
    Special,
    Flags
  },
  validationRules: ValidationRules
};

/**
 * Get instruction variant by opcode value
 * @param opcode - Opcode value (0-255)
 * @returns InstructionVariant with mnemonic, or null if not found
 */
export function getInstructionByOpcode(opcode: OpcodeValue): (InstructionVariant & { mnemonic: string }) | null {
  for (const [groupName, group] of Object.entries(completeInstructionSet.instructionGroups || {})) {
    for (const [mnemonic, instruction] of Object.entries(group.instructions)) {
      const variant = instruction.variants.find(v => v.opcode === opcode);
      if (variant) {
        return { ...variant, mnemonic };
      }
    }
  }
  return null;
}

/**
 * Get instruction by mnemonic
 * @param mnemonic - Three-letter instruction mnemonic (e.g., 'LDA')
 * @returns Instruction object or null if not found
 */
export function getInstructionByMnemonic(mnemonic: InstructionMnemonic): Instruction | null {
  const upperMnemonic = mnemonic.toUpperCase();
  for (const group of Object.values(completeInstructionSet.instructionGroups || {})) {
    if (upperMnemonic in group.instructions) {
      return group.instructions[upperMnemonic];
    }
  }
  return null;
}

/**
 * Get all opcodes mapped to their mnemonics
 * @returns Record mapping opcode values to mnemonics
 */
export function getOpcodeMap(): Record<OpcodeValue, InstructionMnemonic> {
  const opcodeMap: Record<OpcodeValue, InstructionMnemonic> = {};
  
  for (const group of Object.values(completeInstructionSet.instructionGroups || {})) {
    for (const [mnemonic, instruction] of Object.entries(group.instructions)) {
      for (const variant of instruction.variants) {
        opcodeMap[variant.opcode] = mnemonic;
      }
    }
  }
  
  return opcodeMap;
}

/**
 * Get all mnemonics in alphabetical order
 * @returns Array of instruction mnemonics
 */
export function getAllMnemonics(): InstructionMnemonic[] {
  const mnemonics = new Set<InstructionMnemonic>();
  
  for (const group of Object.values(completeInstructionSet.instructionGroups || {})) {
    for (const mnemonic of Object.keys(group.instructions)) {
      mnemonics.add(mnemonic);
    }
  }
  
  return Array.from(mnemonics).sort();
}

/**
 * Get instruction statistics
 * @returns Object with counts and statistics
 */
export function getInstructionStats() {
  let totalInstructions = 0;
  let totalVariants = 0;
  const groupStats: Record<string, { instructions: number; variants: number }> = {};
  
  for (const [groupName, group] of Object.entries(completeInstructionSet.instructionGroups || {})) {
    const instructions = Object.keys(group.instructions).length;
    let variants = 0;
    
    for (const instruction of Object.values(group.instructions)) {
      variants += instruction.variants.length;
    }
    
    groupStats[groupName] = { instructions, variants };
    totalInstructions += instructions;
    totalVariants += variants;
  }
  
  return {
    totalInstructions,
    totalVariants,
    implementedGroups: Object.keys(completeInstructionSet.instructionGroups || {}).length,
    totalGroups: 13, // As per build plan
    groupStats
  };
}

/**
 * Validate opcode range
 * @param opcode - Opcode to validate
 * @returns True if opcode is in valid range (0-255)
 */
export function isValidOpcode(opcode: number): opcode is OpcodeValue {
  return Number.isInteger(opcode) && opcode >= 0 && opcode <= 255;
}

/**
 * Get instructions that affect specific processor flags
 * @param flags - Array of flags to check for
 * @returns Array of instructions that affect any of the specified flags
 */
export function getInstructionsByFlags(flags: string[]): { mnemonic: string; instruction: Instruction }[] {
  const results: { mnemonic: string; instruction: Instruction }[] = [];
  
  for (const group of Object.values(completeInstructionSet.instructionGroups || {})) {
    for (const [mnemonic, instruction] of Object.entries(group.instructions)) {
      if (instruction.affectsFlags.some(flag => flags.includes(flag))) {
        results.push({ mnemonic, instruction });
      }
    }
  }
  
  return results;
}

// Default export provides complete access
export default completeInstructionSet; 