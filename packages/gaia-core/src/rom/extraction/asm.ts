import { Op, OpCode, Registers } from '../../assembly';
import { RomDataReader } from './reader';
import { TransformProcessor } from './transforms';
import { AddressingModeHandler, OperationContext } from './addressing';
import type { DbRoot } from 'gaia-shared';

// Placeholder interface for BlockReader until it's implemented
interface BlockReader {
  _romDataReader: RomDataReader;
  _root: DbRoot;
  _referenceManager: any;
  _currentPart: { struct?: string } | null;
  AccumulatorFlags: Map<number, boolean>;
  IndexFlags: Map<number, boolean>;
  NoteType(location: number, type: string, isPush?: boolean, reg?: Registers): string;
  ResolveInclude(location: number, isBranch: boolean): void;
}

/**
 * Parses assembly instructions from ROM data, handling different addressing modes
 * and maintaining CPU register state during analysis.
 * Converted from GaiaLib/Rom/Extraction/AsmReader.cs
 */
export class AsmReader {
  // Constants
  private static readonly ACCUMULATOR_OP_MASK = 0xF;
  private static readonly ACCUMULATOR_OP_VALUE = 0x9;
  private static readonly VARIABLE_SIZE_INDICATOR = -2;
  private static readonly TWO_BYTES_SIZE = 2;
  private static readonly THREE_BYTES_SIZE = 3;

  private readonly _blockReader: BlockReader;
  private readonly _transformProcessor: TransformProcessor;
  private readonly _addressingModeHandler: AddressingModeHandler;
  private readonly _romDataReader: RomDataReader;

  constructor(blockReader: BlockReader) {
    this._blockReader = blockReader;
    this._transformProcessor = new TransformProcessor(blockReader);
    this._addressingModeHandler = new AddressingModeHandler(blockReader, this._transformProcessor);
    this._romDataReader = blockReader._romDataReader;
  }

  public parseAsm(reg: Registers): Op {
    const opStart = this._romDataReader.position;
    const opCode = this._romDataReader.readByte();
    
    // Find matching OpCode in the database
    const code = this._blockReader._root.opCodes[opCode];
    if (!code) {
      throw new Error('Unknown OpCode');
    }

    // Initialize operation context
    const operationContext = this.initializeOperation(code, reg, opStart);

    // Process operands based on the addressing mode
    const operands = this._addressingModeHandler.processAddressingMode(code, operationContext, reg);
    
    // Apply label transforms to operands after processing. This ensures that the ROM state is processed and valid.
    this._transformProcessor.applyTransforms(operationContext.xForm1, operationContext.xForm2, operands);

    return new Op(
      code,
      opStart,
      operands,
      this._romDataReader.position - opStart
    );
  }

  /**
   * PascalCase wrapper for parseAsm (for C# compatibility)
   */
  public ParseAsm(reg: Registers): Op {
    return this.parseAsm(reg);
  }

  public clearDestinationRegister(code: OpCode, reg: Registers): void {
    switch (code.mnem) {
      case 'LDA':
        reg.accumulator = undefined;
        break;
      case 'LDX':
        reg.xIndex = undefined;
        break;
      case 'LDY':
        reg.yIndex = undefined;
        break;
    }
  }

  private initializeOperation(code: OpCode, reg: Registers, loc: number): OperationContext {
    // Calculate instruction size (some are variable)
    const size = this.calculateInstructionSize(code, reg);

    // Calculate next address (for branching)
    const next = loc + size;

    // Clear destination register for load operations. This resets the register state
    this.clearDestinationRegister(code, reg);

    const context = new OperationContext();
    context.size = size;
    context.nextAddress = next;
    context.xForm1 = this._transformProcessor.getTransform();
    context.xForm2 = null;
    context.copDef = null;

    return context;
  }

  private calculateInstructionSize(code: OpCode, reg: Registers): number {
    let size = code.size;
    
    if (size === AsmReader.VARIABLE_SIZE_INDICATOR) {
      if ((code.code & AsmReader.ACCUMULATOR_OP_MASK) === AsmReader.ACCUMULATOR_OP_VALUE) {
        size = (reg.accumulatorFlag ?? false) ? AsmReader.TWO_BYTES_SIZE : AsmReader.THREE_BYTES_SIZE;
      } else {
        size = (reg.indexFlag ?? false) ? AsmReader.TWO_BYTES_SIZE : AsmReader.THREE_BYTES_SIZE;
      }
    }
    
    return size;
  }
} 