/**
 * 65C816 Instruction Set Type Definitions
 * Complete type-safe definitions for the 65C816 processor instruction set
 * 
 * Source: Generated from 65c816-instruction-set-complete.json
 */

export type ProcessorFlag = 'N' | 'V' | 'M' | 'X' | 'D' | 'I' | 'Z' | 'C' | 'B' | 'E' | '*';

export type AddressingMode = 
  | 'Immediate'
  | 'Absolute'
  | 'AbsoluteLong'
  | 'DirectPage'
  | 'DirectPageIndirect'
  | 'DirectPageIndirectLong'
  | 'AbsoluteIndexedX'
  | 'AbsoluteLongIndexedX'
  | 'AbsoluteIndexedY'
  | 'DirectPageIndexedX'
  | 'DirectPageIndexedY'
  | 'DirectPageIndexedIndirectX'
  | 'DirectPageIndirectIndexedY'
  | 'DirectPageIndirectLongIndexedY'
  | 'StackRelative'
  | 'StackRelativeIndirectIndexedY'
  | 'Accumulator'
  | 'Implied'
  | 'Stack'
  | 'StackInterrupt'
  | 'PCRelative'
  | 'PCRelativeLong'
  | 'AbsoluteIndirect'
  | 'AbsoluteIndirectLong'
  | 'AbsoluteIndexedIndirect'
  | 'BlockMove';

export interface CycleTiming {
  /** Base cycle count */
  base: number;
  /** Subtract 1 cycle when M flag is 0 (16-bit accumulator) */
  m_flag_penalty?: number;
  /** Subtract 1 cycle when X flag is 0 (16-bit index registers) */
  x_flag_penalty?: number;
  /** Subtract 2 cycles when M flag is 0 (16-bit accumulator) */
  m_double_penalty?: number;
  /** Add 1 cycle when Direct Page register is not zero */
  direct_page_penalty?: number;
  /** Add 1 cycle when page boundary is crossed */
  page_boundary_penalty?: number;
  /** Add 1 cycle when branch is taken */
  branch_taken_penalty?: number;
  /** Add 1 cycle in emulation mode when page boundary is crossed */
  emulation_page_penalty?: number;
  /** Human-readable description of timing */
  description: string;
  /** Additional notes about timing edge cases */
  note?: string;
}

export interface InstructionVariant {
  /** Addressing mode for this variant */
  addressingMode: AddressingMode;
  /** Opcode value (0-255) */
  opcode: number;
  /** Instruction size in bytes, or 'flag-dependent' for immediate mode */
  size: number | 'flag-dependent';
  /** Cycle timing information */
  cycles: CycleTiming;
}

export interface Instruction {
  /** Three-letter mnemonic */
  mnemonic: string;
  /** Human-readable description */
  description: string;
  /** Processor flags affected by this instruction */
  affectsFlags: ProcessorFlag[];
  /** All addressing mode variants for this instruction */
  variants: InstructionVariant[];
}

export interface InstructionGroup {
  /** Group description */
  description: string;
  /** Instructions in this group, keyed by mnemonic */
  instructions: Record<string, Instruction>;
}

export interface CycleNotation {
  /** Description of cycle timing system */
  description: string;
  /** Notation explanations */
  notation: Record<string, string>;
  /** Example formulas */
  examples: Record<string, string>;
}

export interface InstructionSetMetadata {
  /** Schema name */
  name: string;
  /** Version */
  version: string;
  /** Description */
  description: string;
  /** Base processor schema reference */
  baseProcessor: string;
  /** Source of generation */
  generatedFrom: string;
  /** Total unique instructions */
  totalInstructions: number;
  /** Total instruction variants */
  totalVariants: number;
  /** Cycle notation documentation */
  cycleNotation: CycleNotation;
}

export interface CompleteInstructionSet {
  /** Metadata about the instruction set */
  metadata: InstructionSetMetadata;
  /** Instruction groups */
  instructionGroups: Record<string, InstructionGroup>;
  /** Validation rules for operands and instructions */
  validationRules?: Record<string, any>;
}

// Utility types for instruction lookup
export type InstructionMnemonic = string;
export type OpcodeValue = number;

// Helper type for creating instruction variants
export type InstructionVariantBuilder = Omit<InstructionVariant, 'cycles'> & {
  cycles: Partial<CycleTiming> & { description: string };
};

// Category type for instruction groups
export type InstructionCategory = 
  | 'LoadStore'
  | 'Arithmetic' 
  | 'Logical'
  | 'Shift'
  | 'ControlFlow'
  | 'Branch'
  | 'System'
  | 'Interrupt'
  | 'Flags'
  | 'Stack'
  | 'Transfer'
  | 'BlockMove'
  | 'Special'; 