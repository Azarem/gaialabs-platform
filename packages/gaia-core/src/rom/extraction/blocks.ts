import { Registers } from '../../assembly';
import { Op } from '@gaialabs/shared';
import { RomDataReader } from './reader';
import { ProcessorStateManager } from './processor';
import { ReferenceManager } from './references';
import { StringReader } from './strings';
import { AsmReader } from './asm';
import { TypeParser } from './parser';
import { 
  Address, 
  AddressType, 
  LocationWrapper, 
  StructDef, 
  RegisterType,
  BlockReaderConstants,
  RomProcessingConstants,
  TableEntry,
  createTableEntry,
  BinType,
  AsmBlock,
  createChunkFileFromDbFile,
  createChunkFileFromDbBlock,
} from '@gaialabs/shared';
import type { DbFile, StringWrapper } from '@gaialabs/shared';
import type { DbRoot } from '@gaialabs/shared';
import type { DbBlock } from '@gaialabs/shared';
import type { DbPart } from '@gaialabs/shared';
import { ChunkFile, ChunkFileUtils } from '@gaialabs/shared';
import { indexOfAny } from '../../utils';
import { registerCompressionProviders } from '../../compression/registry'

registerCompressionProviders();

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

  // Current Processing State (Database)
  //public _currentBlock!: DbBlock;
  //public _currentPart: DbPart | null = null;
  public _partEnd: number = 0;
  
  // ChunkFile Processing State
  public _currentChunk: ChunkFile | null = null;
  public _currentAsmBlock: AsmBlock | null = null;
  public _enrichedChunks: ChunkFile[] = [];

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
          this._stateManager.setAccumulatorFlag(over.location, over.value === 1);
          break;
        case RegisterType.X:
          this._stateManager.setIndexFlag(over.location, over.value === 1);
          break;
        case RegisterType.B:
          this._stateManager.setBankNote(over.location, over.value);
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

    const ix = indexOfAny(label, RomProcessingConstants.OPERATORS);
    if (ix >= 0) {
      let opnd = parseInt(label.substring(ix + 1), 16);
      const op = label[ix];
      if(op === '-')
        opnd = -opnd;
      
      offset -= opnd;
    }

    // Add to current block's mnemonics
    this._currentChunk!.mnemonics[offset] = label.substring(0, ix >= 0 ? ix : label.length);
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
    const [outside, foundBlock, foundPart] = ChunkFileUtils.isOutsideWithPart(this._enrichedChunks, this._currentChunk!, loc);
    if (outside && foundBlock && foundPart) {
      this._currentAsmBlock!.includes!.add({block: foundBlock, part: foundPart});
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

  public analyzeAndResolve(): ChunkFile[] {
    this.createChunkFilesFromDatabase();
    this.initializeBlocksAndParts();
    this.analyzeChunkFiles();
    this.resolveReferences();
    
    return this._enrichedChunks;
  }

  /**
   * Analyzes all blocks in the ROM
   */
  // private analyzeBlocks(): void {
  //   this.initializeBlocksAndParts();

  //   for (const chunk of this._enrichedChunks) {
  //     this._currentChunk = chunk;
  //     for (const part of chunk.parts || []) {
  //       this.processPart(part);
  //     }
  //   }
  // }

  /**
   * Initializes blocks and parts with base references
   */
  private initializeBlocksAndParts(): void {
    for (const block of this._enrichedChunks) {
      for (const part of block.parts || []) {
        if(part.structName) {
          this._referenceManager.tryAddStruct(part.location, part.structName);
        }
        if(part.label) {
          this._referenceManager.tryAddName(part.location, part.label);
        }
      }
    }
  }

  /**
   * Processes a single part
   */
  private processPart(part: AsmBlock): void {
    this._currentAsmBlock = part;
    this._romDataReader.position = part.location;
    this._partEnd = part.location + part.size;

    let current = part.structName || BlockReaderConstants.BINARY_TYPE;
    const chunks: TableEntry[] = [];
    const reg = new Registers();
    const bank = part.bank;
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

    part.objList = chunks;
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
   * Creates ChunkFile objects from database structure
   */
  private createChunkFilesFromDatabase(): void {
    // Clear any previous results
    this._enrichedChunks = [];
    this.createChunkFilesFromSfx();
    // Convert DbFiles to binary ChunkFiles with rawData
    this.createChunkFilesFromDbFiles();
    // Convert DbBlocks to assembly ChunkFiles with parts
    this.createChunkFilesFromDbBlocks();
  }

  /**
   * Creates binary ChunkFiles from DbFiles (enriched with rawData)
   */
  private createChunkFilesFromSfx(): void {
    let pos = this._root.config.sfxLocation;
    const count = this._root.config.sfxCount;
    const romData = this._romDataReader.romData;

    const getSize = () => romData[pos++] | (romData[pos++] << 8);

    for (let i = 0; i < count; i++) {
      const size = getSize();
      const startPos = pos;
      let remaining = size;

      let end = pos + remaining;
      let data: Uint8Array;
      if (end & RomProcessingConstants.PAGE_SIZE) {
        const endLen = end & 0x7FFF;
        remaining -= endLen;
        data = romData.slice(pos, pos + remaining);
        pos += remaining + RomProcessingConstants.PAGE_SIZE;
        end = pos + endLen;
        const data2 = romData.slice(pos, end);
        data = new Uint8Array([...data, ...data2]);
      } else {
        data = romData.slice(pos, end);
      }
      pos = end;

      const chunk = new ChunkFile(`sfx${i.toString(16).toUpperCase().padStart(2, '0')}`, size, startPos, BinType.Sound);
      chunk.rawData = data;
      this._enrichedChunks.push(chunk);
    }
  }

  /**
   * Creates binary ChunkFiles from DbFiles (enriched with rawData)
   */
  private createChunkFilesFromDbFiles(): void {
    for (const dbFile of this._root.files) {
      const chunkFile = createChunkFileFromDbFile(this._romDataReader.romData, this._root.compression, dbFile);
      this._enrichedChunks.push(chunkFile);
    }
  }

  /**
   * Creates assembly ChunkFiles from DbBlocks (enriched with parts)
   */
  private createChunkFilesFromDbBlocks(): void {
    for (const block of this._root.blocks) {
      const chunkFile = createChunkFileFromDbBlock(block);
      this._enrichedChunks.push(chunkFile);
    }
  }
  /**
   * Analyzes only assembly ChunkFiles (those with parts from DbBlocks)
   */
  private analyzeChunkFiles(): void {
    // Only process assembly ChunkFiles, skip binary ones
    const assemblyChunks = this._enrichedChunks.filter(chunk => chunk.type === BinType.Assembly);
    
    for (const chunkFile of assemblyChunks) {
      this._currentChunk = chunkFile;
      for (const asmBlock of chunkFile.parts || []) {
        this._currentAsmBlock = asmBlock;
        this.processPart(asmBlock);
      }
    }
  }

  // /**
  //  * Processes a single AsmBlock (similar to processPart)
  //  */
  // private processAsmBlock(asmBlock: AsmBlock): void {
  //   this._romDataReader.position = asmBlock.location;
  //   this._partEnd = asmBlock.location + asmBlock.size;

  //   let current = asmBlock.structName || BlockReaderConstants.BINARY_TYPE;
  //   const chunks: TableEntry[] = [];
  //   const reg = new Registers();
  //   const bank = this._currentAsmBlock?.bank;
  //   let last: TableEntry | null = null;

  //   while (this._romDataReader.position < this._partEnd) {
  //     const structResult = this._referenceManager.tryGetStruct(this._romDataReader.position);
  //     if (structResult.found) {
  //       current = structResult.chunkType!;
  //     } else if (last !== null) {
  //       this.processContinuousEntry(current, reg, bank, last);
  //       continue;
  //     }

  //     last = createTableEntry(this._romDataReader.position);
  //     chunks.push(last);
  //     this.processNewEntry(current, reg, bank, last);
  //   }

  //   asmBlock.objList = chunks;
  // }

  /**
   * Resolves references in assembly ChunkFiles only
   */
  private resolveReferences(): void {
    for (const chunkFile of this._enrichedChunks) {
      this._currentChunk = chunkFile;
      
      for (const asmBlock of chunkFile.parts || []) {
        this._currentAsmBlock = asmBlock;
        this.resolveObject(asmBlock.objList, false);
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
    return op.mode === 'PCRelative' ||
           op.mode === 'PCRelativeLong' ||
           op.mnem[0] === 'J';
  }

  /**
   * Hydrates registers with stored state
   */
  public hydrateRegisters(reg: Registers): void {
    this._stateManager.hydrateRegisters(this._romDataReader.position, reg);
  }

}