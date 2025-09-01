import { describe, it, expect, beforeAll } from 'vitest';
import { createReadStream } from 'fs';
import unzipper from 'unzipper';
import { readFileAsText, ChunkFile, BinType, listDirectory, DirectoryEntry, ChunkFileUtils, crc32_buffer, saveFileAsBinary } from '@gaialabs/shared';
import { DbRootUtils } from '@gaialabs/shared';
import { BlockReader } from '../blocks';
import { BlockWriter } from '../writer';
import { Assembler } from '../../rebuild/assembler';
import { RomProcessor } from '../../rebuild/processor';
import { RomLayout } from '../../rebuild/layout';
import { RomWriter } from '../../rebuild/writer';

describe('BlockReader', () => {
  let reader: BlockReader;
  let writer: BlockWriter;
  let chunkFiles: ChunkFile[];
  let asmFiles: ChunkFile[];
  let patchFiles: ChunkFile[] = [];
  let crc: number;
  let blockLookup: Map<string, number> = new Map();
  let romWriter: RomWriter;

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

    crc = crc32_buffer(data);
    const dbRoot2 = await DbRootUtils.fromFolder(
      '../../ext/GaiaLib/db/us',
      '../../ext/GaiaLib/db/snes'
    );
    const dbRoot = await DbRootUtils.fromSupabase();
    reader = new BlockReader(data, dbRoot);
    writer = new BlockWriter(reader);
    romWriter = new RomWriter(dbRoot.entryPoints, "GAIALABS", "01JGGL");
  }, 30000);

  describe('BlockReader class', () => {
    it('should create a block reader with correct properties', () => {
      expect(reader).toBeInstanceOf(BlockReader);
    });

    it('should have a valid dbRoot', () => {
      expect(reader._root).toBeDefined();
    });

    it('should have a valid crc', () => {
      expect(crc).toEqual(0x1C3848C0);
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
        block.textData = asm;
        const truthPath = `../../truth/asm/${block.group ? (block.group + '/') : ''}${block.name}.asm`;
        console.log(`Validating content of "${truthPath}" vs "${truthPath.replace('truth', 'working')}"`);
        const truthContent = await readFileAsText(truthPath);
        expect(asm).toEqual(truthContent);
      }
    }, 30000);
  });
  
  describe('Assembler process', () => {
    it('Should be able to assemble code', () => {
      for(const block of asmFiles) {
        const assembler = new Assembler(reader._root, block.textData!);
        const { blocks, includes, reqBank } = assembler.parseAssembly();
        block.parts = blocks;
        block.includes = includes;
        block.bank = reqBank ?? undefined;
        expect(blocks.length).toBeGreaterThan(0);
      }
    }, 30000);
  });

  describe('Patching process', () => {
    it('Should be able to process patch files', async () => {
      expect(reader._root.chunkPatches).toBeDefined();
      expect(reader._root.chunkPatches?.length).toBeGreaterThan(0);

      for (const chunkFile of reader._root.chunkPatches!) {
        // Parse the patch file with the assembler
        console.log(`Processing patch: ${chunkFile.name}`);

        const existing = chunkFiles.find(x => x.name === chunkFile.name);

        if(chunkFile.type === BinType.Patch || chunkFile.type === BinType.Assembly) {
          const assembler = new Assembler(reader._root, chunkFile.textData!);
          const { blocks, includes, reqBank } = assembler.parseAssembly();
          
          expect(blocks.length).toBeGreaterThan(0);

          const target = existing ?? chunkFile;
          target.parts = blocks;
          target.includes = includes;
          target.bank = reqBank ?? undefined;
          
          if(!existing){
            if(chunkFile.type === BinType.Patch) {
              patchFiles.push(chunkFile);
            }
            asmFiles.push(chunkFile);
            chunkFiles.push(chunkFile);
          }
        } else {
          if(existing){
            existing.rawData = chunkFile.rawData;
            existing.size = chunkFile.size;
          } else {
            chunkFiles.push(chunkFile);
          }
        }
      }

      console.log(`Successfully processed ${patchFiles.length} patch files`);
    }, 60000);

    it('Should be able to apply assembly patches', async () => {
      RomProcessor.applyPatches(asmFiles, patchFiles);
    }, 10000);
  });

  describe("Build process", () => {
    it("Should be able to calculate sizes", async () => {
      // Calculate ASM sizes
      for (const asm of asmFiles) {
        ChunkFileUtils.calculateSize(asm);
      }

      // Assign locations
      const layout = new RomLayout(chunkFiles);
      layout.organize();
  
      // Rebase assemblies
      for (const file of asmFiles) {
        ChunkFileUtils.rebase(file);
      }
    });

    it("Should be able to generate lookups", async () => {
      
      // Build include lookup map per asm file
      for (const f of asmFiles) {
        const includeBlocks = asmFiles
          .filter(x => f.includes?.has(x.name.toUpperCase()))
          .flatMap(x => x.parts!)
          .filter(b => !!b.label);

        f.includeLookup = new Map();

        for (const b of includeBlocks) {
          if (b.label) f.includeLookup.set(b.label.toUpperCase(), b);
        }

        for (const b of (f.parts || []).filter(x => !!x.label)) {
          if (b.label) f.includeLookup.set(b.label.toUpperCase(), b);
        }
      }

      // Create block lookup for resolving labels to locations
      //blockLookup = new Map<string, number>();
      for (const f of chunkFiles) {
        blockLookup.set(f.name.toUpperCase(), f.location);
      }

      expect(blockLookup).toBeDefined();
      expect(blockLookup.size).toBeGreaterThan(0);
    });
  });

  describe('Writing process', () => {
    it('Should be able to write the ROM', async () => {

      expect(romWriter.outBuffer).toBeDefined();

      // Write all files
      for (const file of chunkFiles) {
        await romWriter.writeFile(file, blockLookup);
      }

      romWriter.writeHeader();
      romWriter.writeEntryPoints(asmFiles);

      const header = romWriter.outBuffer.subarray(0xFFB0, 0xFFB0 + 6);
      expect(header).toEqual(new Uint8Array(Buffer.from('01JGGL')));

      const title = romWriter.outBuffer.subarray(0xFFB0 + 16, 0xFFB0 + 16 + 21);
      expect(title).toEqual(new Uint8Array(Buffer.from('GAIALABS             ')));

      await saveFileAsBinary('../../../GaiaLabs.smc', romWriter.outBuffer);
    });
  });
}); 