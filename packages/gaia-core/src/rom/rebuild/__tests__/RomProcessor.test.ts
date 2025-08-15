import { describe, it, expect, beforeAll } from 'vitest';
import { createReadStream } from 'fs';
import unzipper from 'unzipper';
import { readFileAsText, ChunkFile, BinType } from '@gaialabs/shared';
import { DbRootUtils, ChunkFileUtils } from '@gaialabs/shared';
import { BlockReader } from '../../extraction/blocks';
import { RomProcessor } from '../processor';
import { RomLayout } from '../layout';
import { RomWriter } from '../writer';

describe('RomProcessor', () => {
  let reader: BlockReader;
  let writer: RomWriter;
  let chunkFiles: ChunkFile[];
  let asmFiles: ChunkFile[];
  let rebuildBuffer: Uint8Array;

  beforeAll(async () => {
    const data = await new Promise<Buffer>((resolve, reject) => {
      createReadStream('../../truth/stripped.zip')
        .pipe(unzipper.Parse())
        .on('entry', async (entry: any) => {
          if (entry.path === 'stripped.smc') {
            const buffer = await entry.buffer();
            resolve(buffer);
          } else {
            entry.autodrain();
          }
        })
        .on('error', reject);
    });

    const dbRoot = await DbRootUtils.fromFolder(
      '../../ext/GaiaLib/db/us',
      '../../ext/GaiaLib/db/snes'
    );
    reader = new BlockReader(data, dbRoot);
  }, 30000);

  describe('BlockReader class', () => {
    it('should create a block reader with correct properties', () => {
      expect(reader).toBeInstanceOf(BlockReader);
    });

    it('should have a valid dbRoot', () => {
      expect(reader._root).toBeDefined();
    });

  });

  describe('BlockReader.analyzeAndResolve', () => {
    it('should analyze and resolve the blocks', () => {
      chunkFiles = reader.analyzeAndResolve();
    });

    it('should be able to repack the rom', async () => {
      
      const writer = new RomWriter(reader._root.entryPoints);
      rebuildBuffer = await writer.repack(chunkFiles);
      expect(rebuildBuffer).toBeDefined();
      expect(rebuildBuffer.length).toBe(0x400000);

    }, 30000);
  });

}); 