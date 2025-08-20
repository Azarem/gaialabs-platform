
/**
 * COP instruction definition
 * Converted from GaiaLib/Database/CopDef.cs
 */
export interface CopDef {
  mnem: string;
  code: number;
  parts: string[];
  halt: boolean;
  size: number;
}
