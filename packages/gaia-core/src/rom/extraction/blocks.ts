import { Op, Registers } from '../../assembly';
import { RomDataReader } from './reader';
import { ProcessorStateManager } from './processor';
import { ReferenceManager } from './references';
import { StringReader } from './strings';
import { AsmReader } from './asm';
import { TypeParser } from './parser';
import { 
  Address, 
  AddressingMode, 
  AddressType, 
  LocationWrapper, 
  StructDef, 
  RegisterType,
  BlockReaderConstants,
  RomProcessingConstants,
  TableEntry,
  createTableEntry
} from 'gaia-shared';
import type { StringWrapper } from 'gaia-shared';
import type { DbRoot } from 'gaia-shared';
import type { DbBlock } from 'gaia-shared';
import type { DbPart } from 'gaia-shared';
import { DbBlockUtils } from 'gaia-shared';

/**
 * Central class for reading and analyzing ROM blocks
 * Converted from GaiaLib/Rom/Extraction/BlockReader.cs
 */
export class BlockReader {
  // Constants
  private static readonly REF_SEARCH_MAX_RANGE = 0x1A0;
  private static readonly BANK_MASK_CHECK = 0x40;
  private static readonly BYTE_DELIMITER_THRESHOLD = 0x100;
  private static readonly BANK_HIGH_MEMORY_1 = 0x7E;
  private static readonly BANK_HIGH_MEMORY_2 = 0x7F;
  private static readonly POINTER_CHARACTERS = ['&', '@'];

  // Location regex pattern: _([A-Fa-f0-9]{6})
  private static readonly LOCATION_REGEX = /_([A-Fa-f0-9]{6})/;

  // Core Dependencies
  public readonly _root: DbRoot;
  public readonly _stringReader: StringReader;
  public readonly _asmReader: AsmReader;
  public readonly _typeParser: TypeParser;
  public readonly _romDataReader: RomDataReader;
  public readonly _stateManager: ProcessorStateManager;
  public readonly _referenceManager: ReferenceManager;

  // Backward Compatibility Properties
  public get AccumulatorFlags(): Map<number, boolean | null> {
    return this._stateManager.accumulatorFlags;
  }

  public get IndexFlags(): Map<number, boolean | null> {
    return this._stateManager.indexFlags;
  }

  public get BankNotes(): Map<number, number | null> {
    return this._stateManager.bankNotes;
  }

  public get StackPosition(): Map<number, number> {
    return this._stateManager.stackPositions;
  }

  // Direct access to reference management collections
  public get _structTable(): Map<number, string> {
    return this._referenceManager.structTable;
  }

  public get _markerTable(): Map<number, number> {
    return this._referenceManager.markerTable;
  }

  public get _nameTable(): Map<number, string> {
    return this._referenceManager.nameTable;
  }

  // Current Processing State
  public _currentBlock!: DbBlock;
  public _currentPart: DbPart | null = null;
  public _partEnd: number = 0;

  constructor(romData: Uint8Array, root: DbRoot) {
    this._romDataReader = new RomDataReader(romData);
    this._stateManager = new ProcessorStateManager();
    this._referenceManager = new ReferenceManager(root);
    this._root = root;

    this._stringReader = new StringReader(this as any);
    this._asmReader = new AsmReader(this as any);
    this._typeParser = new TypeParser(this as any);

    this.initializeOverrides();
    this.initializeFileReferences();
  }

  /**
   * Processes predefined overrides for registers and bank notes
   */
  private initializeOverrides(): void {
    for (const over of Object.values(this._root.overrides)) {
      switch (over.register) {
        case RegisterType.M:
          this._stateManager.setAccumulatorFlag(over.location, over.value.value !== 0);
          break;
        case RegisterType.X:
          this._stateManager.setIndexFlag(over.location, over.value.value !== 0);
          break;
        case RegisterType.B:
          this._stateManager.setBankNote(over.location, over.value.value);
          break;
      }
    }
  }

  /**
   * Processes predefined file references
   */
  private initializeFileReferences(): void {
    for (const file of this._root.files) {
      this._referenceManager.tryAddName(file.start, file.name);
    }
  }

  /**
   * Resolves mnemonic for a given address
   */
  public resolveMnemonic(addr: Address): void {
    // If the address is in high memory (ROM only), skip processing
    if ((addr.bank & Address.DATA_BANK_FLAG) !== 0) {
      return;
    }

    let offset = addr.offset;
    const label = this._root.mnemonics[offset];
    if (!label) {
      return;
    }

    const ix = this.indexOfAny(label, RomProcessingConstants.OPERATORS);
    if (ix >= 0) {
      const opnd = parseInt(label.substring(ix + 1), 16);
      const op = label[ix];
      
      offset -= op === '-' ? opnd : -opnd;
    }

    // Add to current block's mnemonics
    if (this._currentBlock.mnemonics) {
      this._currentBlock.mnemonics[offset] = label.substring(0, ix >= 0 ? ix : label.length);
    }
  }

  /**
   * Resolves name for a location (delegated to ReferenceManager)
   */
  public resolveName(location: number, type: AddressType, isBranch: boolean): string {
    return this._referenceManager.resolveName(location, type, isBranch);
  }

  /**
   * Resolves include for a location
   */
  public resolveInclude(loc: number, isBranch: boolean): void {
    if (DbBlockUtils.isOutside(this._currentBlock, loc) && this._currentPart) {
      // Find the part that contains this location
      let foundPart: DbPart | null = null;
      for (const block of this._root.blocks) {
        for (const part of block.parts) {
          if (loc >= part.start && loc < part.end) {
            foundPart = part;
            break;
          }
        }
        if (foundPart) break;
      }
      
      if (foundPart) {
        this._currentPart.includes = this._currentPart.includes || new Set();
        this._currentPart.includes.add(foundPart);
      }
    } else if (isBranch && !this._referenceManager.tryGetName(loc).found) {
      const name = `loc_${loc.toString(16).toUpperCase().padStart(6, '0')}`;
      this._referenceManager.tryAddName(loc, name);
    }
  }

  /**
   * Notes a type at a location and manages chunk references
   */
  public noteType(loc: number, type: string, silent: boolean = false, reg?: Registers): string {
    this._referenceManager.tryAddStruct(loc, type);

    const nameResult = this._referenceManager.tryGetName(loc);
    let name: string;
    
    if (!nameResult.found) {
      name = this._referenceManager.createTypeName(type, loc);
      this._referenceManager.tryAddName(loc, name);
    } else {
      name = nameResult.referenceName!;
    }

    if (!silent && type === BlockReaderConstants.CODE_TYPE && reg) {
      this.updateRegisterState(loc, reg);
    }

    return name;
  }

  /**
   * PascalCase wrapper for noteType (for C# compatibility)
   */
  public NoteType(loc: number, type: string, silent: boolean = false, reg?: Registers): string {
    return this.noteType(loc, type, silent, reg);
  }

  private updateRegisterState(loc: number, reg: Registers): void {
    if (reg.accumulatorFlag !== undefined) {
      this._stateManager.tryAddAccumulatorFlag(loc, reg.accumulatorFlag);
    }
    if (reg.indexFlag !== undefined) {
      this._stateManager.tryAddIndexFlag(loc, reg.indexFlag);
    }
    if (reg.stack.location > 0) {
      this._stateManager.tryAddStackPosition(loc, reg.stack.location);
    }
  }

  /**
   * Checks if a delimiter has been reached
   */
  public delimiterReached(delimiter?: number): boolean {
    if (delimiter === undefined) {
      return false;
    }

    if (delimiter >= BlockReaderConstants.BYTE_DELIMITER_THRESHOLD) {
      if (this._romDataReader.peekShort() === delimiter) {
        this._romDataReader.position += 2;
        return true;
      }
    } else if (this._romDataReader.peekByte() === delimiter) {
      this._romDataReader.position++;
      return true;
    }

    return false;
  }

  /**
   * Checks if processing of the current part can continue
   */
  public partCanContinue(): boolean {
    return this._romDataReader.position < this._partEnd && 
           !this._referenceManager.containsStruct(this._romDataReader.position);
  }

  /**
   * PascalCase wrapper for delimiterReached (for C# compatibility)
   */
  public DelimiterReached(delimiter?: number): boolean {
    return this.delimiterReached(delimiter);
  }

  /**
   * PascalCase wrapper for partCanContinue (for C# compatibility)
   */
  public PartCanContinue(): boolean {
    return this.partCanContinue();
  }

  /**
   * PascalCase wrapper for resolveInclude (for C# compatibility)
   */
  public ResolveInclude(location: number, isBranch: boolean): void {
    this.resolveInclude(location, isBranch);
  }

  /**
   * PascalCase wrapper for resolveName (for C# compatibility)
   */
  public ResolveName(location: number, type: AddressType, isBranch: boolean): string {
    return this.resolveName(location, type, isBranch);
  }

  /**
   * Main analysis entry point
   */
  public analyzeAndResolve(): void {
    this.analyzeBlocks();
    this.resolveReferences();
  }

  /**
   * Analyzes all blocks in the ROM
   */
  private analyzeBlocks(): void {
    this.initializeBlocksAndParts();

    for (const block of this._root.blocks) {
      this._currentBlock = block;
      for (const part of block.parts) {
        this.processPart(part);
      }
    }
  }

  /**
   * Initializes blocks and parts with base references
   */
  private initializeBlocksAndParts(): void {
    for (const block of this._root.blocks) {
      for (const part of block.parts) {
        part.includes = new Set();
        this._referenceManager.tryAddStruct(part.start, part.struct);
        this._referenceManager.tryAddName(part.start, part.name);
      }
    }
  }

  /**
   * Processes a single part
   */
  private processPart(part: DbPart): void {
    this._currentPart = part;
    this._romDataReader.position = part.start;
    this._partEnd = part.end;

    let current = part.struct || BlockReaderConstants.BINARY_TYPE;
    const chunks: TableEntry[] = [];
    const reg = new Registers();
    const bank = part.bank?.value;
    let last: TableEntry | null = null;

    while (this._romDataReader.position < this._partEnd) {
      const structResult = this._referenceManager.tryGetStruct(this._romDataReader.position);
      if (structResult.found) {
        current = structResult.chunkType!;
      } else if (last !== null) {
        this.processContinuousEntry(current, reg, bank, last);
        continue;
      }

      last = createTableEntry(this._romDataReader.position);
      chunks.push(last);
      this.processNewEntry(current, reg, bank, last);
    }

    part.objectRoot = chunks;
  }

  /**
   * Processes a continuous entry (same type as previous)
   */
  private processContinuousEntry(current: string, reg: Registers, bank: number | undefined, last: TableEntry): void {
    const obj = this._typeParser.parseType(current, reg, 0, bank);
    if (!Array.isArray(last.object)) {
      last.object = [last.object];
    }
    (last.object as unknown[]).push(obj);
  }

  /**
   * Processes a new entry
   */
  private processNewEntry(current: string, reg: Registers, bank: number | undefined, last: TableEntry): void {
    let res = this._typeParser.parseType(current, reg, 0, bank);
    if (BlockReaderConstants.POINTER_CHARACTERS.includes(current[0]) && !Array.isArray(res)) {
      res = [res];
    }
    last.object = res;
  }

  /**
   * Resolves all references after analysis
   */
  private resolveReferences(): void {
    for (const block of this._root.blocks) {
      this._currentBlock = block;
      for (const part of block.parts) {
        this._currentPart = part;
        this.resolveObject(part.objectRoot, false);
      }
    }
  }

  /**
   * Resolves a single object and its references
   */
  private resolveObject(obj: unknown, isBranch: boolean): void {
    if (typeof obj === 'string') {
      // String objects don't need resolution
      return;
    }

    if (Array.isArray(obj)) {
      for (const o of obj) {
        this.resolveObject(o, isBranch);
      }
      return;
    }

    if (obj instanceof Address) {
      this.resolveMnemonic(obj);
      return;
    }

    if (typeof obj === 'number') {
      this.resolveInclude(obj, isBranch);
      return;
    }

    if (obj instanceof LocationWrapper) {
      this.resolveInclude(obj.location, isBranch);
      return;
    }

    if (obj && typeof obj === 'object') {
      if ('string' in obj && 'type' in obj) {
        // StringWrapper
        this._stringReader.resolveString(obj as StringWrapper, isBranch);
        return;
      }

      if ('name' in obj && 'parts' in obj) {
        // StructDef
        this.resolveObject((obj as StructDef).parts, isBranch);
        return;
      }

      if ('location' in obj && 'object' in obj) {
        // TableEntry
        this.resolveObject((obj as TableEntry).object, isBranch);
        return;
      }

      if ('code' in obj && 'operands' in obj) {
        // Op
        this.resolveOperationObject(obj as Op);
        return;
      }
    }
  }

  /**
   * Resolves references in an operation object
   */
  private resolveOperationObject(op: Op): void {
    const branch = this.isBranchOperation(op);
    for (const opnd of op.operands) {
      this.resolveObject(opnd, branch);
    }
  }

  /**
   * Checks if an operation is a branch operation
   */
  private isBranchOperation(op: Op): boolean {
    return op.code.mode === AddressingMode.PCRelative ||
           op.code.mode === AddressingMode.PCRelativeLong ||
           op.code.mnem[0] === 'J';
  }

  /**
   * Hydrates registers with stored state
   */
  public hydrateRegisters(reg: Registers): void {
    this._stateManager.hydrateRegisters(this._romDataReader.position, reg);
  }

  /**
   * PascalCase wrapper for hydrateRegisters (for C# compatibility)
   */
  public HydrateRegisters(reg: Registers): void {
    this.hydrateRegisters(reg);
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