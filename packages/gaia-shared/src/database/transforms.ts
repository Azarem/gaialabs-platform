import { HexString } from '../types/hex';

/**
 * Database transform definition
 * Converted from GaiaLib/Database/DbTransform.cs
 */
export interface DbTransform {
  name: string;
  type?: string;
  bank?: HexString;
} 