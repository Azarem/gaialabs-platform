import { OpCode, Registers } from '../../assembly';
import {
  AddressType,
  AddressSpace,
  Address,
  LocationWrapper,
  StatusFlags,
  createByte,
  createWord,
} from '@gaialabs/shared';
import { RomDataReader } from './reader';
import { StackOperations } from './stack';
import { TransformProcessor } from './transforms';
import { CopCommandProcessor } from './cop';
import type { DbRoot, CopDef } from '@gaialabs/shared';
import type { BlockReader } from './blocks';

/**
 * Context information for an operation being processed
 * Converted from GaiaLib/Rom/Extraction/AsmReader.cs OperationContext
 */
export class OperationContext {
  public size: number = 0;
  public nextAddress: number = 0;
  public xForm1: string | null = null;
  public xForm2: string | null = null;
  public copDef: CopDef | null = null;
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
      case 'Stack':
      case 'Implied':
      case 'Accumulator':
        this.handleStackOrImpliedMode(code.mnem, reg);
        break;

      case 'Immediate':
        this.handleImmediateMode(code.mnem, context.size, operands, reg);
        break;

      case 'AbsoluteIndirect':
      case 'AbsoluteIndirectLong':
      case 'AbsoluteIndexedIndirect':
      case 'Absolute':
      case 'AbsoluteIndexedX':
      case 'AbsoluteIndexedY':
        this.handleAbsoluteMode(code.mnem, undefined, context.nextAddress, reg.dataBank, operands, reg);
        break;

      case 'AbsoluteLong':
      case 'AbsoluteLongIndexedX':
        this.handleAbsoluteLongMode(code.mnem, operands, reg);
        break;

      case 'BlockMove':
        this.handleBlockMoveMode(operands, context);
        break;

      case 'DirectPage':
      case 'DirectPageIndexedIndirectX':
      case 'DirectPageIndexedX':
      case 'DirectPageIndexedY':
      case 'DirectPageIndirect':
      case 'DirectPageIndirectIndexedY':
      case 'DirectPageIndirectLong':
      case 'DirectPageIndirectLongIndexedY':
        this.handleDirectPageMode(operands);
        break;

      case 'PCRelative':
        this.handlePCRelativeMode(operands, context.nextAddress, reg, false);
        break;

      case 'PCRelativeLong':
        this.handlePCRelativeMode(operands, context.nextAddress, reg, true);
        break;

      case 'StackRelative':
      case 'StackRelativeIndirectIndexedY':
        this.handleStackRelativeMode(operands);
        break;

      case 'StackInterrupt':
        this.handleStackInterruptMode(code.mnem, operands, context);
        break;

      default:
        throw new Error(`Unknown addressing mode: ${code}`);
    }

    return operands;
  }

  private handleImmediateMode(mnemonic: string, size: number, operands: unknown[], reg: Registers): void {
    const operand = this.readImmediateOperand(size);
    operands.push(operand);
    this.updateRegisterForImmediateInstruction(mnemonic, operand, reg);
  }

  private readImmediateOperand(size: number) {
    return size === 3
      ? createWord(this._dataReader.readUShort())
      : createByte(this._dataReader.readByte());
  }

  private updateRegisterForImmediateInstruction(
    mnemonic: string,
    operand: number | { value: number },
    reg: Registers
  ): void {
    const value = typeof operand === 'number' ? operand : operand.value;
    switch (mnemonic) {
      case 'LDA':
        reg.accumulator = this.calculateRegisterValue(reg.accumulator, value);
        break;

      case 'LDX':
        reg.xIndex = this.calculateRegisterValue(reg.xIndex, value);
        break;

      case 'LDY':
        reg.yIndex = this.calculateRegisterValue(reg.yIndex, value);
        break;

      case 'SEP':
      case 'REP':
        this.updateStatusFlags(mnemonic, value);
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
        this._blockReader.noteType(wrapper.location, 'Code', false, reg);
      }
      operands.push(wrapper);
    } else {
      operands.push(address);
    }
  }

  private handleBlockMoveMode(operands: unknown[], context: OperationContext): void {
    operands.push(createByte(this._dataReader.readByte()));
    context.xForm2 = this._transformProcessor.getTransform();
    operands.push(createByte(this._dataReader.readByte()));
  }

  private handleDirectPageMode(operands: unknown[]): void {
    operands.push(createByte(this._dataReader.readByte()));
  }

  private handlePCRelativeMode(operands: unknown[], nextAddress: number, reg: Registers, isLong: boolean): void {
    const relative = isLong
      ? nextAddress + this._dataReader.readShort()
      : nextAddress + this._dataReader.readSByte();

    this._blockReader.noteType(relative, 'Code', undefined, reg);
    operands.push(new LocationWrapper(relative, AddressType.Relative));
  }

  private handleStackRelativeMode(operands: unknown[]): void {
    operands.push(createByte(this._dataReader.readByte()));
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
        const name = this._blockReader.noteType(wrapper.location, 'Code', isPush, registers);

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