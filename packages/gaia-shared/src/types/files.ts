import { BinType } from './resources';
import { AsmBlock, AsmBlockUtils } from './assembly';
import { DbFile } from '../database/files';
import { DbBlock } from '../database/blocks';
import { ICompressionProvider } from './compression';

/**
 * Chunk file for ROM processing
 * Converted from GaiaLib/Types/ChunkFile.cs
 */
export interface ChunkFile {
  //path: string;
  name: string;
  size: number;
  location: number;
  type: BinType;
  parts?: AsmBlock[];
  includes?: Set<string>;
  includeLookup?: Map<string, AsmBlock>;
  bank?: number;
  compressed?: boolean;
  upper?: boolean;
  rawData?: Uint8Array | null;
  textData?: string;
  transforms?: { key: string; value: string }[];
  postProcess?: string;
  mnemonics: Record<number, string>;
  group?: string;
}

/**
 * Creates a new ChunkFile
 */
export function createChunkFile(name: string, size: number, location: number, type: BinType): ChunkFile {
  return {
    name,
    size,
    location,
    type,
    mnemonics: {}
  };
}

export function createChunkFileFromDbFile(rom: Uint8Array, compression: ICompressionProvider, dbFile: DbFile): ChunkFile {
  // Create ChunkFile with the DbFile's type
  const chunkFile = createChunkFile(dbFile.name, dbFile.end - dbFile.start, dbFile.start, dbFile.type);
  chunkFile.compressed = dbFile.compressed;
  chunkFile.upper = dbFile.upper;
  
  // Enrich with raw binary data
  enrichWithRawDataFromDbFile(rom, chunkFile, compression, dbFile);

  return chunkFile;
}

export function createChunkFileFromDbBlock(block: DbBlock): ChunkFile {
  // Create assembly ChunkFile
  const chunkFile = createChunkFile(block.name, 0, 0, BinType.Assembly);
  chunkFile.group = block.group;
  
  // Enrich with AsmBlock parts
  enrichWithPartsFromDbBlock(chunkFile, block);
  
  return chunkFile;
}


function combineHeader(
  data: Uint8Array,
  position: number,
  length: number,
  header: Uint8Array | null,
  type: BinType
): Uint8Array {
  let totalLength = length + (header ? header.length : 0);
  if (type === BinType.Palette && length < 0x200) {
    totalLength += (0x200 - length);
  }
  const result = new Uint8Array(totalLength);
  let offset = 0;
  if (header) { result.set(header, offset); offset += header.length; }
  result.set(data.slice(position, position + length), offset);
  offset += length;
  if (type === BinType.Palette && length < 0x200) {
    result.fill(0, offset, offset + (0x200 - length));
  }
  return result;
}

/**
 * Enriches ChunkFile with raw binary data from DbFile
 */
function enrichWithRawDataFromDbFile(rom: Uint8Array, chunkFile: ChunkFile, compression: ICompressionProvider, dbFile: DbFile): void {
  
  // Extract raw data (uncompressed) with headers for specific types
  let start = dbFile.start;
  let header: Uint8Array | null = null;
  if (dbFile.type === BinType.Tilemap) {
    header = new Uint8Array([rom[start++], rom[start++]]);
  } else if (dbFile.type === BinType.Meta17) {
    header = new Uint8Array([rom[start++], rom[start++], rom[start++], rom[start++]]);
  }
  let length = dbFile.end - start;
  let fileData: Uint8Array;
  if (dbFile.compressed === true) {
    const expanded = compression.expand(rom, start, length);
    fileData = combineHeader(expanded, 0, expanded.length, header, dbFile.type);
  } else {
    if (dbFile.compressed !== undefined) {
      start += 2; length -= 2; // skip zero-compression header
    }
    fileData = combineHeader(rom, start, length, header, dbFile.type);
  }
  
  const hasSizePrefix = chunkFile.compressed !== undefined || dbFile.type === BinType.Sound;

  // Binary files get rawData
  chunkFile.rawData = fileData;
  chunkFile.size = fileData.length + (hasSizePrefix ? 2 : 0);
}

/**
 * Enriches ChunkFile with AsmBlock parts from DbBlock
 */
function enrichWithPartsFromDbBlock(chunkFile: ChunkFile, block: DbBlock): void {
  chunkFile.parts = [];
  chunkFile.size = 0;
  chunkFile.location = block.parts[0].start;
  chunkFile.bank = block.movable ? undefined : chunkFile.location >> 16;
  chunkFile.transforms = block.transforms;
  chunkFile.postProcess = block.postProcess;
  
  for (const part of block.parts) {
    const asmBlock = new AsmBlock(
      part.start,
      part.size,
      false, // isString will be determined during processing
      part.name,
      part.struct || undefined,
      part.bank
    );
    chunkFile.size += part.size;
    chunkFile.parts.push(asmBlock);
  }
}

/**
 * Chunk file utilities
 */
export class ChunkFileUtils {
  /**
   * Rebase blocks to a new location
   */
  static rebase(chunkFile: ChunkFile, newLocation?: number): void {
    if (newLocation !== undefined) {
      chunkFile.location = newLocation;
    }

    if (!chunkFile.parts) {
      return;
    }

    let loc = chunkFile.location;
    for (let x = 0; x < chunkFile.parts.length; x++) {
      const block = chunkFile.parts[x];
      if (x > 0 && !block.label) {
        break;
      }
      block.location = loc;
      loc += block.size || 0;
    }
  }

  /**
   * Calculate the total size of all blocks
   */
  static calculateSize(chunkFile: ChunkFile): number {
    if (!chunkFile.parts) {
      return chunkFile.size;
    }

    let size = 0;
    for (let x = 0; x < chunkFile.parts.length; x++) {
      const block = chunkFile.parts[x];
      if (x > 0 && !block.label) {
        break;
      }
      size += block.size || 0;
    }
    
    chunkFile.size = size;
    return size;
  }

    /**
   * Check if a location is outside this block and return the part (matches C# IsOutside)
   * Returns [isOutside, part] where part is the part containing the location
   */
  static isOutsideWithPart(root: ChunkFile[], block: ChunkFile, location: number): [boolean, ChunkFile | null, AsmBlock | null] {
    const [isInside, part] = this.isInsideWithPart(block, location);
    if (isInside) {
      return [false, block, part];
    }

    // Find chunk this reference belongs to
    for (const otherBlock of root) {
      if (otherBlock !== block) {
        const [otherIsInside, otherPart] = this.isInsideWithPart(otherBlock, location);
        if (otherIsInside) {
          return [true, otherBlock, otherPart];
        }
      }
    }

    return [true, null, null];
  }

  /**
   * Check if a location is inside this block and return the part (matches C# IsInside)
   * Returns [isInside, part] where part is the part containing the location
   */
  static isInsideWithPart(block: ChunkFile, location: number): [boolean, AsmBlock | null] {
    for (const part of block?.parts || []) {
      if (AsmBlockUtils.isInside(part, location)) {
        return [true, part];
      }
    }
    return [false, null];
  }

  /**
   * Check if a location is outside this block (shorthand version)
   */
  static isOutside(block: ChunkFile, location: number): boolean {
    return !this.isInside(block, location);
  }

  /**
   * Check if a location is inside this block (shorthand version)
   */
  static isInside(block: ChunkFile, location: number): boolean {
    for (const part of block?.parts || []) {
      if (AsmBlockUtils.isInside(part, location)) {
        return true;
      }
    }
    return false;
  }

  /**
   * Get all included blocks
   */
  static getIncludes(chunkFile: ChunkFile): ChunkFile[] {
    if(!chunkFile.parts) return [];
    const includes: ChunkFile[] = [];
    const seen = new Set<ChunkFile>();

    for (const part of chunkFile.parts) {
      if (part?.includes) {
        for (const includedPart of part.includes) {
          if (!seen.has(includedPart.block)) {
            includes.push(includedPart.block);
            seen.add(includedPart.block);
          }
        }
      }
    }

    return includes;
  }
} 