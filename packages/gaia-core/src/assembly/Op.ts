import { CopDef } from 'gaia-shared';
import { OpCode } from './OpCode';

/**
 * Represents a single assembly operation/instruction
 */
export class Op {
  public code: OpCode;
  public location: number;
  public operands: unknown[];
  public size: number;
  public copDef?: CopDef;

  constructor(
    code: OpCode,
    location: number = 0,
    operands: unknown[] = [],
    size: number = 1
  ) {
    this.code = code;
    this.location = location;
    this.operands = operands;
    this.size = size;
  }

  /**
   * Get the formatted string representation of this operation
   */
  public toString(): string {
    const mnem = this.code.mnem;
    const op = this.operands;
    
    if (!op || op.length === 0) {
      return mnem;
    }

    // Format operands based on count
    const operandStrings = op.map(operand => String(operand));
    return `${mnem} ${operandStrings.join(', ')}`;
  }
} 