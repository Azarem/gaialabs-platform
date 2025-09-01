import { BinType } from '@gaialabs/shared';
import { ChunkFileUtils, type ChunkFile } from '@gaialabs/shared';
import { RomLayout } from './layout';
import { RomWriter } from './writer';
import { DbEntryPoint } from '@gaialabs/shared';

/**
 * ROM rebuild processor
 * Converted from ext/GaiaLib/Rom/Rebuild/RomProcessor.cs
 */
export class RomProcessor {
  private readonly writer: RomWriter;

  constructor(writer: RomWriter) {
    this.writer = writer;
  }

  public async repack(allFiles: ChunkFile[]): Promise<void> {
    // Discover files
    //const allFiles = await this.discoverFiles(this.writer._projectRoot.baseDir);

    const patches = allFiles.filter(x => x.type === BinType.Patch);
    const asmFiles = allFiles.filter(x => !!x.parts);

    // Assembly processing now happens in project.ts via ChunkBlockReader.analyzeAndResolveChunks()
    // This provides comprehensive cross-referencing and object graph generation

    // Apply patches to asm blocks
    RomProcessor.applyPatches(asmFiles, patches);

    // Calculate ASM sizes
    for (const asm of asmFiles) {
      ChunkFileUtils.calculateSize(asm);
    }

    // Assign locations
    const layout = new RomLayout(allFiles);
    layout.organize();

    // Rebase assemblies
    for (const file of asmFiles) {
      ChunkFileUtils.rebase(file);
    }

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
    const blockLookup = new Map<string, number>();
    for (const f of allFiles) {
      blockLookup.set(f.name.toUpperCase(), f.location);
    }

    // Write all files
    for (const file of allFiles) {
      await this.writer.writeFile(file, blockLookup);
    }

    // Entry point fixups
    const entryBlocks = (asmFiles
      .filter(x => (x.bank ?? -1) === 0)
      .flatMap(x => x.parts || [])
      .filter(b => !!b.label)) as { label?: string; location: number }[];

    for (const ep of this.writer.entryPoints) {
      const match = entryBlocks.find(b => b.label === ep.name);
      if (match) this.writer.writeTransform(ep.location, match.location & 0xFFFF);
    }
  }

  public static applyPatches(asmFiles: ChunkFile[], patches: ChunkFile[]): void {
    for (const patch of patches.filter(x => x.includes && x.includes.size > 0)) {
      let file: ChunkFile | null = null;
      let dstIx = -1;
      const inc = asmFiles.filter(x => patch.includes!.has(x.name.toUpperCase()));
      for (let ix = 0; patch.parts && ix < patch.parts.length;) {
        const block = patch.parts[ix];
        let match: any = null;
        if (block.label) { 
          for (const i of inc) {
            if (!i.parts) continue;
            for (let y = 0; y < i.parts.length; y++) {
              const check = i.parts[y];
              if (check.label === block.label) {
                file = i; 
                dstIx = y; 
                match = check;
                break;
              }
            }
          }
        }
        if (match) {
          file!.parts![dstIx++] = block;
        } else if (dstIx >= 0) {
          file!.parts!.splice(dstIx++, 0, block);
        } else { ix++; continue; }
        file!.includes = file!.includes || new Set();
        file!.includes.add(patch.name.toUpperCase());
        patch.parts!.splice(ix, 1);
      }
    }
  }
}


