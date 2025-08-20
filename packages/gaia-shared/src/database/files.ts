import { BinType } from '../types/resources';

/**
 * Database file definition
 * Converted from GaiaLib/Database/DbFile.cs
 */
export interface DbFile {
  name: string;
  type: BinType;
  start: number;
  end: number;
  compressed?: boolean;
  //move?: boolean;
  upper?: boolean;
} 