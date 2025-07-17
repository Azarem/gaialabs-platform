import { Location } from '../types/location';
import { HexString } from '../types/hex';

/**
 * Database sound effect definition
 * Converted from GaiaLib/Database/DbSfx.cs
 */
export interface DbSfx {
  location: Location;
  size: HexString;
  names: string[];
} 