import { ChunkFile } from "./files";
import { TableEntry } from "./tables";

/**
 * Represents a block of assembly code or data
 */
export class AsmBlock {
  public label?: string;
  public location: number;
  public size: number;
  public isString: boolean;
  public objList: any[];
  public structName?: string;
  public bank?: number;
  public includes?: Set<{block: ChunkFile, part: AsmBlock}>;

  constructor(
    location: number = 0,
    size: number = 0,
    isString: boolean = false,
    label?: string,
    structName?: string,
    bank?: number
  ) {
    this.label = label;
    this.location = location;
    this.size = size;
    this.isString = isString;
    this.objList = [];
    this.structName = structName;
    this.bank = bank;
    this.includes = new Set();
  }
} 

/**
 * Database part utilities
 */
export class AsmBlockUtils {
  /**
   * Check if a location is inside this part
   */
  static isInside(part: AsmBlock, location: number): boolean {
    return location >= part.location && location < (part.location + part.size);
  }

  /**
   * Check if a location is outside this part
   */
  static isOutside(part: AsmBlock, location: number): boolean {
    return location < part.location || location >= (part.location + part.size);
  }
} 