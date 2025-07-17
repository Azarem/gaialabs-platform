import { AddressingMode } from 'gaia-shared';

/**
 * Represents a 65816 processor opcode
 */
export class OpCode {
  public code: number;
  public mnem: string;
  public mode: AddressingMode;
  public size: number;

  constructor(code: number, mnem: string, mode: AddressingMode, size: number) {
    this.code = code;
    this.mnem = mnem;
    this.mode = mode;
    this.size = size;
  }
}

/**
 * Complete 65816 instruction set lookup table
 */
export const ALL_OPCODES: Record<number, OpCode> = {
  // ADC - Add with Carry
  0x69: new OpCode(0x69, 'ADC', AddressingMode.Immediate, -2),
  0x6D: new OpCode(0x6D, 'ADC', AddressingMode.Absolute, 3),
  0x6F: new OpCode(0x6F, 'ADC', AddressingMode.AbsoluteLong, 4),
  0x65: new OpCode(0x65, 'ADC', AddressingMode.DirectPage, 2),
  0x72: new OpCode(0x72, 'ADC', AddressingMode.DirectPageIndirect, 2),
  0x67: new OpCode(0x67, 'ADC', AddressingMode.DirectPageIndirectLong, 2),
  0x7D: new OpCode(0x7D, 'ADC', AddressingMode.AbsoluteIndexedX, 3),
  0x7F: new OpCode(0x7F, 'ADC', AddressingMode.AbsoluteLongIndexedX, 4),
  0x79: new OpCode(0x79, 'ADC', AddressingMode.AbsoluteIndexedY, 3),
  0x75: new OpCode(0x75, 'ADC', AddressingMode.DirectPageIndexedX, 2),
  0x61: new OpCode(0x61, 'ADC', AddressingMode.DirectPageIndexedIndirectX, 2),
  0x71: new OpCode(0x71, 'ADC', AddressingMode.DirectPageIndirectIndexedY, 2),
  0x77: new OpCode(0x77, 'ADC', AddressingMode.DirectPageIndirectLongIndexedY, 2),
  0x63: new OpCode(0x63, 'ADC', AddressingMode.StackRelative, 2),
  0x73: new OpCode(0x73, 'ADC', AddressingMode.StackRelativeIndirectIndexedY, 2),

  // AND - Logical AND
  0x29: new OpCode(0x29, 'AND', AddressingMode.Immediate, -2),
  0x2D: new OpCode(0x2D, 'AND', AddressingMode.Absolute, 3),
  0x2F: new OpCode(0x2F, 'AND', AddressingMode.AbsoluteLong, 4),
  0x25: new OpCode(0x25, 'AND', AddressingMode.DirectPage, 2),
  0x32: new OpCode(0x32, 'AND', AddressingMode.DirectPageIndirect, 2),
  0x27: new OpCode(0x27, 'AND', AddressingMode.DirectPageIndirectLong, 2),
  0x3D: new OpCode(0x3D, 'AND', AddressingMode.AbsoluteIndexedX, 3),
  0x3F: new OpCode(0x3F, 'AND', AddressingMode.AbsoluteLongIndexedX, 4),
  0x39: new OpCode(0x39, 'AND', AddressingMode.AbsoluteIndexedY, 3),
  0x35: new OpCode(0x35, 'AND', AddressingMode.DirectPageIndexedX, 2),
  0x21: new OpCode(0x21, 'AND', AddressingMode.DirectPageIndexedIndirectX, 2),
  0x31: new OpCode(0x31, 'AND', AddressingMode.DirectPageIndirectIndexedY, 2),
  0x37: new OpCode(0x37, 'AND', AddressingMode.DirectPageIndirectLongIndexedY, 2),
  0x23: new OpCode(0x23, 'AND', AddressingMode.StackRelative, 2),
  0x33: new OpCode(0x33, 'AND', AddressingMode.StackRelativeIndirectIndexedY, 2),

  // ASL - Arithmetic Shift Left
  0x0A: new OpCode(0x0A, 'ASL', AddressingMode.Accumulator, 1),
  0x0E: new OpCode(0x0E, 'ASL', AddressingMode.Absolute, 3),
  0x06: new OpCode(0x06, 'ASL', AddressingMode.DirectPage, 2),
  0x1E: new OpCode(0x1E, 'ASL', AddressingMode.AbsoluteIndexedX, 3),
  0x16: new OpCode(0x16, 'ASL', AddressingMode.DirectPageIndexedX, 2),

  // Branch instructions
  0x10: new OpCode(0x10, 'BPL', AddressingMode.PCRelative, 2),
  0x30: new OpCode(0x30, 'BMI', AddressingMode.PCRelative, 2),
  0x80: new OpCode(0x80, 'BRA', AddressingMode.PCRelative, 2),
  0x82: new OpCode(0x82, 'BRL', AddressingMode.PCRelativeLong, 3),
  0x90: new OpCode(0x90, 'BCC', AddressingMode.PCRelative, 2),
  0xB0: new OpCode(0xB0, 'BCS', AddressingMode.PCRelative, 2),
  0xD0: new OpCode(0xD0, 'BNE', AddressingMode.PCRelative, 2),
  0xF0: new OpCode(0xF0, 'BEQ', AddressingMode.PCRelative, 2),
  0x50: new OpCode(0x50, 'BVC', AddressingMode.PCRelative, 2),
  0x70: new OpCode(0x70, 'BVS', AddressingMode.PCRelative, 2),

  // BIT - Bit Test
  0x89: new OpCode(0x89, 'BIT', AddressingMode.Immediate, -2),
  0x2C: new OpCode(0x2C, 'BIT', AddressingMode.Absolute, 3),
  0x24: new OpCode(0x24, 'BIT', AddressingMode.DirectPage, 2),
  0x3C: new OpCode(0x3C, 'BIT', AddressingMode.AbsoluteIndexedX, 3),
  0x34: new OpCode(0x34, 'BIT', AddressingMode.DirectPageIndexedX, 2),

  // BRK - Break
  0x00: new OpCode(0x00, 'BRK', AddressingMode.StackInterrupt, 2),

  // Clear flag instructions
  0x18: new OpCode(0x18, 'CLC', AddressingMode.Implied, 1),
  0xD8: new OpCode(0xD8, 'CLD', AddressingMode.Implied, 1),
  0x58: new OpCode(0x58, 'CLI', AddressingMode.Implied, 1),
  0xB8: new OpCode(0xB8, 'CLV', AddressingMode.Implied, 1),

  // CMP - Compare Accumulator
  0xC9: new OpCode(0xC9, 'CMP', AddressingMode.Immediate, -2),
  0xCD: new OpCode(0xCD, 'CMP', AddressingMode.Absolute, 3),
  0xCF: new OpCode(0xCF, 'CMP', AddressingMode.AbsoluteLong, 4),
  0xC5: new OpCode(0xC5, 'CMP', AddressingMode.DirectPage, 2),
  0xD2: new OpCode(0xD2, 'CMP', AddressingMode.DirectPageIndirect, 2),
  0xC7: new OpCode(0xC7, 'CMP', AddressingMode.DirectPageIndirectLong, 2),
  0xDD: new OpCode(0xDD, 'CMP', AddressingMode.AbsoluteIndexedX, 3),
  0xDF: new OpCode(0xDF, 'CMP', AddressingMode.AbsoluteLongIndexedX, 4),
  0xD9: new OpCode(0xD9, 'CMP', AddressingMode.AbsoluteIndexedY, 3),
  0xD5: new OpCode(0xD5, 'CMP', AddressingMode.DirectPageIndexedX, 2),
  0xC1: new OpCode(0xC1, 'CMP', AddressingMode.DirectPageIndexedIndirectX, 2),
  0xD1: new OpCode(0xD1, 'CMP', AddressingMode.DirectPageIndirectIndexedY, 2),
  0xD7: new OpCode(0xD7, 'CMP', AddressingMode.DirectPageIndirectLongIndexedY, 2),
  0xC3: new OpCode(0xC3, 'CMP', AddressingMode.StackRelative, 2),
  0xD3: new OpCode(0xD3, 'CMP', AddressingMode.StackRelativeIndirectIndexedY, 2),

  // COP - Coprocessor Instruction
  0x02: new OpCode(0x02, 'COP', AddressingMode.StackInterrupt, 2),

  // CPX - Compare X Register
  0xE0: new OpCode(0xE0, 'CPX', AddressingMode.Immediate, -2),
  0xEC: new OpCode(0xEC, 'CPX', AddressingMode.Absolute, 3),
  0xE4: new OpCode(0xE4, 'CPX', AddressingMode.DirectPage, 2),

  // CPY - Compare Y Register
  0xC0: new OpCode(0xC0, 'CPY', AddressingMode.Immediate, -2),
  0xCC: new OpCode(0xCC, 'CPY', AddressingMode.Absolute, 3),
  0xC4: new OpCode(0xC4, 'CPY', AddressingMode.DirectPage, 2),

  // DEC - Decrement
  0x3A: new OpCode(0x3A, 'DEC', AddressingMode.Accumulator, 1),
  0xCE: new OpCode(0xCE, 'DEC', AddressingMode.Absolute, 3),
  0xC6: new OpCode(0xC6, 'DEC', AddressingMode.DirectPage, 2),
  0xDE: new OpCode(0xDE, 'DEC', AddressingMode.AbsoluteIndexedX, 3),
  0xD6: new OpCode(0xD6, 'DEC', AddressingMode.DirectPageIndexedX, 2),

  // DEX/DEY - Decrement Index Registers
  0xCA: new OpCode(0xCA, 'DEX', AddressingMode.Implied, 1),
  0x88: new OpCode(0x88, 'DEY', AddressingMode.Implied, 1),

  // EOR - Exclusive OR
  0x49: new OpCode(0x49, 'EOR', AddressingMode.Immediate, -2),
  0x4D: new OpCode(0x4D, 'EOR', AddressingMode.Absolute, 3),
  0x4F: new OpCode(0x4F, 'EOR', AddressingMode.AbsoluteLong, 4),
  0x45: new OpCode(0x45, 'EOR', AddressingMode.DirectPage, 2),
  0x52: new OpCode(0x52, 'EOR', AddressingMode.DirectPageIndirect, 2),
  0x47: new OpCode(0x47, 'EOR', AddressingMode.DirectPageIndirectLong, 2),
  0x5D: new OpCode(0x5D, 'EOR', AddressingMode.AbsoluteIndexedX, 3),
  0x5F: new OpCode(0x5F, 'EOR', AddressingMode.AbsoluteLongIndexedX, 4),
  0x59: new OpCode(0x59, 'EOR', AddressingMode.AbsoluteIndexedY, 3),
  0x55: new OpCode(0x55, 'EOR', AddressingMode.DirectPageIndexedX, 2),
  0x41: new OpCode(0x41, 'EOR', AddressingMode.DirectPageIndexedIndirectX, 2),
  0x51: new OpCode(0x51, 'EOR', AddressingMode.DirectPageIndirectIndexedY, 2),
  0x57: new OpCode(0x57, 'EOR', AddressingMode.DirectPageIndirectLongIndexedY, 2),
  0x43: new OpCode(0x43, 'EOR', AddressingMode.StackRelative, 2),
  0x53: new OpCode(0x53, 'EOR', AddressingMode.StackRelativeIndirectIndexedY, 2),

  // INC - Increment
  0x1A: new OpCode(0x1A, 'INC', AddressingMode.Accumulator, 1),
  0xEE: new OpCode(0xEE, 'INC', AddressingMode.Absolute, 3),
  0xE6: new OpCode(0xE6, 'INC', AddressingMode.DirectPage, 2),
  0xFE: new OpCode(0xFE, 'INC', AddressingMode.AbsoluteIndexedX, 3),
  0xF6: new OpCode(0xF6, 'INC', AddressingMode.DirectPageIndexedX, 2),

  // INX/INY - Increment Index Registers
  0xE8: new OpCode(0xE8, 'INX', AddressingMode.Implied, 1),
  0xC8: new OpCode(0xC8, 'INY', AddressingMode.Implied, 1),

  // JMP/JML - Jump
  0x4C: new OpCode(0x4C, 'JMP', AddressingMode.Absolute, 3),
  0x6C: new OpCode(0x6C, 'JMP', AddressingMode.AbsoluteIndirect, 3),
  0x7C: new OpCode(0x7C, 'JMP', AddressingMode.AbsoluteIndexedIndirect, 3),
  0x5C: new OpCode(0x5C, 'JML', AddressingMode.AbsoluteLong, 4),
  0xDC: new OpCode(0xDC, 'JML', AddressingMode.AbsoluteIndirectLong, 3),

  // JSR/JSL - Jump to Subroutine
  0x20: new OpCode(0x20, 'JSR', AddressingMode.Absolute, 3),
  0xFC: new OpCode(0xFC, 'JSR', AddressingMode.AbsoluteIndexedIndirect, 3),
  0x22: new OpCode(0x22, 'JSL', AddressingMode.AbsoluteLong, 4),

  // LDA - Load Accumulator
  0xA9: new OpCode(0xA9, 'LDA', AddressingMode.Immediate, -2),
  0xAD: new OpCode(0xAD, 'LDA', AddressingMode.Absolute, 3),
  0xAF: new OpCode(0xAF, 'LDA', AddressingMode.AbsoluteLong, 4),
  0xA5: new OpCode(0xA5, 'LDA', AddressingMode.DirectPage, 2),
  0xB2: new OpCode(0xB2, 'LDA', AddressingMode.DirectPageIndirect, 2),
  0xA7: new OpCode(0xA7, 'LDA', AddressingMode.DirectPageIndirectLong, 2),
  0xBD: new OpCode(0xBD, 'LDA', AddressingMode.AbsoluteIndexedX, 3),
  0xBF: new OpCode(0xBF, 'LDA', AddressingMode.AbsoluteLongIndexedX, 4),
  0xB9: new OpCode(0xB9, 'LDA', AddressingMode.AbsoluteIndexedY, 3),
  0xB5: new OpCode(0xB5, 'LDA', AddressingMode.DirectPageIndexedX, 2),
  0xA1: new OpCode(0xA1, 'LDA', AddressingMode.DirectPageIndexedIndirectX, 2),
  0xB1: new OpCode(0xB1, 'LDA', AddressingMode.DirectPageIndirectIndexedY, 2),
  0xB7: new OpCode(0xB7, 'LDA', AddressingMode.DirectPageIndirectLongIndexedY, 2),
  0xA3: new OpCode(0xA3, 'LDA', AddressingMode.StackRelative, 2),
  0xB3: new OpCode(0xB3, 'LDA', AddressingMode.StackRelativeIndirectIndexedY, 2),

  // LDX - Load X Register
  0xA2: new OpCode(0xA2, 'LDX', AddressingMode.Immediate, -2),
  0xAE: new OpCode(0xAE, 'LDX', AddressingMode.Absolute, 3),
  0xA6: new OpCode(0xA6, 'LDX', AddressingMode.DirectPage, 2),
  0xBE: new OpCode(0xBE, 'LDX', AddressingMode.AbsoluteIndexedY, 3),
  0xB6: new OpCode(0xB6, 'LDX', AddressingMode.DirectPageIndexedY, 2),

  // LDY - Load Y Register
  0xA0: new OpCode(0xA0, 'LDY', AddressingMode.Immediate, -2),
  0xAC: new OpCode(0xAC, 'LDY', AddressingMode.Absolute, 3),
  0xA4: new OpCode(0xA4, 'LDY', AddressingMode.DirectPage, 2),
  0xBC: new OpCode(0xBC, 'LDY', AddressingMode.AbsoluteIndexedX, 3),
  0xB4: new OpCode(0xB4, 'LDY', AddressingMode.DirectPageIndexedX, 2),

  // LSR - Logical Shift Right
  0x4A: new OpCode(0x4A, 'LSR', AddressingMode.Accumulator, 1),
  0x4E: new OpCode(0x4E, 'LSR', AddressingMode.Absolute, 3),
  0x46: new OpCode(0x46, 'LSR', AddressingMode.DirectPage, 2),
  0x5E: new OpCode(0x5E, 'LSR', AddressingMode.AbsoluteIndexedX, 3),
  0x56: new OpCode(0x56, 'LSR', AddressingMode.DirectPageIndexedX, 2),

  // MVN/MVP - Block Move
  0x54: new OpCode(0x54, 'MVN', AddressingMode.BlockMove, 3),
  0x44: new OpCode(0x44, 'MVP', AddressingMode.BlockMove, 3),

  // NOP - No Operation
  0xEA: new OpCode(0xEA, 'NOP', AddressingMode.Implied, 1),

  // ORA - Logical OR
  0x09: new OpCode(0x09, 'ORA', AddressingMode.Immediate, -2),
  0x0D: new OpCode(0x0D, 'ORA', AddressingMode.Absolute, 3),
  0x0F: new OpCode(0x0F, 'ORA', AddressingMode.AbsoluteLong, 4),
  0x05: new OpCode(0x05, 'ORA', AddressingMode.DirectPage, 2),
  0x12: new OpCode(0x12, 'ORA', AddressingMode.DirectPageIndirect, 2),
  0x07: new OpCode(0x07, 'ORA', AddressingMode.DirectPageIndirectLong, 2),
  0x1D: new OpCode(0x1D, 'ORA', AddressingMode.AbsoluteIndexedX, 3),
  0x1F: new OpCode(0x1F, 'ORA', AddressingMode.AbsoluteLongIndexedX, 4),
  0x19: new OpCode(0x19, 'ORA', AddressingMode.AbsoluteIndexedY, 3),
  0x15: new OpCode(0x15, 'ORA', AddressingMode.DirectPageIndexedX, 2),
  0x01: new OpCode(0x01, 'ORA', AddressingMode.DirectPageIndexedIndirectX, 2),
  0x11: new OpCode(0x11, 'ORA', AddressingMode.DirectPageIndirectIndexedY, 2),
  0x17: new OpCode(0x17, 'ORA', AddressingMode.DirectPageIndirectLongIndexedY, 2),
  0x03: new OpCode(0x03, 'ORA', AddressingMode.StackRelative, 2),
  0x13: new OpCode(0x13, 'ORA', AddressingMode.StackRelativeIndirectIndexedY, 2),

  // Push instructions
  0xF4: new OpCode(0xF4, 'PEA', AddressingMode.Absolute, 3),
  0xD4: new OpCode(0xD4, 'PEI', AddressingMode.DirectPageIndirect, 2),
  0x62: new OpCode(0x62, 'PER', AddressingMode.PCRelativeLong, 3),
  0x48: new OpCode(0x48, 'PHA', AddressingMode.Stack, 1),
  0x8B: new OpCode(0x8B, 'PHB', AddressingMode.Stack, 1),
  0x0B: new OpCode(0x0B, 'PHD', AddressingMode.Stack, 1),
  0x4B: new OpCode(0x4B, 'PHK', AddressingMode.Stack, 1),
  0x08: new OpCode(0x08, 'PHP', AddressingMode.Stack, 1),
  0xDA: new OpCode(0xDA, 'PHX', AddressingMode.Stack, 1),
  0x5A: new OpCode(0x5A, 'PHY', AddressingMode.Stack, 1),

  // Pull instructions
  0x68: new OpCode(0x68, 'PLA', AddressingMode.Stack, 1),
  0xAB: new OpCode(0xAB, 'PLB', AddressingMode.Stack, 1),
  0x2B: new OpCode(0x2B, 'PLD', AddressingMode.Stack, 1),
  0x28: new OpCode(0x28, 'PLP', AddressingMode.Stack, 1),
  0xFA: new OpCode(0xFA, 'PLX', AddressingMode.Stack, 1),
  0x7A: new OpCode(0x7A, 'PLY', AddressingMode.Stack, 1),

  // REP - Reset Status Bits
  0xC2: new OpCode(0xC2, 'REP', AddressingMode.Immediate, 2),

  // ROL - Rotate Left
  0x2A: new OpCode(0x2A, 'ROL', AddressingMode.Accumulator, 1),
  0x2E: new OpCode(0x2E, 'ROL', AddressingMode.Absolute, 3),
  0x26: new OpCode(0x26, 'ROL', AddressingMode.DirectPage, 2),
  0x3E: new OpCode(0x3E, 'ROL', AddressingMode.AbsoluteIndexedX, 3),
  0x36: new OpCode(0x36, 'ROL', AddressingMode.DirectPageIndexedX, 2),

  // ROR - Rotate Right
  0x6A: new OpCode(0x6A, 'ROR', AddressingMode.Accumulator, 1),
  0x6E: new OpCode(0x6E, 'ROR', AddressingMode.Absolute, 3),
  0x66: new OpCode(0x66, 'ROR', AddressingMode.DirectPage, 2),
  0x7E: new OpCode(0x7E, 'ROR', AddressingMode.AbsoluteIndexedX, 3),
  0x76: new OpCode(0x76, 'ROR', AddressingMode.DirectPageIndexedX, 2),

  // Return instructions
  0x40: new OpCode(0x40, 'RTI', AddressingMode.Stack, 1),
  0x6B: new OpCode(0x6B, 'RTL', AddressingMode.Stack, 1),
  0x60: new OpCode(0x60, 'RTS', AddressingMode.Stack, 1),

  // SBC - Subtract with Carry
  0xE9: new OpCode(0xE9, 'SBC', AddressingMode.Immediate, -2),
  0xED: new OpCode(0xED, 'SBC', AddressingMode.Absolute, 3),
  0xEF: new OpCode(0xEF, 'SBC', AddressingMode.AbsoluteLong, 4),
  0xE5: new OpCode(0xE5, 'SBC', AddressingMode.DirectPage, 2),
  0xF2: new OpCode(0xF2, 'SBC', AddressingMode.DirectPageIndirect, 2),
  0xE7: new OpCode(0xE7, 'SBC', AddressingMode.DirectPageIndirectLong, 2),
  0xFD: new OpCode(0xFD, 'SBC', AddressingMode.AbsoluteIndexedX, 3),
  0xFF: new OpCode(0xFF, 'SBC', AddressingMode.AbsoluteLongIndexedX, 4),
  0xF9: new OpCode(0xF9, 'SBC', AddressingMode.AbsoluteIndexedY, 3),
  0xF5: new OpCode(0xF5, 'SBC', AddressingMode.DirectPageIndexedX, 2),
  0xE1: new OpCode(0xE1, 'SBC', AddressingMode.DirectPageIndexedIndirectX, 2),
  0xF1: new OpCode(0xF1, 'SBC', AddressingMode.DirectPageIndirectIndexedY, 2),
  0xF7: new OpCode(0xF7, 'SBC', AddressingMode.DirectPageIndirectLongIndexedY, 2),
  0xE3: new OpCode(0xE3, 'SBC', AddressingMode.StackRelative, 2),
  0xF3: new OpCode(0xF3, 'SBC', AddressingMode.StackRelativeIndirectIndexedY, 2),

  // Set flag instructions
  0x38: new OpCode(0x38, 'SEC', AddressingMode.Implied, 1),
  0xF8: new OpCode(0xF8, 'SED', AddressingMode.Implied, 1),
  0x78: new OpCode(0x78, 'SEI', AddressingMode.Implied, 1),
  0xE2: new OpCode(0xE2, 'SEP', AddressingMode.Immediate, 2),

  // STA - Store Accumulator
  0x8D: new OpCode(0x8D, 'STA', AddressingMode.Absolute, 3),
  0x8F: new OpCode(0x8F, 'STA', AddressingMode.AbsoluteLong, 4),
  0x85: new OpCode(0x85, 'STA', AddressingMode.DirectPage, 2),
  0x92: new OpCode(0x92, 'STA', AddressingMode.DirectPageIndirect, 2),
  0x87: new OpCode(0x87, 'STA', AddressingMode.DirectPageIndirectLong, 2),
  0x9D: new OpCode(0x9D, 'STA', AddressingMode.AbsoluteIndexedX, 3),
  0x9F: new OpCode(0x9F, 'STA', AddressingMode.AbsoluteLongIndexedX, 4),
  0x99: new OpCode(0x99, 'STA', AddressingMode.AbsoluteIndexedY, 3),
  0x95: new OpCode(0x95, 'STA', AddressingMode.DirectPageIndexedX, 2),
  0x81: new OpCode(0x81, 'STA', AddressingMode.DirectPageIndexedIndirectX, 2),
  0x91: new OpCode(0x91, 'STA', AddressingMode.DirectPageIndirectIndexedY, 2),
  0x97: new OpCode(0x97, 'STA', AddressingMode.DirectPageIndirectLongIndexedY, 2),
  0x83: new OpCode(0x83, 'STA', AddressingMode.StackRelative, 2),
  0x93: new OpCode(0x93, 'STA', AddressingMode.StackRelativeIndirectIndexedY, 2),

  // STP - Stop
  0xDB: new OpCode(0xDB, 'STP', AddressingMode.Implied, 1),

  // STX - Store X Register
  0x8E: new OpCode(0x8E, 'STX', AddressingMode.Absolute, 3),
  0x86: new OpCode(0x86, 'STX', AddressingMode.DirectPage, 2),
  0x96: new OpCode(0x96, 'STX', AddressingMode.DirectPageIndexedY, 2),

  // STY - Store Y Register
  0x8C: new OpCode(0x8C, 'STY', AddressingMode.Absolute, 3),
  0x84: new OpCode(0x84, 'STY', AddressingMode.DirectPage, 2),
  0x94: new OpCode(0x94, 'STY', AddressingMode.DirectPageIndexedX, 2),

  // STZ - Store Zero
  0x9C: new OpCode(0x9C, 'STZ', AddressingMode.Absolute, 3),
  0x64: new OpCode(0x64, 'STZ', AddressingMode.DirectPage, 2),
  0x9E: new OpCode(0x9E, 'STZ', AddressingMode.AbsoluteIndexedX, 3),
  0x74: new OpCode(0x74, 'STZ', AddressingMode.DirectPageIndexedX, 2),

  // Transfer instructions
  0xAA: new OpCode(0xAA, 'TAX', AddressingMode.Implied, 1),
  0xA8: new OpCode(0xA8, 'TAY', AddressingMode.Implied, 1),
  0x5B: new OpCode(0x5B, 'TCD', AddressingMode.Implied, 1),
  0x1B: new OpCode(0x1B, 'TCS', AddressingMode.Implied, 1),
  0x7B: new OpCode(0x7B, 'TDC', AddressingMode.Implied, 1),
  0x1C: new OpCode(0x1C, 'TRB', AddressingMode.Absolute, 3),
  0x14: new OpCode(0x14, 'TRB', AddressingMode.DirectPage, 2),
  0x0C: new OpCode(0x0C, 'TSB', AddressingMode.Absolute, 3),
  0x04: new OpCode(0x04, 'TSB', AddressingMode.DirectPage, 2),
  0x3B: new OpCode(0x3B, 'TSC', AddressingMode.Implied, 1),
  0xBA: new OpCode(0xBA, 'TSX', AddressingMode.Implied, 1),
  0x8A: new OpCode(0x8A, 'TXA', AddressingMode.Implied, 1),
  0x9A: new OpCode(0x9A, 'TXS', AddressingMode.Implied, 1),
  0x9B: new OpCode(0x9B, 'TXY', AddressingMode.Implied, 1),
  0x98: new OpCode(0x98, 'TYA', AddressingMode.Implied, 1),
  0xBB: new OpCode(0xBB, 'TYX', AddressingMode.Implied, 1),

  // Miscellaneous
  0xCB: new OpCode(0xCB, 'WAI', AddressingMode.Implied, 1),
  0x42: new OpCode(0x42, 'WDM', AddressingMode.Implied, 1),
  0xEB: new OpCode(0xEB, 'XBA', AddressingMode.Implied, 1),
  0xFB: new OpCode(0xFB, 'XCE', AddressingMode.Implied, 1),
};

/**
 * Grouped opcodes by mnemonic
 */
export const GROUPED_OPCODES: Record<string, OpCode[]> = {};

// Initialize grouped opcodes
for (const opcode of Object.values(ALL_OPCODES)) {
  if (!GROUPED_OPCODES[opcode.mnem]) {
    GROUPED_OPCODES[opcode.mnem] = [];
  }
  GROUPED_OPCODES[opcode.mnem].push(opcode);
}

/**
 * Regular expressions for parsing addressing modes
 */
export const ADDRESSING_REGEX: Record<AddressingMode, RegExp> = {
  [AddressingMode.DirectPageIndexedIndirectX]: /^\(\$([A-Fa-f0-9]{2}),\s?[Xx]\)$/,
  [AddressingMode.StackRelative]: /^\$([A-Fa-f0-9]{2}),\s?[Ss]$/,
  [AddressingMode.StackInterrupt]: /^#\$([A-Fa-f0-9]{2})$/,
  [AddressingMode.DirectPage]: /^\$([A-Fa-f0-9]{2})$/,
  [AddressingMode.DirectPageIndirectLong]: /^\[\$([A-Fa-f0-9]{2})\]$/,
  [AddressingMode.Immediate]: /^#(\$[A-Fa-f0-9]{2,4}|\$?[&^*][A-Za-z0-9-+_]+)$/,
  [AddressingMode.Absolute]: /^\$([A-Fa-f0-9]{4}|&[A-Za-z0-9-+_]+)$/,
  [AddressingMode.AbsoluteLong]: /^\$([A-Fa-f0-9]{6}|\@[A-Za-z0-9-+_]+)$/,
  [AddressingMode.DirectPageIndirectIndexedY]: /^\(\$([A-Fa-f0-9]{2})\),\s?[Yy]$/,
  [AddressingMode.DirectPageIndirect]: /^\(\$([A-Fa-f0-9]{2})\)$/,
  [AddressingMode.StackRelativeIndirectIndexedY]: /^\(\$([A-Fa-f0-9]{2}),\s?[Ss]\),\s?[Yy]$/,
  [AddressingMode.DirectPageIndexedX]: /^\$([A-Fa-f0-9]{2}),\s?[Xx]$/,
  [AddressingMode.DirectPageIndirectLongIndexedY]: /^\[\$([A-Fa-f0-9]{2})\],\s?[Yy]$/,
  [AddressingMode.AbsoluteIndexedY]: /^(\$[A-Fa-f0-9]{4}|\$?&[A-Za-z0-9-+_]+),\s?[Yy]$/,
  [AddressingMode.AbsoluteIndexedX]: /^(\$[A-Fa-f0-9]{4}|\$?&[A-Za-z0-9-+_]+),\s?[Xx]$/,
  [AddressingMode.AbsoluteLongIndexedX]: /^(\$[A-Fa-f0-9]{6}|\$?@[A-Za-z0-9-+_]+),\s?[Xx]$/,
  [AddressingMode.AbsoluteIndexedIndirect]: /^\((\$[A-Fa-f0-9]{4}|\$?&[A-Za-z0-9-+_]+),\s*[Xx]\)$/,
  [AddressingMode.BlockMove]: /^#\$([A-Fa-f0-9]{2}|\^[A-Za-z0-9-+_]+),\s?#\$([A-Fa-f0-9]{2}|\^[A-Za-z0-9-+_]+)$/,
  // Default entries for other addressing modes
  [AddressingMode.Implied]: /^$/,
  [AddressingMode.Accumulator]: /^[Aa]$/,
  [AddressingMode.PCRelative]: /^/,
  [AddressingMode.PCRelativeLong]: /^/,
  [AddressingMode.AbsoluteIndirect]: /^/,
  [AddressingMode.AbsoluteIndirectLong]: /^/,
  [AddressingMode.DirectPageIndexedY]: /^/,
  [AddressingMode.Stack]: /^/,
};

/**
 * Hex character validation regex
 */
export const HEX_REGEX = /[^A-Fa-f0-9]/g;

/**
 * Utility methods for OpCode class
 */
export class OpCodeUtils {
  /**
   * Get all available opcodes
   */
  public static getAllOpcodes(): OpCode[] {
    return Object.values(ALL_OPCODES);
  }

  /**
   * Get opcodes by mnemonic
   */
  public static getByMnemonic(mnemonic: string): OpCode[] {
    return GROUPED_OPCODES[mnemonic] || [];
  }

  /**
   * Find opcode by hex value
   */
  public static findByCode(code: number): OpCode | undefined {
    return ALL_OPCODES[code];
  }
} 