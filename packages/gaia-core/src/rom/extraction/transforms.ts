import { RomDataReader } from './reader';
import { ReferenceManager } from './references';
import { RomProcessingConstants } from 'gaia-shared';
import type { DbRoot } from 'gaia-shared';

// Placeholder interface for BlockReader until it's implemented
interface BlockReader {
  _romDataReader: RomDataReader;
  _referenceManager: ReferenceManager;
  _root: DbRoot;
  ResolveInclude(location: number, isBranch: boolean): void;
}

/**
 * Handles transform processing for assembly instructions
 * Converted from GaiaLib/Rom/Extraction/TransformProcessor.cs
 */
export class TransformProcessor {
  private readonly _blockReader: BlockReader;
  private readonly _romDataReader: RomDataReader;
  private readonly _referenceManager: ReferenceManager;
  private readonly _labelLookup: Record<number, string>;

  // Location regex pattern: _([A-Fa-f0-9]{6})
  private static readonly LOCATION_REGEX = /_([A-Fa-f0-9]{6})/;

  constructor(romReader: BlockReader) {
    this._blockReader = romReader;
    this._romDataReader = romReader._romDataReader;
    this._referenceManager = romReader._referenceManager;
    this._labelLookup = romReader._root.labels;
  }

  /**
   * Retrieves transform information for the current ROM position
   */
  public getTransform(): string | null {
    const transform = this._labelLookup[this._romDataReader.position];
    if (!transform || transform === '') {
      return transform || null;
    }

    const transformName = this.cleanTransformName(transform);
    const referenceLocation = this.resolveTransformReference(transformName);
    
    if (referenceLocation !== null) {
      this._blockReader.ResolveInclude(referenceLocation, false);
    }

    return transform;
  }

  /**
   * Applies transforms to operands
   */
  public applyTransforms(op1Label: string | null, op2Label: string | null, operands: unknown[]): void {
    this.applyTransform(op1Label, 0, operands);
    this.applyTransform(op2Label, 1, operands);
  }

  private applyTransform(transform: string | null, operandIndex: number, operands: unknown[]): void {
    if (transform === null || operandIndex >= operands.length) {
      return;
    }

    // There is special logic for empty labels
    if (transform === '') {
      this.applyDefaultTransform(operandIndex, operands);
    } else {
      operands[operandIndex] = transform; // Otherwise it is a direct replacement
    }
  }

  private applyDefaultTransform(operandIndex: number, operands: unknown[]): void {
    const value = (this._romDataReader.position & 0xFF0000) | (operands[operandIndex] as number);
    
    const nameResult = this._referenceManager.tryGetName(value);
    let referenceName: string;
    
    if (!nameResult.found) {
      referenceName = `loc_${value.toString(16).toUpperCase().padStart(6, '0')}`;
      this._referenceManager.tryAddName(value, referenceName);
    } else {
      referenceName = nameResult.referenceName!;
    }
    
    this._blockReader.ResolveInclude(value, false);
    operands[operandIndex] = `&${referenceName}`;
  }

  private cleanTransformName(transform: string): string {
    let name = transform;
    
    // Remove address space characters from the start
    while (name.length > 0 && RomProcessingConstants.ADDRESS_SPACE.includes(name[0])) {
      name = name.substring(1);
    }
    
    // Find math operators and truncate at that point
    let mathIndex = -1;
    for (let i = 0; i < name.length; i++) {
      if (RomProcessingConstants.OPERATORS.includes(name[i])) {
        mathIndex = i;
        break;
      }
    }
    
    if (mathIndex > 0) {
      name = name.substring(0, mathIndex);
    }
    
    return name;
  }

  private resolveTransformReference(transformName: string): number | null {
    // First check reference table
    const nameResult = this._referenceManager.tryGetName(0); // This is a bit hacky, but we need to iterate through the name table
    // TODO: Add a method to ReferenceManager to search by name instead of location
    
    // For now, let's try to parse the location pattern directly
    const match = TransformProcessor.LOCATION_REGEX.exec(transformName);
    if (match) {
      return parseInt(match[1], 16);
    }

    return null;
  }
} 