import { RomDataReader } from './reader';
import { Address, AddressSpace, AddressType, MemberType, RomProcessingConstants } from 'gaia-shared';
import type { DbStringType, DbStringCommand } from 'gaia-shared';
import type { StringWrapper } from 'gaia-shared';
import type { DbRoot } from 'gaia-shared';

// Placeholder interfaces for dependencies that aren't implemented yet
interface BlockReader {
  _romDataReader: RomDataReader;
  _root: DbRoot;
  _currentBlock: any;
  _markerTable: Record<number, number>;
  PartCanContinue(): boolean;
  ResolveInclude(location: number, isBranch: boolean): void;
  ResolveName(location: number, type: AddressType, isBranch: boolean): string;
}

interface TableEntry {
  Location: number;
  Object: StringWrapper;
}

/**
 * Reads and processes strings from ROM data
 * Converted from GaiaLib/Rom/Extraction/StringReader.cs
 */
export class StringReader {
  public static readonly STRING_REFERENCE_CHARACTERS = ['~', '^'];

  private readonly _blockReader: BlockReader;
  private readonly _romDataReader: RomDataReader;

  constructor(blockReader: BlockReader) {
    this._blockReader = blockReader;
    this._romDataReader = blockReader._romDataReader;
  }

  private resolveCommand(cmd: DbStringCommand, builder: string[]): void {
    if (cmd.types && cmd.types.length > 0) {
      builder.push(`[${cmd.value}`);

      let first = true;
      for (const t of cmd.types) {
        if (first) {
          builder.push(':');
          first = false;
        } else {
          builder.push(',');
        }

        switch (t) {
          case MemberType.Byte:
            builder.push(this._romDataReader.readByte().toString(16).toUpperCase());
            break;
          case MemberType.Word:
            builder.push(this._romDataReader.readUShort().toString(16).toUpperCase());
            break;
          case MemberType.Offset:
            const loc = this._romDataReader.readUShort() | (this._romDataReader.position & 0x3F0000);
            builder.push(`^${loc.toString(16).toUpperCase().padStart(6, '0')}`);
            break;
          case MemberType.Address:
            builder.push(`~${this._romDataReader.readAddress().toString(16).toUpperCase().padStart(6, '0')}`);
            break;
          case MemberType.Binary:
            let sfirst = true;
            do {
              const r = this._romDataReader.readByte();
              if (cmd.delimiter !== undefined && r === cmd.delimiter) {
                break;
              }
              if (sfirst) {
                sfirst = false;
              } else {
                builder.push(',');
              }
              builder.push(r.toString(16).toUpperCase());
            } while (this._blockReader.PartCanContinue());
            break;
          default:
            throw new Error('Unsupported member type');
        }
      }
      builder.push(']');
    } else {
      builder.push(`[${cmd.value}]`);
    }
  }

  public parseString(stringType: DbStringType): StringWrapper {
    const dict = stringType.commands;
    const builder: string[] = [];
    const strLoc = this._romDataReader.position;
    const map = stringType.characterMap;
    const terminator = stringType.terminator;

    do {
      const c = this._romDataReader.readByte();
      if (c === terminator) {
        if (stringType.greedyTerminator) {
          while (this._romDataReader.peekByte() === terminator && this._blockReader.PartCanContinue()) {
            this._romDataReader.position++;
          }
        }
        break;
      }

      const cmd = dict[c];
      if (cmd) {
        this.resolveCommand(cmd, builder);
        if (cmd.halt) {
          break;
        }
      } else {
        const index = this.shiftDown(c, stringType.shiftType);
        if (index >= 0 && index < map.length) {
          builder.push(map[index]);
        } else {
          // Fallback for unknown characters
          builder.push(`[${c.toString(16).toUpperCase()}]`);
        }
      }
    } while (this._blockReader.PartCanContinue());

    return {
      string: builder.join(''),
      type: stringType,
      marker: 0,
      location: strLoc
    };
  }

  /**
   * Handles character shifting based on string type
   * This is a simplified implementation of the shift logic
   */
  private shiftDown(c: number, shiftType?: string): number {
    if (!shiftType) {
      return c;
    }

    switch (shiftType) {
      case 'wh2':
        // wh2 shift: ((c & 0x70) >> 1) | (c & 0x07)
        return ((c & 0x70) >> 1) | (c & 0x07);
      case 'h2':
        // h2 shift: ((c & 0xE0) >> 1) | (c & 0x0F)
        return ((c & 0xE0) >> 1) | (c & 0x0F);
      default:
        return c;
    }
  }

  public resolveString(sw: StringWrapper, isBranch: boolean): void {
    let str = sw.string;
    let ix = this.indexOfAny(str, StringReader.STRING_REFERENCE_CHARACTERS);
    
    while (ix >= 0) {
      if (ix + 6 < str.length) {
        const hexStr = str.substring(ix + 1, ix + 7);
        const sloc = parseInt(hexStr, 16);
        
        if (!isNaN(sloc)) {
          const addrs = new Address(sloc >> 16, sloc & 0xFFFF);
          if (addrs.space === AddressSpace.ROM) {
            this._blockReader.ResolveInclude(sloc, false);
            const name = this._blockReader.ResolveName(sloc, AddressType.Unknown, false);
            const opix = this.indexOfAny(name, RomProcessingConstants.OPERATORS);
            
            if (opix > 0) {
              const offsetStr = name.substring(opix + 1);
              let offset: number;
              
              if (offsetStr === 'M') {
                offset = this._blockReader._markerTable[sloc] || 0;
              } else {
                offset = parseInt(offsetStr, 16) || 0;
              }

              if (name[opix] === '-') {
                offset = -offset;
              }

              const targetName = name.substring(0, opix);
              const target = sloc - offset;
              
              // Try to find the target in the current block
              // This is a simplified implementation
              if (this._blockReader._currentBlock && this._blockReader._currentBlock.IsOutside) {
                // More complex logic would go here
                // For now, just mark the offset
                sw.marker = offset;
              }
            }
          }
        }
      }
      
      ix = this.indexOfAny(str, StringReader.STRING_REFERENCE_CHARACTERS, ix + 7);
    }
  }

  /**
   * Helper method to find the index of any character in a string
   */
  private indexOfAny(str: string, chars: string[], startIndex = 0): number {
    for (let i = startIndex; i < str.length; i++) {
      if (chars.includes(str[i])) {
        return i;
      }
    }
    return -1;
  }
} 