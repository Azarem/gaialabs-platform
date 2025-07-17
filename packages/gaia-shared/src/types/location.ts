/**
 * Location type for ROM addresses
 * Converted from GaiaLib/Types/Location.cs
 */
export class Location {
  private _offset: number;

  constructor(offset: number) {
    this._offset = offset & 0x3FFFFF;
  }

  public get offset(): number {
    return this._offset;
  }

  public get bank(): number {
    return (this._offset >> 16) & 0xFF;
  }

  public static readonly MAX_VALUE = 0x3FFFFF;
  public static readonly MIN_VALUE = 0;

  public toString(): string {
    return this._offset.toString(16).toUpperCase().padStart(6, '0');
  }

  public toInt(): number {
    return this._offset;
  }

  public equals(other: Location | number): boolean {
    if (other instanceof Location) {
      return this._offset === other._offset;
    }
    return this._offset === other;
  }

  public compareTo(other: Location | number): number {
    const otherOffset = other instanceof Location ? other._offset : other;
    return this._offset - otherOffset;
  }

  public static fromInt(offset: number): Location {
    return new Location(offset);
  }

  public static parse(s: string): Location {
    return new Location(parseInt(s, 16));
  }

  public static tryParse(s: string): Location | null {
    const parsed = parseInt(s, 16);
    return isNaN(parsed) ? null : new Location(parsed);
  }

  // Arithmetic operations
  public add(offset: number): Location {
    return new Location(this._offset + offset);
  }

  public subtract(offset: number): Location {
    return new Location(this._offset - offset);
  }

  public and(value: number): Location {
    return new Location(this._offset & value);
  }

  public or(value: number): Location {
    return new Location(this._offset | value);
  }

  // Comparison operations
  public isGreaterThan(other: Location | number): boolean {
    const otherOffset = other instanceof Location ? other._offset : other;
    return this._offset > otherOffset;
  }

  public isLessThan(other: Location | number): boolean {
    const otherOffset = other instanceof Location ? other._offset : other;
    return this._offset < otherOffset;
  }

  public isGreaterThanOrEqual(other: Location | number): boolean {
    const otherOffset = other instanceof Location ? other._offset : other;
    return this._offset >= otherOffset;
  }

  public isLessThanOrEqual(other: Location | number): boolean {
    const otherOffset = other instanceof Location ? other._offset : other;
    return this._offset <= otherOffset;
  }
}

/**
 * Location wrapper for additional metadata
 * Converted from GaiaLib/Types/LocationWrapper.cs
 */
export class LocationWrapper {
  public location: number;
  public type: import('./addressing').AddressType;

  constructor(location: number, type: import('./addressing').AddressType) {
    this.location = location;
    this.type = type;
  }
} 