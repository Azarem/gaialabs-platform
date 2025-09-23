/**
 * Database structure definition
 * Converted from GaiaLib/Database/DbStruct.cs
 */
export interface DbStruct {
  name: string;
  types: string[];
  parent?: string;
  delimiter?: number;
  discriminator?: number;
} 