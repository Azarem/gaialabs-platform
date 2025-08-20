
/**
 * Represents a 65816 processor opcode
 */
export class OpCode {
  public code: number;
  public mnem: string;
  public mode: string;
  public size: number;

  constructor(code: number, mnem: string, mode: string, size: number) {
    this.code = code;
    this.mnem = mnem;
    this.mode = mode;
    this.size = size;
  }
}

/**
 * Hex character validation regex
 */
export const HEX_REGEX = /[^A-Fa-f0-9]/g;
