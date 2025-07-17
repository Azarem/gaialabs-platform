import { RegisterType } from '../types/processor';
import { HexString } from '../types/hex';

/**
 * Database override definition
 * Converted from GaiaLib/Database/DbOverride.cs
 */
export interface DbOverride {
  location: number;
  register: RegisterType;
  value: HexString;
} 