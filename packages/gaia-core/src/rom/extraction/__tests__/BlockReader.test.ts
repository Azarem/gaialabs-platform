import { describe, it, expect, beforeAll } from 'vitest';
import { createReadStream } from 'fs';
import unzipper from 'unzipper';
import { readFileAsText } from 'gaia-shared';
import { DbRootUtils } from 'gaia-shared';
import { BlockReader } from '../blocks';
import { BlockWriter } from '../writer';

describe('BlockReader', () => {
  let reader: BlockReader;
  let writer: BlockWriter;

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
      reader.analyzeAndResolve();
    });

    it('should have a valid blocks list', () => {
      expect(reader._root.blocks).toBeDefined();
      expect(reader._root.blocks.length).toBeGreaterThan(0);
    });

    it('should be filled with arrays that have at least one element', () => {
      expect(reader._root.blocks.filter(b => Array.isArray(b.parts) && b.parts.length > 0 &&
        b.parts.filter(p => Array.isArray(p.objectRoot) && p.objectRoot.length > 0
          && p.objectRoot.every(o => o.location > 0 && !!o.object)).length == b.parts.length
      ).length).toEqual(reader._root.blocks.length);
    });

    // it('should pass a single source of truth', async () => {
    //   const block = reader._root.blocks.find(b => b.name === 'sE6_gaia');
    //   if (!block) {
    //     throw new Error('sE6_gaia block not found');
    //   }
    //   const truthPath = `../../truth/asm/${block.group ? (block.group + '/') : ''}${block.name}.asm`;
    //   const truthContent = await readFileAsText(truthPath);
    //   const asm = writer.generateAsm(block);
    //   expect(asm).toEqual(truthContent);
    // });

    it('should pass multiple sources of truth', async () => {
      for(const block of reader._root.blocks) {
        const asm = writer.generateAsm(block);
        const truthPath = `../../truth/asm/${block.group ? (block.group + '/') : ''}${block.name}.asm`;
        const truthContent = await readFileAsText(truthPath);
        expect(asm).toEqual(truthContent);
      }
    });
  });

}); 