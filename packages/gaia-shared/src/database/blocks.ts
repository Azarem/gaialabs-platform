import type { DbPart } from './parts';
import { DbPartUtils } from './parts';

/**
 * Database block definition
 * Converted from GaiaLib/Database/DbBlock.cs
 */
export interface DbBlock {
  name: string;
  movable: boolean;
  group: string;
  parts: DbPart[];
  
  // Internal references (handled by database root)
  root?: any; // DbRoot reference
  mnemonics?: Record<number, string>;
}

/**
 * Database block utilities
 */
export class DbBlockUtils {
  /**
   * Check if a location is outside this block
   */
  static isOutside(block: DbBlock, location: number): boolean {
    let foundPart: DbPart | null = null;
    
    if (this.isInside(block, location, foundPart)) {
      return false;
    }

    // Find chunk this reference belongs to
    if (block.root?.blocks) {
      for (const otherBlock of block.root.blocks) {
        if (otherBlock !== block && this.isInside(otherBlock, location, foundPart)) {
          return true;
        }
      }
    }

    return true;
  }

  /**
   * Check if a location is inside this block
   */
  static isInside(block: DbBlock, location: number, foundPart?: DbPart | null): boolean {
    for (const part of block.parts) {
      if (DbPartUtils.isInside(part, location)) {
        if (foundPart !== undefined) {
          foundPart = part;
        }
        return true;
      }
    }

    if (foundPart !== undefined) {
      foundPart = null;
    }
    return false;
  }

  /**
   * Get all included blocks
   */
  static getIncludes(block: DbBlock): DbBlock[] {
    const includes: DbBlock[] = [];
    const seen = new Set<DbBlock>();

    for (const part of block.parts) {
      if (part.includes) {
        for (const includedPart of part.includes) {
          if (includedPart._block && !seen.has(includedPart._block)) {
            includes.push(includedPart._block);
            seen.add(includedPart._block);
          }
        }
      }
    }

    return includes;
  }
} 