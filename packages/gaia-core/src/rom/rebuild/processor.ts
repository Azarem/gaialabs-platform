import type { DbRoot } from '@gaialabs/shared';
import { DbRootUtils, BinType } from '@gaialabs/shared';
import type { ChunkFile } from '@gaialabs/shared';
import { createChunkFile, ChunkFileUtils } from '@gaialabs/shared';
import { readFileAsBinary, fileExists } from '@gaialabs/shared';
import { RomLayout } from './layout';
import type { ProjectConfig } from '../project';
import { RomWriter } from './writer';

// export interface WriterLike {
//   _projectRoot: ProjectConfig;
//   _dbRoot: DbRoot;
//   writeFile(file: ChunkFile, root: DbRoot, chunkLookup: Record<string, number>): Promise<number>;
//   writeTransform(location: number, value: number): void;
// }

/**
 * ROM rebuild processor
 * Converted from ext/GaiaLib/Rom/Rebuild/RomProcessor.cs
 */
export class RomProcessor {
  private readonly writer: RomWriter;
  private readonly root: DbRoot;

  constructor(writer: RomWriter) {
    this.writer = writer;
    this.root = writer._dbRoot;
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
        .flatMap(x => x.parts || [])
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
    const blockLookup: Record<string, number> = {};
    for (const f of allFiles) {
      blockLookup[f.name.toUpperCase()] = f.location || 0;
    }

    // Write all files
    for (const file of allFiles) {
      await this.writer.writeFile(file, this.root, blockLookup);
    }

    // Entry point fixups
    const entryBlocks = (asmFiles
      .filter(x => (x.bank ?? -1) === 0)
      .flatMap(x => x.parts || [])
      .filter(b => !!b.label)) as { label?: string; location: number }[];

    for (const ep of this.root.entryPoints) {
      const match = entryBlocks.find(b => b.label === ep.name);
      if (match) this.writer.writeTransform(ep.location, match.location & 0xFFFF);
    }
  }

  // private async discoverFiles(baseDir: string): Promise<ChunkFile[]> {
  //   const chunkFiles: ChunkFile[] = [];

  //   // Enumerate BinTypes except Transform and Meta17 (handled via Unknown)
  //   const types = Object.values(BinType).filter(t => t !== BinType.Transform);

  //   for (const type of types) {
  //     // Meta17 is collected through Unknown
  //     if (type === BinType.Meta17) continue;

  //     const res = DbRootUtils.getPath(this.root, type as BinType);
  //     const folder = `${baseDir}/${res.folder}`;

  //     // Narrow glob by extension when running in Node
  //     if (!(await fileExists(folder))) continue;

  //     const paths = await this.globFiles(folder, `.${res.extension}`);
  //     for (const filePath of paths) {
  //       const cf = createChunkFile(filePath, type as BinType);

  //       // Set initial size using filesystem
  //       const data = await readFileAsBinary(filePath);
  //       cf.size = data.length;

  //       // Handle special Meta17 discovered as Unknown via name
  //       if (type === BinType.Unknown && cf.name.startsWith('meta17')) {
  //         cf.type = BinType.Meta17;
  //         cf.compressed = false;
  //       }

  //       // Assembly and patch parsing to populate blocks/includes/bank is not implemented yet in this port.
  //       // Files are written as binary in the current implementation.

  //       // Merge old file flags (compressed/upper)
  //       const old = this.root.files.find(x => x.type === (cf.type as any) && x.name === cf.name);
  //       if (old) {
  //         cf.compressed = old.compressed ?? cf.compressed;
  //         cf.upper = !!old.upper;
  //       }

  //       if (cf.compressed !== undefined || cf.type === BinType.Sound) {
  //         cf.size += 2; // header space in writer
  //       }

  //       chunkFiles.push(cf);
  //     }
  //   }

  //   // Apply flags again to non-ASM
  //   for (const cf of chunkFiles.filter(x => !x.parts)) {
  //     const old = this.root.files.find(y => xEq(cf, y));
  //     if (old) {
  //       cf.compressed = old.compressed ?? cf.compressed;
  //       cf.upper = !!old.upper;
  //     }
  //   }

  //   return chunkFiles;

  //   function xEq(cf: ChunkFile, y: any) {
  //     return (cf.type as any) === y.type && cf.name === y.name;
  //   }
  // }

  private async globFiles(folder: string, ext: string): Promise<string[]> {
    // Node-only simple recursive walker
    const isNode = typeof process !== 'undefined' && process.versions?.node;
    if (!isNode) return [];
    const { readdir } = await import('fs/promises');
    const { join } = await import('path');

    const results: string[] = [];
    async function walk(dir: string) {
      const entries = await readdir(dir, { withFileTypes: true });
      for (const e of entries) {
        const p = join(dir, e.name);
        if (e.isDirectory()) await walk(p);
        else if (e.isFile() && p.endsWith(ext)) results.push(p);
      }
    }
    await walk(folder);
    return results;
  }

  public static applyPatches(asmFiles: ChunkFile[], patches: ChunkFile[]): void {
    for (const patch of patches.filter(x => x.includes && x.includes.size > 0)) {
      let file: ChunkFile | null = null;
      let dstIx = -1;
      const inc = asmFiles.filter(x => patch.includes!.has(x.name.toUpperCase()));
      for (let ix = 0; patch.parts && ix < patch.parts.length;) {
        const block = patch.parts[ix];
        if (!block.label) { ix++; continue; }
        let match: any = null;
        for (const i of inc) {
          if (!i.parts) continue;
          for (let y = 0; y < i.parts.length; y++) {
            match = i.parts[y];
            if (match.label === block.label) {
              file = i; dstIx = y; break;
            }
          }
          if (file) break;
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


