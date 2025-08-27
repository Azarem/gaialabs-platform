import { describe, it, expect, beforeAll } from 'vitest';
import { createReadStream } from 'fs';
import unzipper from 'unzipper';
import { readFileAsText, ChunkFile, BinType, listDirectory, DirectoryEntry, ChunkFileUtils, crc32_buffer } from '@gaialabs/shared';
import { DbRootUtils } from '@gaialabs/shared';
import { BlockReader } from '../blocks';
import { BlockWriter } from '../writer';
import { Assembler } from '../../rebuild/assembler';
import { RomProcessor } from '../../rebuild/processor';
import { RomLayout } from '../../rebuild/layout';

describe('BlockReader', () => {
  let reader: BlockReader;
  let writer: BlockWriter;
  let chunkFiles: ChunkFile[];
  let asmFiles: ChunkFile[];
  let patchFiles: ChunkFile[] = [];
  let crc: number;

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
  
  // describe('Assembler process', () => {
  //   it('Should be able to assemble code', () => {
  //     for(const block of asmFiles) {
  //       const assembler = new Assembler(reader._root, block.textData!);
  //       const { blocks, includes, reqBank } = assembler.parseAssembly();
  //       block.parts = blocks;
  //       block.includes = includes;
  //       block.bank = reqBank ?? undefined;
  //       expect(block.parts.length).toBeGreaterThan(0);
  //     }
  //   }, 30000);
  // });
  
  // describe('Patching process', () => {
  //   it('Should be able to process patch files', async () => {
  //     // Get all .asm files from the patches directory
  //     const patchesDir = '../../truth/patches';
  //     const patchEntries = await listDirectory(patchesDir, { 
  //       extension: '.asm',
  //       filter: (entry: DirectoryEntry) => entry.isFile 
  //     });

  //     expect(patchEntries.length).toBeGreaterThan(0);
  //     console.log(`Found ${patchEntries.length} patch files`);

  //     for (const entry of patchEntries) {
  //       // Read the patch file content
  //       const patchContent = await readFileAsText(entry.path);
        
  //       // Create a ChunkFile record for this patch
  //       const baseName = entry.name.replace('.asm', '');
  //       const chunkFile: ChunkFile = {
  //         name: baseName,
  //         type: BinType.Assembly,
  //         textData: patchContent,
  //         parts: [],
  //         bank: undefined,
  //         includes: new Set<string>(),
  //         group: 'patches'
  //       };

  //       // Parse the patch file with the assembler
  //       console.log(`Processing patch: ${entry.name}`);
  //       const assembler = new Assembler(reader._root, patchContent);
  //       const { blocks, includes, reqBank } = assembler.parseAssembly();
        
  //       chunkFile.parts = blocks;
  //       chunkFile.includes = includes;
  //       chunkFile.bank = reqBank ?? undefined;
        
  //       expect(chunkFile.parts.length).toBeGreaterThan(0);
  //       patchFiles.push(chunkFile);
  //       asmFiles.push(chunkFile);
  //       chunkFiles.push(chunkFile);
  //     }

  //     expect(patchFiles.length).toEqual(patchEntries.length);
  //     console.log(`Successfully processed ${patchFiles.length} patch files`);
  //   }, 60000);

  //   it('Should be able to apply assembly patches', async () => {
  //     RomProcessor.applyPatches(asmFiles, patchFiles);
  //   }, 10000);
  // });

  // describe("Build process", () => {
  //   it("Should be able to calculate sizes", async () => {
  //     // Calculate ASM sizes
  //     for (const asm of asmFiles) {
  //       ChunkFileUtils.calculateSize(asm);
  //     }

  //     let f = asmFiles.find(x => x.name === 'chunk_008000');

  //     // Assign locations
  //     const layout = new RomLayout(chunkFiles);
  //     layout.organize();
  
  //     // Rebase assemblies
  //     for (const file of asmFiles) {
  //       ChunkFileUtils.rebase(file);
  //     }
  //   });

  //   it("Should be able to generate lookups", async () => {
      
  //     // Build include lookup map per asm file
  //     for (const f of asmFiles) {
  //       const includeBlocks = asmFiles
  //         .filter(x => f.includes?.has(x.name.toUpperCase()))
  //         .flatMap(x => x.parts!)
  //         .filter(b => !!b.label);

  //       f.includeLookup = new Map();

  //       for (const b of includeBlocks) {
  //         if (b.label) f.includeLookup.set(b.label.toUpperCase(), b);
  //       }

  //       for (const b of (f.parts || []).filter(x => !!x.label)) {
  //         if (b.label) f.includeLookup.set(b.label.toUpperCase(), b);
  //       }
  //     }

  //     // Create block lookup for resolving labels to locations
  //     const blockLookup = new Map<string, number>();
  //     for (const f of chunkFiles) {
  //       blockLookup.set(f.name.toUpperCase(), f.location);
  //     }
  //   });
  // });

}); 