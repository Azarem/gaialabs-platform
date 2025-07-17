import { Registers } from '../../assembly';
import { StatusFlags } from 'gaia-shared';
import { RomDataReader } from './reader';

// Placeholder interface for BlockReader until it's implemented
interface BlockReader {
  _romDataReader: RomDataReader;
}

/**
 * Handles stack operations for various stack-related instructions
 * Converted from GaiaLib/Rom/Extraction/StackOperations.cs
 */
export class StackOperations {
  private readonly _registers: Registers;
  private readonly _blockReader: BlockReader;

  constructor(registers: Registers, blockReader: BlockReader) {
    this._registers = registers;
    this._blockReader = blockReader;
  }

  public handleStackOperation(mnemonic: string): void {
    switch (mnemonic) {
      case 'PHD':
        this._registers.stack.push(this._registers.direct ?? 0);
        break;
        
      case 'PLD':
        this._registers.direct = this._registers.stack.popUInt16();
        break;
        
      case 'PHK':
        this._registers.stack.push((this._blockReader._romDataReader.position >> 16) | 0x80);
        break;
        
      case 'PHB':
        this._registers.stack.push(this._registers.dataBank ?? 0x81);
        break;
        
      case 'PLB':
        this._registers.dataBank = this._registers.stack.popByte();
        break;
        
      case 'PHP':
        this._registers.stack.push(this._registers.statusFlags);
        break;
        
      case 'PLP':
        this._registers.statusFlags = this._registers.stack.popByte() as StatusFlags;
        break;

      case 'PHA':
        this.handleAccumulatorPush();
        break;

      case 'PLA':
        this.handleAccumulatorPull();
        break;

      case 'PHX':
        this.handleXIndexPush();
        break;

      case 'PLX':
        this.handleXIndexPull();
        break;

      case 'PHY':
        this.handleYIndexPush();
        break;

      case 'PLY':
        this.handleYIndexPull();
        break;

      case 'XBA':
        this.handleExchangeBytes();
        break;
    }
  }

  private handleAccumulatorPush(): void {
    if (this._registers.accumulatorFlag === true) {
      this._registers.stack.push((this._registers.accumulator ?? 0) & 0xFF);
    } else {
      this._registers.stack.pushUInt16(this._registers.accumulator ?? 0);
    }
  }

  private handleAccumulatorPull(): void {
    if (this._registers.accumulatorFlag === true) {
      this._registers.accumulator = ((this._registers.accumulator ?? 0) & 0xFF00) | this._registers.stack.popByte();
    } else {
      this._registers.accumulator = this._registers.stack.popUInt16();
    }
  }

  private handleXIndexPush(): void {
    if (this._registers.indexFlag === true) {
      this._registers.stack.push((this._registers.xIndex ?? 0) & 0xFF);
    } else {
      this._registers.stack.pushUInt16(this._registers.xIndex ?? 0);
    }
  }

  private handleXIndexPull(): void {
    if (this._registers.indexFlag === true) {
      this._registers.xIndex = ((this._registers.xIndex ?? 0) & 0xFF00) | this._registers.stack.popByte();
    } else {
      this._registers.xIndex = this._registers.stack.popUInt16();
    }
  }

  private handleYIndexPush(): void {
    if (this._registers.indexFlag === true) {
      this._registers.stack.push((this._registers.yIndex ?? 0) & 0xFF);
    } else {
      this._registers.stack.pushUInt16(this._registers.yIndex ?? 0);
    }
  }

  private handleYIndexPull(): void {
    if (this._registers.indexFlag === true) {
      this._registers.yIndex = ((this._registers.yIndex ?? 0) & 0xFF00) | this._registers.stack.popByte();
    } else {
      this._registers.yIndex = this._registers.stack.popUInt16();
    }
  }

  private handleExchangeBytes(): void {
    const acc = this._registers.accumulator ?? 0;
    this._registers.accumulator = ((acc >> 8) | (acc << 8)) & 0xFFFF;
  }
} 