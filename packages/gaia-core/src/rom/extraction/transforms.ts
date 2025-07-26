import { RomDataReader } from './reader';
import { ReferenceManager } from './references';
import { RomProcessingConstants } from 'gaia-shared';
import type { BlockReader } from './blocks';

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
    if (transform === '') {
      return transform;
    } else if (!transform) {
      return null;
    }

    const transformName = this.cleanTransformName(transform);
    const referenceLocation = this.resolveTransformReference(transformName);
    
    if (referenceLocation !== null) {
      this._blockReader.resolveInclude(referenceLocation, false);
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
    if (transform === null || transform === undefined || operandIndex >= operands.length) {
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
    
    let value = (this._romDataReader.position & 0xFF0000);
    const opnd = operands[operandIndex] as any;
    if(opnd && 'value' in opnd) {
      value |= opnd['value'];
    } else {
      value |= opnd as number;
    }

    const nameResult = this._referenceManager.tryGetName(value);
    let referenceName: string;
    
    if (!nameResult.found) {
      referenceName = `loc_${value.toString(16).toUpperCase().padStart(6, '0')}`;
      this._referenceManager.tryAddName(value, referenceName);
    } else {
      referenceName = nameResult.referenceName!;
    }
    
    this._blockReader.resolveInclude(value, false);
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
    // Directly resolve by name in the reference table
    const location = this._referenceManager.findLocationByName(transformName);
    if (location !== undefined) {
      return location;
    }

    // Fallback to parsing the location pattern
    const match = TransformProcessor.LOCATION_REGEX.exec(transformName);
    return match ? parseInt(match[1], 16) : null;
  }
}