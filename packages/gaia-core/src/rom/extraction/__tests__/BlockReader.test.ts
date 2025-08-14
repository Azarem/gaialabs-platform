import { describe, it, expect, beforeAll } from 'vitest';
import { createReadStream } from 'fs';
import unzipper from 'unzipper';
import { readFileAsText, ChunkFile, BinType } from '@gaialabs/shared';
import { DbRootUtils } from '@gaialabs/shared';
import { BlockReader } from '../blocks';
import { BlockWriter } from '../writer';

describe('BlockReader', () => {
  let reader: BlockReader;
  let writer: BlockWriter;
  let chunkFiles: ChunkFile[];
  let asmFiles: ChunkFile[];

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
    writer = new BlockWriter(reader);
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

    it('should have a valid blocks list', () => {
      expect(chunkFiles).toBeDefined();
      expect(chunkFiles.length).toBeGreaterThan(0);
    });

    it('should be filled with arrays that have at least one element', () => {
      asmFiles = chunkFiles.filter(b => b.type === BinType.Assembly);
      expect(asmFiles.filter(b => Array.isArray(b.parts) && b.parts.length > 0 &&
        b.parts.filter(p => Array.isArray(p.objList) && p.objList.length > 0
          && p.objList.every(o => o.location > 0 && !!o.object)).length == b.parts.length
      ).length).toEqual(asmFiles.length);
    });
  });

  describe('BlockReader ASM content', () => {
    it('should pass multiple sources of truth', async () => {
      for(const block of asmFiles) {
        const asm = writer.generateAsm(block);
        const truthPath = `../../truth/asm/${block.group ? (block.group + '/') : ''}${block.name}.asm`;
        console.log(`Validating content of "${truthPath}" vs "${truthPath.replace('truth', 'working')}"`);
        const truthContent = await readFileAsText(truthPath);
        expect(asm).toEqual(truthContent);
      }
    }, 30000);
  });

}); 