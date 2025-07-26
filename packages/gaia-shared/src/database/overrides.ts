import { RegisterType } from '../types/processor';
/**
 * Database override definition
 * Converted from GaiaLib/Database/DbOverride.cs
 */
export interface DbOverride {
  location: number;
  register: RegisterType;
  value: number;
} 