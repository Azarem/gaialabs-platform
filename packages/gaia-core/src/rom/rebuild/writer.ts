import { 
  BinType, 
  AddressType, 
  Address, 
  RomProcessingConstants,
  type DbEntryPoint, 
  type ChunkFile, 
  type AsmBlock, 
  type StringMarker,
  type TableEntry,
  LocationWrapper
} from '@gaialabs/shared';
import { RomProcessor as RebuildProcessor } from './processor';
import { Op } from '../../assembly/Op';

/**
 * ROM writer (binary)
 * Converted from ext/GaiaLib/Rom/Rebuild/RomWriter.cs (subset: binary write only)
 */
export class RomWriter {
  public bpsPath?: string;
  private outBuffer: Uint8Array | null = null
  public readonly entryPoints: DbEntryPoint[];
  public cartName: string = '';
  public makerCode: string = '01JG';

  constructor(entryPoints: DbEntryPoint[]) {
    this.entryPoints = entryPoints;
  }

  public async repack(files: ChunkFile[]): Promise<Uint8Array> {
    // Create 4MB ROM image
    this.outBuffer = new Uint8Array(0x400000);

    const processor = new RebuildProcessor(this);
    await processor.repack(files);

    this.writeHeader();

    //await this.generatePatch();
    return this.outBuffer;
  }

  private writeHeader(): void {
    const buf = this.outBuffer!;
    // Maker/game code at 0xFFB0
    let pos = 0xFFB0;
    this.writeAscii(this.makerCode.padEnd(6, ' '), pos); pos += 6;
    for (let i = 0; i < 10; i++) buf[pos++] = 0;
    this.writeAscii(this.cartName.toUpperCase().padEnd(21, ' '), pos); pos += 21;
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
    buf[0xFFDE] = sum & 0xFF;
    buf[0xFFDF] = (sum >> 8) & 0xFF;
    // complement at 0xFFDC
    const comp = (~sum) & 0xFFFF;
    buf[0xFFDC] = comp & 0xFF;
    buf[0xFFDD] = (comp >> 8) & 0xFF;
  }

  // private async generatePatch(): Promise<void> {
  //   const flips = this._projectRoot.flipsPath;
  //   if (!flips) return;
  //   if (typeof process === 'undefined' || !process.versions?.node) return;
  //   const { spawn } = await import('child_process');
  //   const { resolve } = await import('path');
  //   this.bpsPath = `${this._projectRoot.baseDir}/${this._projectRoot.name}.bps`;
  //   await new Promise<void>((resolvePromise) => {
  //     const p = spawn(flips, ['--create', '--bps', `${this._projectRoot.romPath}`, `${this.romPath}`, `${this.bpsPath}`], {
  //       stdio: ['ignore', 'pipe', 'pipe']
  //     });
  //     p.on('close', () => resolvePromise());
  //   });
  // }

  public writeTransform(location: number, value: number, size?: number): void {
    const buf = this.outBuffer!;

    // Determine size based on value range if not explicitly provided
    if (size === undefined) {
      if (value <= 0xFF) {
        size = 1; // byte
      } else if (value <= 0xFFFF) {
        size = 2; // ushort 
      } else if (value <= 0xFFFFFF) {
        size = 3; // uint (3 bytes)
      } else {
        size = 4; // full uint (4 bytes, though C# version only uses 3)
      }
    }

    // Write bytes based on size
    switch (size) {
      case 1: // byte
        buf[location] = value & 0xFF;
        break;
      case 2: // ushort
        buf[location] = value & 0xFF;
        buf[location + 1] = (value >> 8) & 0xFF;
        break;
      case 3: // uint (3 bytes as per C# version)
        buf[location] = value & 0xFF;
        buf[location + 1] = (value >> 8) & 0xFF;
        buf[location + 2] = (value >> 16) & 0xFF;
        break;
      case 4: // full uint
        buf[location] = value & 0xFF;
        buf[location + 1] = (value >> 8) & 0xFF;
        buf[location + 2] = (value >> 16) & 0xFF;
        buf[location + 3] = (value >> 24) & 0xFF;
        break;
      default:
        throw new Error(`Invalid size ${size} for writeTransform`);
    }
  }

  public async writeFile(file: ChunkFile, _chunkLookup: Map<string, number>): Promise<number> {
    const start = file.location;
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
      // Handle assembly parts
      if (file.parts && file.parts.length > 0) {
        // For safety, ensure first block location matches file location when present
        if (file.parts[0].location !== file.location && (file.location || 0) !== 0) {
          throw new Error('Assembly was not based properly');
        }

        // Parse assembly parts
        this.parseAssembly(file.parts, _chunkLookup, file.includeLookup!);
      }
    }

    return pos - start;
  }

  // No address mapping required: layout assigns absolute file offsets

  private writeAscii(text: string, pos: number): void {
    const buf = this.outBuffer!;
    for (let i = 0; i < text.length; i++) buf[pos + i] = text.charCodeAt(i) & 0xFF;
  }

  /**
   * Parse assembly blocks and write binary data to output buffer
   * Converted from ext/GaiaLib/Rom/Rebuild/RomWriter.cs ParseAssembly method
   */
  private parseAssembly(
    blocks: AsmBlock[], 
    chunkLookup: Map<string, number>, 
    includeLookup: Map<string, AsmBlock>
  ): void {
    if (!blocks) {
      throw new Error('Assembly has not been parsed');
    }

    const buf = this.outBuffer!;

    let bix = 0;

    for (const block of blocks) {
      let oldPos: number | null = null;
      let position = block.location; // Always start at block's absolute location
      
      // Note: C# version had position management logic, but we always use block.location

      const objList = block.objList;
      let oix = 0;
      let opos = 0;

      // Process each object in the block's object list
      const processObject = (obj: unknown, parentOp?: Op): void => {
        let currentObj = obj;

        while (true) { // Top: label equivalent
          if (Array.isArray(currentObj)) {
            for (const obj of currentObj) {
              processObject(obj, parentOp);
            }
            break;
          } else if (this.isTableEntry(currentObj)) {
            currentObj = (currentObj as TableEntry).object;
            continue;
          } else if (currentObj instanceof Op) {
            const op = currentObj as Op;
            buf[position] = op.code.code & 0xFF;
            position++;
            opos += op.size;

            for (const operand of op.operands) {
              processObject(operand, op);
            }
            break;
          } else if (currentObj instanceof Uint8Array) {
            const arr = currentObj as Uint8Array;
            for (let i = 0; i < arr.length; i++) {
              buf[position + i] = arr[i];
            }
            position += arr.length;
            opos += arr.length;
            break;
          } else if (typeof currentObj === 'string') {
            const str = currentObj as string;
            let label = str;

            let ix = 0;
            while (ix < label.length && RomProcessingConstants.ADDRESS_SPACE.includes(label[ix])) {
              ix++;
            }

            if (ix > 0) {
              label = label.substring(ix);
            }

            let loc: number;
            const isRelative = parentOp && 
              (parentOp.code.mode === 'PCRelative' || 
               parentOp.code.mode === 'PCRelativeLong');

            const operatorIdx = this.indexOfAny(label, RomProcessingConstants.OPERATORS);
            let offset: number | null = null;
            let useMarker = false;

            if (operatorIdx > 0) {
              if (label[operatorIdx + 1] === 'M') {
                useMarker = true;
              } else {
                offset = parseInt(label.substring(operatorIdx + 1), 16);
                if (label[operatorIdx] === '-') {
                  offset = -offset;
                }
              }
              label = label.substring(0, operatorIdx);
            }

            // Search local labels first
            const labelUpper = label.toUpperCase();
            let target: AsmBlock | undefined;
            
            if (includeLookup.has(labelUpper)) {
              target = includeLookup.get(labelUpper);
              loc = target!.location;
            } else if (chunkLookup.has(labelUpper)) {
              loc = chunkLookup.get(labelUpper)!;
            } else {
              // Handle direct hex values
              if (label.startsWith('#')) {
                label = label.substring(1);
              }
              if (label.startsWith('$')) {
                label = label.substring(1);
              }

              if (isRelative && label.length > 4) {
                const off = parseInt(label, 16) - (block.location + opos);
                currentObj = parentOp?.size === 2 ? (off & 0xFF) : (off & 0xFFFF);
                continue; // goto Top
              } else {
                switch (label.length) {
                  case 1:
                  case 2:
                    currentObj = parseInt(label, 16) & 0xFF;
                    continue; // goto Top
                  case 3:
                  case 4:
                    currentObj = parseInt(label, 16) & 0xFFFF;
                    continue; // goto Top
                  case 5:
                  case 6:
                    currentObj = parseInt(label, 16) & 0xFFFFFF;
                    continue; // goto Top
                  default:
                    throw new Error(`Invalid operand '${label}'`);
                }
              }
            }

            let type = Address.typeFromCode(str[0]);
            if (type === AddressType.Unknown) {
              type = parentOp?.size === 4 ? AddressType.Address
                : parentOp?.size === 2 ? AddressType.Unknown : AddressType.Offset;
            }

            if (isRelative) {
              loc -= block.location + opos;
              if (type === AddressType.Unknown && !(loc < 0x80 || loc >= 0x3FFF80)) {
                throw new Error('Relative out of range');
              }
            }

            if (offset !== null) {
              loc += offset;
            } else if (useMarker && target) {
              let markerOffset = 0;
              for (const part of target.objList) {
                if (this.isStringMarker(part)) {
                  loc += markerOffset;
                  break;
                } else {
                  markerOffset += RomProcessingConstants.getSize(part);
                }
              }
            }

            switch (type) {
              case AddressType.Offset:
                currentObj = loc & 0xFFFF;
                break;
              case AddressType.Bank:
                currentObj = ((loc >> 16) | ((loc & 0xFFFF) >= 0x8000 ? 0x80 : 0xC0)) & 0xFF;
                break;
              case AddressType.WBank:
                currentObj = ((loc >> 16) | ((loc & 0xFFFF) >= 0x8000 ? 0x80 : 0xC0)) & 0xFFFF;
                break;
              case AddressType.Address:
                currentObj = loc | ((loc & 0xFFFF) >= 0x8000 ? 0x800000 : 0xC00000);
                break;
              default:
                currentObj = loc & 0xFF;
                break;
            }
            continue; // goto Top
          } else if (typeof currentObj === 'number') {
            const num = currentObj as number;
            if (num <= 0xFF) {
              // byte
              buf[position] = num & 0xFF;
              position++;
            } else if (num <= 0xFFFF) {
              // ushort
              buf[position] = num & 0xFF;
              buf[position + 1] = (num >> 8) & 0xFF;
              position += 2;
            } else if (num <= 0xFFFFFF) {
              // 3-byte
              buf[position] = num & 0xFF;
              buf[position + 1] = (num >> 8) & 0xFF;
              buf[position + 2] = (num >> 16) & 0xFF;
              position += 3;
            } else {
              // 4-byte
              buf[position] = num & 0xFF;
              buf[position + 1] = (num >> 8) & 0xFF;
              buf[position + 2] = (num >> 16) & 0xFF;
              buf[position + 3] = (num >> 24) & 0xFF;
              position += 4;
            }
            break;
          } else if (this.isStringMarker(currentObj)) {
            // StringMarker - no operation needed
            break;
          } else if (this.isLocationWrapper(currentObj)) {
          } else {
            throw new Error(`Unable to process '${currentObj}'`);
          }
        }
      };

      for (const obj of objList) {
        oix++;
        processObject(obj);
      }

      // Position management no longer needed since we use absolute locations

      bix++;
    }
  }

  /**
   * Helper method to find index of any character from an array in a string
   */
  private indexOfAny(str: string, chars: string[]): number {
    for (let i = 0; i < str.length; i++) {
      if (chars.includes(str[i])) {
        return i;
      }
    }
    return -1;
  }

  /**
   * Helper method to check if an object is a StringMarker
   */
  private isStringMarker(obj: unknown): obj is StringMarker {
    return typeof obj === 'object' && obj !== null && 'offset' in obj;
  }

  private isTableEntry(obj: unknown): obj is TableEntry {
    return typeof obj === 'object' && obj !== null && 'location' in obj && 'object' in obj;
  }

  private isLocationWrapper(obj: unknown): obj is LocationWrapper {
    return typeof obj === 'object' && obj !== null && 'location' in obj && 'type' in obj;
  }
}


