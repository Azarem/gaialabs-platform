import { AddressingMode } from '../types/addressing';
// import { HexString } from '../types/hex';

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

/**
 * COP library functions
 * Converted from GaiaLib/Database/CopLib.cs
 */
export interface CopLib {
  codes: Record<string, CopDef>;
  formats: Record<AddressingMode, string>;
} 