import { HexString } from '../types/hex';

/**
 * Database part definition
 * Converted from GaiaLib/Database/DbPart.cs
 */
export interface DbPart {
  name: string;
  start: number;
  end: number;
  struct: string;
  bank?: HexString;
  block: string;
  
  // Internal references (handled by database root)
  _block?: any; // DbBlock reference
  includes?: Set<DbPart>;
  objectRoot?: unknown;
}

/**
 * Database part utilities
 */
export class DbPartUtils {
  /**
   * Check if a location is inside this part
   */
  static isInside(part: DbPart, location: number): boolean {
    return location >= part.start && location < part.end;
  }

  /**
   * Check if a location is outside this part
   */
  static isOutside(part: DbPart, location: number): boolean {
    return location < part.start || location >= part.end;
  }
} 