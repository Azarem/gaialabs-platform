import type { DbPart } from './parts';

/**
 * Database block definition
 * Converted from GaiaLib/Database/DbBlock.cs
 */
export interface DbBlock {
  name: string;
  movable: boolean;
  group: string;
  parts: DbPart[];
  transforms?: { key: string; value: string }[];
  postProcess?: string;
  // Internal references (handled by database root)
  //root?: any; // DbRoot reference
  //mnemonics?: Record<number, string>;
}
