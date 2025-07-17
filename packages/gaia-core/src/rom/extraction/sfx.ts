import { Address, BinType } from 'gaia-shared';
import type { DbRoot } from 'gaia-shared';

/**
 * Reads and extracts SFX data from ROM
 * Converted from GaiaLib/Rom/Extraction/SfxReader.cs
 */
export class SfxReader {
  private readonly _romData: Uint8Array;
  private readonly _dbRoot: DbRoot;
  private _location: number;
  private _count: number;

  constructor(romData: Uint8Array, dbRoot: DbRoot) {
    this._romData = romData;
    this._dbRoot = dbRoot;
    this._location = dbRoot.config.sfxLocation;
    this._count = dbRoot.config.sfxCount;
  }

  /**
   * Reads a byte from the rom data
   */
  private readByte(): number {
    // Only read from the lower bank. If we are in the upper bank, move to the next bank
    if ((this._location & Address.UPPER_BANK) !== 0) {
      this._location += Address.UPPER_BANK;
    }

    return this._romData[this._location++];
  }

  /**
   * Reads a short from the rom data
   */
  private readShort(): number {
    return this.readByte() | (this.readByte() << 8);
  }

  /**
   * Extracts the sfx from the rom data to the given output path
   */
  public async extract(outPath: string): Promise<void> {
    const res = this.getPath(BinType.Sound);
    if (res?.folder) {
      outPath = `${outPath}/${res.folder}`;
    }

    // Create directory (in browser environment, this would be handled differently)
    if (typeof window === 'undefined') {
      // Node.js environment
      const path = await import('path');
      const fs = await import('fs');
      fs.mkdirSync(outPath, { recursive: true });
    }

    for (let i = 0; i < this._count; i++) {
      // Read the size of the sfx
      const size = this.readShort();

      // Generate the full file path
      const filePath = `${outPath}/sfx${i.toString(16).padStart(2, '0').toUpperCase()}.${res?.extension || 'bin'}`;

      // For browser environment, we'll collect the data and return it
      // For Node.js, we'll write to file
      if (typeof window === 'undefined') {
        // Node.js environment
        const fs = await import('fs');
        
        // If the file exists, skip it
        if (fs.existsSync(filePath)) {
          // Advance the read position to the next sfx
          this._location += size;
        } else {
          // Read sfx data into temporary buffer
          const sfxData = new Uint8Array(size);
          for (let x = 0; x < size; x++) {
            sfxData[x] = this.readByte();
          }

          // Create the file and write the sfx data to it
          fs.writeFileSync(filePath, sfxData);
        }
      } else {
        // Browser environment - just advance the location
        this._location += size;
      }
    }
  }

  /**
   * Gets the path information for a binary type
   * TODO: This should be implemented in DbRoot
   */
  private getPath(binType: BinType): { folder?: string; extension?: string } | null {
    // Placeholder implementation - this should be implemented in DbRoot
    switch (binType) {
      case BinType.Sound:
        return { folder: 'sound', extension: 'sfc' };
      default:
        return null;
    }
  }
} 