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
  transforms?: { key: string; value: string }[];
  postProcess?: string;
  // Internal references (handled by database root)
  root?: any; // DbRoot reference
  mnemonics?: Record<number, string>;
}

/**
 * Database block utilities
 */
export class DbBlockUtils {
  /**
   * Check if a location is outside this block and return the part (matches C# IsOutside)
   * Returns [isOutside, part] where part is the part containing the location
   */
  static isOutsideWithPart(block: DbBlock, location: number): [boolean, DbPart | null] {
    const [isInside, part] = this.isInsideWithPart(block, location);
    if (isInside) {
      return [false, part];
    }

    // Find chunk this reference belongs to
    if (block.root?.blocks) {
      for (const otherBlock of block.root.blocks) {
        if (otherBlock !== block) {
          const [otherIsInside, otherPart] = this.isInsideWithPart(otherBlock, location);
          if (otherIsInside) {
            return [true, otherPart];
          }
        }
      }
    }

    return [true, null];
  }

  /**
   * Check if a location is inside this block and return the part (matches C# IsInside)
   * Returns [isInside, part] where part is the part containing the location
   */
  static isInsideWithPart(block: DbBlock, location: number): [boolean, DbPart | null] {
    for (const part of block.parts) {
      if (DbPartUtils.isInside(part, location)) {
        return [true, part];
      }
    }
    return [false, null];
  }

  /**
   * Check if a location is outside this block (shorthand version)
   */
  static isOutside(block: DbBlock, location: number): boolean {
    const [isOutside] = this.isOutsideWithPart(block, location);
    return isOutside;
  }

  /**
   * Check if a location is inside this block (shorthand version)
   */
  static isInside(block: DbBlock, location: number): boolean {
    const [isInside] = this.isInsideWithPart(block, location);
    return isInside;
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