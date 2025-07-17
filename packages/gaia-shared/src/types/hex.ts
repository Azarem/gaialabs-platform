/**
 * Hex string utility class
 * Converted from GaiaLib/Types/HexString.cs
 */
export class HexString {
  public value: number;
  public typeCode: HexStringType;

  constructor(value?: number | string | object) {
    if (value === undefined) {
      this.value = 0;
      this.typeCode = HexStringType.Byte;
    } else if (typeof value === 'string') {
      this.value = parseInt(value, 16);
      this.typeCode = this.getTypeCodeFromLength(value.length);
    } else if (typeof value === 'number') {
      this.value = value;
      this.typeCode = this.getTypeCodeFromValue(value);
    } else {
      this.value = Number(value);
      this.typeCode = this.getTypeCodeFromValue(this.value);
    }
  }

  private getTypeCodeFromLength(length: number): HexStringType {
    switch (length) {
      case 1:
      case 2:
        return HexStringType.Byte;
      case 3:
      case 4:
        return HexStringType.UInt16;
      case 5:
      case 6:
        return HexStringType.UInt32;
      default:
        throw new Error(`Unsupported hex string length: ${length}`);
    }
  }

  private getTypeCodeFromValue(value: number): HexStringType {
    if (value <= 0xFF) return HexStringType.Byte;
    if (value <= 0xFFFF) return HexStringType.UInt16;
    if (value <= 0xFFFFFF) return HexStringType.UInt32;
    throw new Error(`Value too large: ${value}`);
  }

  public getTypeFormat(): string {
    switch (this.typeCode) {
      case HexStringType.Byte:
        return '{0:X2}';
      case HexStringType.UInt16:
        return '{0:X4}';
      case HexStringType.UInt32:
        return '{0:X6}';
      default:
        throw new Error(`Unsupported type code: ${this.typeCode}`);
    }
  }

  public toString(): string {
    const format = this.getTypeFormat();
    const padLength = format.includes('X2') ? 2 : format.includes('X4') ? 4 : 6;
    return this.value.toString(16).toUpperCase().padStart(padLength, '0');
  }

  public toNumber(): number {
    return this.value;
  }

  public equals(other: HexString | number | string): boolean {
    if (other instanceof HexString) {
      return this.value === other.value;
    }
    if (typeof other === 'number') {
      return this.value === other;
    }
    if (typeof other === 'string') {
      return this.toString() === other;
    }
    return false;
  }

  public static fromByte(value: number): HexString {
    const hex = new HexString();
    hex.value = value & 0xFF;
    hex.typeCode = HexStringType.Byte;
    return hex;
  }

  public static fromUInt16(value: number): HexString {
    const hex = new HexString();
    hex.value = value & 0xFFFF;
    hex.typeCode = HexStringType.UInt16;
    return hex;
  }

  public static fromUInt32(value: number): HexString {
    const hex = new HexString();
    hex.value = value & 0xFFFFFF;
    hex.typeCode = HexStringType.UInt32;
    return hex;
  }
}

/**
 * Type codes for hex string formatting
 */
export enum HexStringType {
  Byte = 'Byte',
  UInt16 = 'UInt16',  
  UInt32 = 'UInt32'
} 