import type { DbRoot } from '@gaialabs/shared';
import { BinType } from '@gaialabs/shared';
import type { ChunkFile } from '@gaialabs/shared';
import { RomProcessor as RebuildProcessor } from './processor';
import { readFileAsBinary } from '@gaialabs/shared';

/**
 * ROM writer (binary)
 * Converted from ext/GaiaLib/Rom/Rebuild/RomWriter.cs (subset: binary write only)
 */
export class RomWriter implements DisposableLike {
  public readonly _projectRoot: {
    baseDir: string;
    name: string;
    flipsPath?: string;
    romPath: string;
    databasePath?: string;
    systemPath?: string;
    resources: Record<BinType, any>;
  };
  public readonly _dbRoot: DbRoot;
  public readonly romPath: string;
  public bpsPath?: string;
  private outBuffer: Uint8Array | null = null;
  private view: DataView | null = null;

  constructor(projectRoot: any, dbRoot: DbRoot) {
    this._projectRoot = projectRoot;
    this._dbRoot = dbRoot;
    this.romPath = `${projectRoot.baseDir}/${projectRoot.name}.smc`;
  }

  public async repack(files: ChunkFile[]): Promise<void> {
    // Create 4MB ROM image
    this.outBuffer = new Uint8Array(0x400000);
    this.view = new DataView(this.outBuffer.buffer);

    const processor = new RebuildProcessor(this);
    await processor.repack(files);

    this.writeHeader();

    // Flush to disk (Node only)
    if (typeof process !== 'undefined' && process.versions?.node) {
      const { writeFile } = await import('fs/promises');
      const { resolve } = await import('path');
      await writeFile(resolve(this.romPath), this.outBuffer);
    }

    await this.generatePatch();
    this.outBuffer = null;
    this.view = null;
  }

  private writeHeader(): void {
    const buf = this.outBuffer!;
    const view = this.view!;
    // Maker/game code at 0xFFB0
    let pos = 0xFFB0;
    this.writeAscii('01JG  ', pos); pos += 6;
    for (let i = 0; i < 10; i++) buf[pos++] = 0;
    this.writeAscii(this._projectRoot.name.toUpperCase().padEnd(21, ' '), pos); pos += 21;
    buf[pos++] = 0x31; // map mode
    buf[pos++] = 0x02; // chipset
    buf[pos++] = 0x0C; // ROM size
    buf[pos++] = 0x03; // RAM size
    buf[pos++] = 0x01; // country
    buf[pos++] = 0x33; // dev id
    buf[pos++] = 0x00; // version

    // checksum
    let sum = 0;
    for (let i = 0; i < buf.length; i++) sum = (sum + buf[i]) & 0xFFFF;
    // checksum at 0xFFDE
    view.setUint8(0xFFDE, sum & 0xFF);
    view.setUint8(0xFFDF, (sum >> 8) & 0xFF);
    // complement at 0xFFDC
    const comp = (~sum) & 0xFFFF;
    view.setUint8(0xFFDC, comp & 0xFF);
    view.setUint8(0xFFDD, (comp >> 8) & 0xFF);
  }

  private async generatePatch(): Promise<void> {
    const flips = this._projectRoot.flipsPath;
    if (!flips) return;
    if (typeof process === 'undefined' || !process.versions?.node) return;
    const { spawn } = await import('child_process');
    const { resolve } = await import('path');
    this.bpsPath = `${this._projectRoot.baseDir}/${this._projectRoot.name}.bps`;
    await new Promise<void>((resolvePromise) => {
      const p = spawn(flips, ['--create', '--bps', `${this._projectRoot.romPath}`, `${this.romPath}`, `${this.bpsPath}`], {
        stdio: ['ignore', 'pipe', 'pipe']
      });
      p.on('close', () => resolvePromise());
    });
  }

  public writeTransform(location: number, value: number): void {
    const view = this.view!;
    // Location is a direct file offset in this rebuild pipeline
    const pos = location >>> 0;
    // Writes 16-bit by default as per original call sites
    view.setUint8(pos, value & 0xFF);
    view.setUint8(pos + 1, (value >> 8) & 0xFF);
  }

  public async writeFile(file: ChunkFile, _root: DbRoot, _chunkLookup: Record<string, number>): Promise<number> {
    const start = (file.location || 0) >>> 0;
    let pos = start;
    const buf = this.outBuffer!;

    if (file.rawData) {
      // Write type-specific headers
      let remain = file.size;
      if (file.type === BinType.Tilemap) {
        // copy first 2 bytes through
        // Will be handled after reading file
      } else if (file.type === BinType.Meta17) {
        // 4-byte header preserved
      } else if (file.type === BinType.Sound) {
        remain -= 2;
        buf[pos++] = remain & 0xFF;
        buf[pos++] = (remain >> 8) & 0xFF;
      }

      if (file.compressed !== undefined) {
        remain -= 2;
        const inverse = (0 - remain) & 0xFFFF;
        buf[pos++] = inverse & 0xFF;
        buf[pos++] = (inverse >> 8) & 0xFF;
      }

      // Now write file contents
      const data = file.rawData;

      // If tilemap/meta17 need header passthrough first
      let srcPos = 0;
      if (file.type === BinType.Tilemap) {
        buf[pos++] = data[srcPos++];
        buf[pos++] = data[srcPos++];
      } else if (file.type === BinType.Meta17) {
        for (let i = 0; i < 4; i++) buf[pos++] = data[srcPos++];
      }

      // Copy the rest
      while (pos - start < file.size) {
        buf[pos++] = data[srcPos++];
      }
    } else {
      // Assembly write not yet supported in TS port; expect blocks to be prebased and sizes known
      // This space intentionally left blank for future Assembler integration.
      // For safety, ensure first block location matches file location when present
      if (file.parts && file.parts.length > 0 && file.parts[0].location !== file.location && (file.location || 0) !== 0) {
        throw new Error('Assembly was not based properly');
      }
    }

    return pos - start;
  }

  // No address mapping required: layout assigns absolute file offsets

  private writeAscii(text: string, pos: number): void {
    const buf = this.outBuffer!;
    for (let i = 0; i < text.length; i++) buf[pos + i] = text.charCodeAt(i) & 0xFF;
  }

  public [Symbol.dispose](): void {
    this.outBuffer = null;
    this.view = null;
  }
}

interface DisposableLike {
  [Symbol.dispose](): void;
}


