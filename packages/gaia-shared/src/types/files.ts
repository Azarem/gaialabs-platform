import { BinType } from './resources';
import { AsmBlock } from './assembly';

/**
 * Chunk file for ROM processing
 * Converted from GaiaLib/Types/ChunkFile.cs
 */
export interface ChunkFile {
  path: string;
  name: string;
  size: number;
  location: number;
  blocks?: AsmBlock[];
  includes?: Set<string>;
  includeLookup: Map<string, AsmBlock>;
  bank?: number;
  type: BinType;
  compressed?: boolean;
  upper: boolean;
}

/**
 * Creates a new ChunkFile
 */
export function createChunkFile(path: string, type: BinType): ChunkFile {
  const name = path.split('/').pop()?.split('.')[0] || '';
  
  // Determine if file should be compressed based on type
  const compressed = type === BinType.Bitmap || 
                    type === BinType.Tilemap || 
                    type === BinType.Tileset || 
                    type === BinType.Spritemap || 
                    type === BinType.Meta17 ? false : undefined;

  return {
    path,
    name,
    size: 0, // Size would be determined by file system in actual implementation
    location: 0,
    includeLookup: new Map(),
    type,
    compressed,
    upper: false
  };
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

    if (!chunkFile.blocks) {
      return;
    }

    let loc = chunkFile.location;
    for (let x = 0; x < chunkFile.blocks.length; x++) {
      const block = chunkFile.blocks[x];
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
    if (!chunkFile.blocks) {
      return chunkFile.size;
    }

    let size = 0;
    for (let x = 0; x < chunkFile.blocks.length; x++) {
      const block = chunkFile.blocks[x];
      if (x > 0 && !block.label) {
        break;
      }
      size += block.size || 0;
    }
    
    chunkFile.size = size;
    return size;
  }
} 