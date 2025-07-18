import { promises as fs } from 'fs';
import { join, dirname } from 'path';
import { Op } from '../../assembly/Op';
import { AddressingMode, TypedNumber } from 'gaia-shared';
import { 
  DbRoot, 
  DbPart, 
  DbBlock,
  DbBlockUtils
} from 'gaia-shared';
import { 
  BinType, 
  AddressType, 
  MemberType,
  AddressSpace,
  XformDef,
  XformType,
  TableEntry,
  StructDef,
  StringWrapper,
  LocationWrapper,
  Address
} from 'gaia-shared';
import { DbRootUtils } from 'gaia-shared';
import { BlockReader } from './blocks';
import { ReferenceManager } from './references';

// Type tags for better object identification
export enum ObjectType {
  TableEntryArray = 'TableEntryArray',
  StructDef = 'StructDef',
  OpArray = 'OpArray',
  LocationWrapper = 'LocationWrapper',
  Address = 'Address',
  StringWrapper = 'StringWrapper',
  ByteArray = 'ByteArray',
  Array = 'Array',
  String = 'String',
  Number = 'Number',
  TypedNumber = 'TypedNumber'
}

export class BlockWriter {
  private _root: DbRoot;
  private _blockReader: BlockReader;
  private _referenceManager: ReferenceManager;
  private _isInline: boolean = false;
  private _currentPart: DbPart | null = null;

  constructor(reader: BlockReader) {
    this._blockReader = reader;
    this._root = reader._root;
    this._referenceManager = reader._referenceManager;
  }

  async writeBlocks(outPath: string): Promise<void> {
    const res = DbRootUtils.getPath(this._root, BinType.Assembly);
    const xRes = DbRootUtils.getPath(this._root, BinType.Transform);

    const folderPath = join(outPath, res.folder);
    const transformPath = join(outPath, xRes.folder);

    for (const block of this._root.blocks) {
      const groupedFolderPath = block.group 
        ? join(folderPath, block.group)
        : folderPath;
      
      await fs.mkdir(groupedFolderPath, { recursive: true });

      const outFile = join(groupedFolderPath, `${block.name}.${res.extension}`);
      
      // Check if file exists, skip if it does
      try {
        await fs.access(outFile);
        continue;
      } catch {
        // File doesn't exist, continue with creation
      }

      const lines: string[] = [];

      // Write bank information if not movable
      if (!block.movable && block.parts.length > 0) {
        lines.push(`?BANK ${(block.parts[0].start >> 16).toString(16).toUpperCase().padStart(2, '0')}`);
      }

      // Write includes - these should be from the block's include list
      const includes = DbBlockUtils.getIncludes(block);
      if (includes && includes.length > 0) {
        for (const inc of includes) {
          lines.push(`?INCLUDE '${inc.name}'`);
        }
        lines.push(''); // Empty line after includes
      }

      // Write mnemonics - these should be from the root mnemonics that are referenced in this block
      const mnemonics = this.getMnemonicsForBlock(block);
      if (mnemonics && mnemonics.length > 0) {
        for (const [name, address] of mnemonics) {
          const paddedName = name.padEnd(30, ' ');
          lines.push(`!${paddedName} ${address.toString(16).toUpperCase().padStart(4, '0')}`);
        }
        lines.push(''); // Empty line after mnemonics
      }

      // Handle transforms
      let xforms: XformDef[] | null = null;
      const xformFile = block.group 
        ? join(transformPath, block.group, `${block.name}.${xRes.extension}`)
        : join(transformPath, `${block.name}.${xRes.extension}`);

      try {
        const xformData = await fs.readFile(xformFile, 'utf-8');
        xforms = JSON.parse(xformData) as XformDef[];
      } catch {
        // Transform file doesn't exist, continue without transforms
      }

      // Process lookup transforms
      if (xforms) {
        for (const x of xforms.filter(x => x.type === XformType.Lookup)) {
          const table = block.parts[0].objectRoot as TableEntry[];
          const tableEntry = table?.[0];
          const entries = tableEntry?.object as object[];
          const newParts: TableEntry[] = [];
          const newList: (string | number)[] = [];

          newParts.push({ location: tableEntry.location, object: newList });

          let eIx = 1;
          for (const entry of entries.filter(e => e && typeof e === 'object' && 'name' in e && 'parts' in e)) {
            const structEntry = entry as StructDef;
            let cIx = 0;
            let key: number | null = null;
            let value: any = null;

            for (const obj of structEntry.parts) {
              if (cIx === x.keyIx) {
                key = Number(obj);
              } else if (cIx === x.valueIx) {
                value = obj;
              }
              cIx++;
            }

            if (key === null || value === null) {
              throw new Error('Could not locate key or value for transform');
            }

            const name = `entry_${key.toString(16).toUpperCase().padStart(2, '0')}`;
            const loc = tableEntry.location + eIx;

            newParts.push({ location: loc, object: value });

            // Force labels to match the new name
            this._referenceManager.nameTable.set(loc, name);

            while (newList.length <= key) {
              newList.push(0);
            }

            newList[key] = `&${name}`;
            eIx++;
          }

          block.parts[0].objectRoot = newParts;
        }
      }

      // Process each part
      for (const part of block.parts) {
        this._currentPart = part;
        this._isInline = true;

        lines.push('---------------------------------------------');
        lines.push('');

        const objectLines = this.writeObject(part.objectRoot, 0);
        lines.push(...objectLines);
      }

      let content = lines.join('\n');

      // Apply replace transforms
      if (xforms) {
        for (const x of xforms.filter(x => x.type === XformType.Replace)) {
          if (x.key && x.value) {
            const regex = new RegExp(x.key, 'g');
            content = content.replace(regex, x.value);
          }
        }
      }

      await fs.writeFile(outFile, content);
    }
  }

  private getMnemonicsForBlock(block: DbBlock): [string, number][] {
    if (!block.mnemonics) {
      return [];
    }

    return Object.entries(block.mnemonics)
      .map(([k, v]) => [v, parseInt(k, 10)] as [string, number])
      .sort((a, b) => a[1] - b[1]);
  }

  private resolveOperand(op: Op, obj: any, isBranch: boolean = false): any {
    if (typeof obj === 'number') {
      if (op.code.mode === AddressingMode.Immediate) {
        return obj;
      }

      // Direct page and stack operations should not resolve to labels
      switch (op.code.mode) {
        case AddressingMode.DirectPage:
        case AddressingMode.DirectPageIndexedX:
        case AddressingMode.DirectPageIndexedY:
        case AddressingMode.DirectPageIndexedIndirectX:
        case AddressingMode.DirectPageIndirect:
        case AddressingMode.DirectPageIndirectLong:
        case AddressingMode.DirectPageIndirectLongIndexedY:
        case AddressingMode.DirectPageIndirectIndexedY:
        case AddressingMode.StackRelative:
        case AddressingMode.StackRelativeIndirectIndexedY:
        case AddressingMode.Stack:
        case AddressingMode.StackInterrupt:
          return obj;
      }

      return this._blockReader.resolveName(obj, AddressType.Address, isBranch);
    }
    if (this.getObjectType(obj) === ObjectType.LocationWrapper) {
      const lw = obj as LocationWrapper;
      return this._blockReader.resolveName(lw.location, lw.type, isBranch);
    }
    if (this.getObjectType(obj) === ObjectType.Address) {
      const addr = obj as Address;

      if (op.size === 4) {
        return addr;
      }

      if (addr.isCodeBank && addr.offset < Address.UPPER_BANK) {
        const label = this._root.mnemonics[addr.offset];
        if (label) {
          return label;
        }
      }

      return addr.offset;
    }

    // Preserve tag information on typed numbers without resolving names
    if (obj && typeof obj === 'object' && obj._tag && 'value' in obj) {
      const typed = obj as { _tag: string; value: any };

      // Byte/Word objects should remain untouched
      if (typed._tag === 'Byte' || typed._tag === 'Word' || typed._tag === 'TypedNumber') {
        return obj;
      }

      if (typeof typed.value === 'number' && op.code.mode !== AddressingMode.Immediate) {
        const resolved = this._blockReader.resolveName(typed.value, AddressType.Address, isBranch);
        return { ...typed, value: resolved };
      }
      return obj;
    }
    return obj;
  }

  private getObjectType(obj: any): ObjectType {
    if (obj === null || obj === undefined) {
      return ObjectType.String;
    }

    // Check for explicit type tags first
    if (obj._tag) {
      if (obj._tag === 'Byte' || obj._tag === 'Word') {
        return ObjectType.TypedNumber;
      }
      return obj._tag as ObjectType;
    }

    // Duck typing fallbacks
    if (Array.isArray(obj)) {
      if (obj.length > 0) {
        if (obj[0] && typeof obj[0] === 'object' && 'location' in obj[0] && 'object' in obj[0]) {
          return ObjectType.TableEntryArray;
        }
        if (obj[0] instanceof Op) {
          return ObjectType.OpArray;
        }
      }
      return ObjectType.Array;
    }

    if (obj instanceof Op) {
      return ObjectType.OpArray;
    }

    if (obj instanceof LocationWrapper) {
      return ObjectType.LocationWrapper;
    }

    if (obj instanceof Address) {
      return ObjectType.Address;
    }

    if (obj instanceof Uint8Array) {
      return ObjectType.ByteArray;
    }

    if (obj && typeof obj === 'object') {
      if ('string' in obj && 'type' in obj && 'marker' in obj && 'location' in obj) {
        return ObjectType.StringWrapper;
      }
      if ('name' in obj && 'parts' in obj) {
        return ObjectType.StructDef;
      }
    }

    if (typeof obj === 'string') {
      return ObjectType.String;
    }

    if (typeof obj === 'number') {
      return ObjectType.Number;
    }

    return ObjectType.String;
  }

  private writeObject(obj: any, depth: number, isBranch: boolean = false): string[] {
    const lines: string[] = [];
    const indent = () => '  '.repeat(depth);

    if (!this._isInline) {
      lines.push('');
    }

    const objType = this.getObjectType(obj);

    switch (objType) {
      case ObjectType.TableEntryArray:
        return this.writeTableEntryArray(obj as TableEntry[], depth);

      case ObjectType.StructDef:
        return this.writeStructDef(obj as StructDef, depth);

      case ObjectType.OpArray:
        return this.writeOpArray(obj as Op[], depth);

      case ObjectType.LocationWrapper:
        return [this._blockReader.resolveName((obj as LocationWrapper).location, (obj as LocationWrapper).type, isBranch)];

      case ObjectType.Address:
        return [`$${(obj as Address).toString()}`];

      case ObjectType.ByteArray:
        return [`#${Array.from(obj as Uint8Array).map(b => b.toString(16).toUpperCase().padStart(2, '0')).join('')}`];

      case ObjectType.StringWrapper:
        return this.writeStringWrapper(obj as StringWrapper);

      case ObjectType.Array:
        return this.writeArray(obj as any[], depth);

      case ObjectType.Number:
        return this.writeNumber(obj as number);

      case ObjectType.TypedNumber:
        return this.writeTypedNumber(obj as any);

      case ObjectType.String:
        return [String(obj)];

      default:
        return [String(obj)];
    }
  }

  private writeTableEntryArray(tGroup: TableEntry[], depth: number): string[] {
    const lines: string[] = [];
    
    for (const t of tGroup) {
      const nameResult = this._referenceManager.tryGetName(t.location);
      const name = nameResult.found ? nameResult.referenceName! : `loc_${t.location.toString(16).toUpperCase().padStart(6, '0')}`;
      
      this._isInline = true;
      const objectLines = this.writeObject(t.object, depth);
      lines.push(`${name} ${objectLines[0]}`);
      if (objectLines.length > 1) {
        lines.push(...objectLines.slice(1));
      }
      this._isInline = false;
    }
    
    return lines;
  }

  private writeStructDef(structObj: StructDef, depth: number): string[] {
    const parts: string[] = [];
    for (const part of structObj.parts) {
      const partLines = this.writeObject(part, depth);
      parts.push(partLines[0]);
    }
    return [`${structObj.name} < ${parts.join(', ')} >`];
  }

  private writeOpArray(opList: Op[], depth: number): string[] {
    const lines: string[] = [];
    lines.push('{');
    
    let first = true;
    for (const op of opList) {
      if (first) {
        first = false;
      } else {
        // Check for labels on subsequent instructions
        const labelResult = this._referenceManager.tryGetName(op.location);
        if (labelResult.found) {
          lines.push('');
          lines.push(`  ${labelResult.referenceName}:`);
        }
      }

      let opLine = `    ${op.code.mnem} `;
      
      if (op.copDef) {
        // Handle COP instructions specially
        opLine += `[${op.copDef.mnem}]`;
        if (op.operands && op.operands.length > 1) {
          const operandStrings: string[] = [];
          for (let i = 1; i < op.operands.length; i++) {
            // Resolve operand names similar to regular instructions
            const resolved = this.resolveOperand(op, op.operands[i]);
            const operandLines = this.writeObject(resolved, depth + 1, false);
            operandStrings.push(operandLines[0]);
          }
          opLine += ` ( ${operandStrings.join(', ')} )`;
        }
      } else if (op.operands && op.operands.length > 0) {
        const isBr = op.code.mnem[0] === 'J' || 
                    op.code.mode === AddressingMode.PCRelative ||
                    op.code.mode === AddressingMode.PCRelativeLong;

        // Special handling for different instruction types
        if (op.code.mnem === 'COP') {
          // COP instructions without copDef - handle as simple operand
          const operand = op.operands[0];
          if (typeof operand === 'number') {
            opLine += `[${operand.toString(16).toUpperCase().padStart(2, '0')}]`;
          } else {
            opLine += `[${operand}]`;
          }
        } else {
          // Regular instruction formatting
          const resolvedOperand = this.resolveOperand(op, op.operands[0], isBr);
          const format = this._root.config.asmFormats?.[op.code.mode];
          
          if (format) {
            let actualFormat = format;
            if (op.code.mode === AddressingMode.Immediate && op.size === 3) {
              actualFormat = format.replace('X2', 'X4');
            }
            opLine += this.formatOperand(actualFormat, [resolvedOperand]);
          } else {
            // Default formatting based on operand type
            opLine += this.formatDefaultOperand(resolvedOperand, op.size);
          }
        }
      }
      
      lines.push(opLine);
    }
    
    lines.push('}');
    return lines;
  }

  private formatDefaultOperand(operand: any, size: number): string {
    if (typeof operand === 'string') {
      return operand; // Already formatted
    }

    if (operand && typeof operand === 'object' && operand._tag && 'value' in operand) {
      return this.formatTypedNumber(operand);
    }

    if (typeof operand === 'number') {
      const hexSize = (size - 1) * 2;
      if (hexSize === 2) {
        return `#$${operand.toString(16).toUpperCase().padStart(2, '0')}`;
      } else if (hexSize === 4) {
        return `#$${operand.toString(16).toUpperCase().padStart(4, '0')}`;
      } else {
        return `$${operand.toString(16).toUpperCase().padStart(hexSize, '0')}`;
      }
    }
    
    return String(operand);
  }

  private writeStringWrapper(stringObj: StringWrapper): string[] {
    let str = stringObj.string;
    
    // Process string references
    const stringReferenceChars = ['~', '^'];
    for (const char of stringReferenceChars) {
      let ix = str.indexOf(char);
      while (ix >= 0) {
        const hexStr = str.substring(ix + 1, ix + 7);
        const sloc = parseInt(hexStr, 16);
        const adrs = new Address((sloc >> 16) & 0xFF, sloc & 0xFFFF);
        
        if (adrs.space === AddressSpace.ROM) {
          const addressType = char === '^' ? AddressType.Offset : AddressType.Address;
          const name = this._blockReader.resolveName(sloc, addressType, false);
          str = str.replace(str.substring(ix, ix + 7), name);
        } else {
          throw new Error('Unsupported address space');
        }
        
        ix = str.indexOf(char, ix + 7);
      }
    }

    const refChar = stringObj.type.delimiter;
    let marker = stringObj.marker;
    
    if (marker <= 0) {
      const markerResult = this._referenceManager.tryGetMarker(stringObj.location);
      marker = markerResult.found ? markerResult.offset || 0 : 0;
    }

    if (marker > 0) {
      let six = 0;
      let mix = 0;
      
      while (mix < marker) {
        if (str[six] === '[') {
          const eix = str.indexOf(']', ++six);
          const parts = str.substring(six, eix).split(/[,: ]/);
          
          const cmd = Object.values(stringObj.type.commands).find((x: any) => x.value === parts[0]);
          if (cmd && (cmd as any).types) {
            for (const t of (cmd as any).types) {
              switch (t) {
                case MemberType.Byte:
                  mix += 1;
                  break;
                case MemberType.Word:
                case MemberType.Offset:
                  mix += 2;
                  break;
                case MemberType.Address:
                  mix += 3;
                  break;
                case MemberType.Binary:
                  mix += parts.length - 1;
                  break;
                default:
                  throw new Error('Unsupported member type');
              }
            }
          }
          six = eix + 1;
          mix++;
        } else {
          six++;
          mix++;
        }
      }
      
      str = str.substring(0, six) + '[::]' + str.substring(six);
    }

    return [`${refChar}${str}${refChar}`];
  }

  private writeArray(arr: any[], depth: number): string[] {
    const lines: string[] = [];
    lines.push('[');
    
    for (let i = 0; i < arr.length; i++) {
      const objLines = this.writeObject(arr[i], depth + 1);
      const indent = '  '.repeat(depth + 1);
      lines.push(`${indent}${objLines[0]}   ;${i.toString(16).toUpperCase().padStart(2, '0')}`);
      if (objLines.length > 1) {
        lines.push(...objLines.slice(1).map(line => `${indent}${line}`));
      }
    }
    
    lines.push('  '.repeat(depth) + ']');
    return lines;
  }

  private writeNumber(num: number): string[] {
    // Format numbers based on value and size
    if (num <= 0xff) {
      // Mirror C# BlockWriter: bytes omit the '$' prefix
      return [`#${num.toString(16).toUpperCase().padStart(2, '0')}`];
    }

    if (num <= 0xffff) {
      return [`#$${num.toString(16).toUpperCase().padStart(4, '0')}`];
    }

    return [`#$${num.toString(16).toUpperCase().padStart(6, '0')}`];
  }

  private formatTypedNumber(num: TypedNumber | { _tag: string; value: number | string }): string {
    let size = 1;
    if ('size' in num) {
      size = (num as TypedNumber).size;
    } else if (num._tag === 'Word') {
      size = 2;
    }

    if (typeof num.value === 'number') {
      const width = size * 2;
      const hex = num.value.toString(16).toUpperCase().padStart(width, '0');
      return size === 1 ? `#${hex}` : `#$${hex}`;
    }

    return `#${num.value}`;
  }

  private writeTypedNumber(num: TypedNumber | { _tag: string; value: number | string }): string[] {
    return [this.formatTypedNumber(num)];
  }

  private formatOperand(format: string, operands: any[]): string {
    return format.replace(/\{(\d+)(?::([^}]+))?\}/g, (match, index, formatSpec) => {
      const operand = operands[parseInt(index)];
      if (operand && typeof operand === 'object' && operand._tag && 'value' in operand) {
        const value = operand.value;
        if (formatSpec && typeof value === 'number' && formatSpec.startsWith('X')) {
          const width = parseInt(formatSpec.substring(1)) || 2;
          return value.toString(16).toUpperCase().padStart(width, '0');
        }
        return String(value);
      }

      if (formatSpec && typeof operand === 'number') {
        if (formatSpec.startsWith('X')) {
          const width = parseInt(formatSpec.substring(1)) || 2;
          return operand.toString(16).toUpperCase().padStart(width, '0');
        }
      }
      return String(operand);
    });
  }
} 