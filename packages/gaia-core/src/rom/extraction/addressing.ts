import { OpCode, Registers } from '../../assembly';
import { AddressingMode, AddressType, AddressSpace, Address, LocationWrapper, StatusFlags } from 'gaia-shared';
import { RomDataReader } from './reader';
import { StackOperations } from './stack';
import { TransformProcessor } from './transforms';
import { CopCommandProcessor } from './cop';
import type { DbRoot } from 'gaia-shared';

// Placeholder interfaces for dependencies that aren't implemented yet
interface BlockReader {
  _romDataReader: RomDataReader;
  _root: DbRoot;
  _currentPart: { struct?: string } | null;
  AccumulatorFlags: Map<number, boolean>;
  IndexFlags: Map<number, boolean>;
  NoteType(location: number, type: string, isPush?: boolean, reg?: Registers): string;
}







/**
 * Context information for an operation being processed
 * Converted from GaiaLib/Rom/Extraction/AsmReader.cs OperationContext
 */
export class OperationContext {
  public size: number = 0;
  public nextAddress: number = 0;
  public xForm1: string | null = null;
  public xForm2: string | null = null;
  public copDef: any = null;
}

/**
 * Handles different addressing modes for assembly instructions
 * Converted from GaiaLib/Rom/Extraction/AddressingModeHandler.cs
 */
export class AddressingModeHandler {
  private readonly _blockReader: BlockReader;
  private readonly _transformProcessor: TransformProcessor;
  private readonly _copProcessor: CopCommandProcessor;
  private readonly _dataReader: RomDataReader;

  constructor(blockReader: BlockReader, transformProcessor: TransformProcessor) {
    this._blockReader = blockReader;
    this._transformProcessor = transformProcessor;
    this._copProcessor = new CopCommandProcessor(blockReader);
    this._dataReader = blockReader._romDataReader;
  }

  public processAddressingMode(code: OpCode, context: OperationContext, reg: Registers): unknown[] {
    const operands: unknown[] = [];

    switch (code.mode) {
      case AddressingMode.Stack:
      case AddressingMode.Implied:
        this.handleStackOrImpliedMode(code.mnem, reg);
        break;

      case AddressingMode.Immediate:
        this.handleImmediateMode(code.mnem, context.size, operands, reg);
        break;

      case AddressingMode.AbsoluteIndirect:
      case AddressingMode.AbsoluteIndirectLong:
      case AddressingMode.AbsoluteIndexedIndirect:
      case AddressingMode.Absolute:
      case AddressingMode.AbsoluteIndexedX:
      case AddressingMode.AbsoluteIndexedY:
        this.handleAbsoluteMode(code.mnem, undefined, context.nextAddress, reg.dataBank, operands, reg);
        break;

      case AddressingMode.AbsoluteLong:
      case AddressingMode.AbsoluteLongIndexedX:
        this.handleAbsoluteLongMode(code.mnem, operands, reg);
        break;

      case AddressingMode.BlockMove:
        this.handleBlockMoveMode(operands, context);
        break;

      case AddressingMode.DirectPage:
      case AddressingMode.DirectPageIndexedIndirectX:
      case AddressingMode.DirectPageIndexedX:
      case AddressingMode.DirectPageIndexedY:
      case AddressingMode.DirectPageIndirect:
      case AddressingMode.DirectPageIndirectIndexedY:
      case AddressingMode.DirectPageIndirectLong:
      case AddressingMode.DirectPageIndirectLongIndexedY:
        this.handleDirectPageMode(operands);
        break;

      case AddressingMode.PCRelative:
        this.handlePCRelativeMode(operands, context.nextAddress, reg, false);
        break;

      case AddressingMode.PCRelativeLong:
        this.handlePCRelativeMode(operands, context.nextAddress, reg, true);
        break;

      case AddressingMode.StackRelative:
      case AddressingMode.StackRelativeIndirectIndexedY:
        this.handleStackRelativeMode(operands);
        break;

      case AddressingMode.StackInterrupt:
        this.handleStackInterruptMode(code.mnem, operands, context);
        break;
    }

    return operands;
  }

  private handleImmediateMode(mnemonic: string, size: number, operands: unknown[], reg: Registers): void {
    const operand = this.readImmediateOperand(size);
    operands.push(operand);
    this.updateRegisterForImmediateInstruction(mnemonic, operand, reg);
  }

  private readImmediateOperand(size: number): number {
    return size === 3 ? this._dataReader.readUShort() : this._dataReader.readByte();
  }

  private updateRegisterForImmediateInstruction(mnemonic: string, operand: number, reg: Registers): void {
    switch (mnemonic) {
      case 'LDA':
        reg.accumulator = this.calculateRegisterValue(reg.accumulator, operand);
        break;

      case 'LDX':
        reg.xIndex = this.calculateRegisterValue(reg.xIndex, operand);
        break;

      case 'LDY':
        reg.yIndex = this.calculateRegisterValue(reg.yIndex, operand);
        break;

      case 'SEP':
      case 'REP':
        this.updateStatusFlags(mnemonic, operand);
        break;
    }
  }

  private calculateRegisterValue(currentValue: number | undefined, operand: number): number {
    if (operand > 255) {
      // 16-bit mode: use full operand value
      return operand;
    } else {
      // 8-bit mode: preserve high byte
      return ((currentValue ?? 0) & 0xFF00) | operand;
    }
  }

  private updateStatusFlags(mnemonic: string, flagValue: number): void {
    const flag = flagValue as StatusFlags;
    const isSep = mnemonic === 'SEP';

    if (flag & StatusFlags.AccumulatorMode) {
      this._blockReader.AccumulatorFlags.set(this._dataReader.position, isSep);
    }

    if (flag & StatusFlags.IndexMode) {
      this._blockReader.IndexFlags.set(this._dataReader.position, isSep);
    }
  }

  private handleAbsoluteLongMode(mnemonic: string, operands: unknown[], reg: Registers): void {
    const refLoc = this._dataReader.readUShort();
    const bank = this._dataReader.readByte();
    const address = new Address(bank, refLoc);

    if (address.space === AddressSpace.ROM) {
      const wrapper = new LocationWrapper(address.toInt(), AddressType.Address);
      if (this.isJumpInstruction(mnemonic)) {
        this._blockReader.NoteType(wrapper.location, 'Code', false, reg);
      }
      operands.push(wrapper);
    } else {
      operands.push(address);
    }
  }

  private handleBlockMoveMode(operands: unknown[], context: OperationContext): void {
    operands.push(this._dataReader.readByte());
    context.xForm2 = this._transformProcessor.getTransform();
    operands.push(this._dataReader.readByte());
  }

  private handleDirectPageMode(operands: unknown[]): void {
    operands.push(this._dataReader.readByte());
  }

  private handlePCRelativeMode(operands: unknown[], nextAddress: number, reg: Registers, isLong: boolean): void {
    const relative = isLong
      ? nextAddress + this._dataReader.readShort()
      : nextAddress + this._dataReader.readSByte();

    this._blockReader.NoteType(relative, 'Code', undefined, reg);
    operands.push(relative);
  }

  private handleStackRelativeMode(operands: unknown[]): void {
    operands.push(this._dataReader.readByte());
  }

  private handleStackInterruptMode(mnemonic: string, operands: unknown[], context: OperationContext): void {
    const cmd = this._dataReader.readByte();
    operands.push(cmd);

    if (mnemonic === 'COP') {
      const copDef = this._blockReader._root.copDef[cmd];
      if (!copDef) {
        throw new Error('Unknown COP command');
      }

      context.copDef = copDef;
      this._copProcessor.parseCopCommand(copDef, operands);
    }
  }

  private handleStackOrImpliedMode(mnemonic: string, reg: Registers): void {
    const stackOperations = new StackOperations(reg, this._blockReader);
    stackOperations.handleStackOperation(mnemonic);
  }

  private handleAbsoluteMode(
    mnemonic: string,
    xBank1: number | undefined,
    next: number,
    dataBank: number | undefined,
    operands: unknown[],
    registers: Registers
  ): void {
    let refLoc = this._dataReader.readUShort();

    const isPush = this.isPushInstruction(mnemonic);
    if (isPush) {
      refLoc++;
    }

    const isJump = isPush || this.isJumpInstruction(mnemonic);
    const bank = xBank1 ?? (isJump ? (this._dataReader.position >> 16) : dataBank ?? 0x81);

    const addr = new Address(bank, refLoc);
    if (addr.isROM) {
      const wrapper = new LocationWrapper(addr.toInt(), AddressType.Offset);
      if (isJump) {
        const name = this._blockReader.NoteType(wrapper.location, 'Code', isPush, registers);

        if (isPush) {
          operands.push(`&${name}-1`);
          return;
        }
      }
      operands.push(wrapper);
    } else {
      operands.push(addr);
    }
  }

  private isJumpInstruction(mnemonic: string): boolean {
    return mnemonic[0] === 'J';
  }

  private isPushInstruction(mnemonic: string): boolean {
    return mnemonic[0] === 'P';
  }
} 