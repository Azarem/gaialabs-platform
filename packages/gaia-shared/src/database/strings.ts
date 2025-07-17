import { MemberType } from '../types/members';

/**
 * Database string command definition
 * Converted from GaiaLib/Database/DbStringCommand.cs
 */
export interface DbStringCommand {
  set: string;
  key: number;
  value: string;
  types: MemberType[];
  delimiter?: number;
  halt: boolean;
}

/**
 * Database string layer definition
 * Converted from GaiaLib/Database/DbStringLayer.cs
 */
export interface DbStringLayer {
  type: string;
  base: number;
  map: string[];
}

/**
 * Database string type definition
 * Converted from GaiaLib/Database/DbStringType.cs
 */
export interface DbStringType {
  name: string;
  delimiter: string;
  terminator: number;
  shiftType?: string;
  characterMap: string[];
  commands: Record<number, DbStringCommand>;
  layers: DbStringLayer[];
  greedyTerminator: boolean;
}

/**
 * String type utilities
 */
export class DbStringTypeUtils {
  // Shift functions (simplified versions of C# implementation)
  private static readonly shiftDownFunctions: Record<string, (x: number) => number> = {
    '': (x) => x,
    'h2': (x) => (((x & 0xE0) >> 1) | (x & 0x0F)),
    'wh2': (x) => (((x & 0x70) >> 1) | (x & 0x07))
  };

  private static readonly shiftUpFunctions: Record<string, (x: number) => number> = {
    '': (x) => x,
    'h2': (x) => (((x & 0x70) << 1) | (x & 0x0F)),
    'wh2': (x) => (((x & 0x38) << 1) | (x & 0x07))
  };

  public static getShiftDown(shiftType?: string): (x: number) => number {
    return this.shiftDownFunctions[shiftType || ''] || this.shiftDownFunctions[''];
  }

  public static getShiftUp(shiftType?: string): (x: number) => number {
    return this.shiftUpFunctions[shiftType || ''] || this.shiftUpFunctions[''];
  }
} 