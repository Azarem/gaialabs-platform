/**
 * TypeScript interfaces for Supabase API responses
 * These types represent the structured data returned from ROM database queries
 */

/**
 * Platform branch information containing instruction set and addressing modes
 */
export interface PlatformBranchData {
  id: string;
  name: string | null;
  version: number | null;
  platformId: string;
  addressingModes: any | null; // JSON field
  instructionSet: any | null; // JSON field
  vectors: any | null; // JSON field
  isPublic: boolean;
  createdAt: string;
  updatedAt: string;
}

/**
 * Game ROM branch information with platform reference
 */
export interface GameRomBranchData {
  id: string;
  name: string | null;
  version: number | null;
  gameRomId: string;
  platformBranchId: string;
  coplib: any | null; // JSON field
  config: any | null; // JSON field
  files: any | null; // JSON field
  blocks: any | null; // JSON field
  fixups: any | null; // JSON field
  types: any | null; // JSON field
  isPublic: boolean;
  platformBranch: PlatformBranchData;
  createdAt: string;
  updatedAt: string;
}

/**
 * Base ROM information
 */
export interface BaseRomData {
  id: string;
  name: string;
  gameId: string;
  gameRomId: string;
  createdAt: string;
  updatedAt: string;
}

/**
 * Base ROM branch with complete relationship chain
 */
export interface BaseRomBranchData {
  id: string;
  name: string | null;
  version: number | null;
  baseRomId: string;
  gameRomBranchId: string;
  fileCrcs: number[];
  isPublic: boolean;
  gameRomBranch: GameRomBranchData;
  baseRom: BaseRomData;
  createdAt: string;
  updatedAt: string;
}

/**
 * Base ROM file containing binary data
 */
export interface BaseRomFileData {
  id: string;
  name: string;
  type: string;
  version: number | null;
  crc: number | null;
  meta: any | null; // JSON field
  baseRomId: string;
  data: Uint8Array; // Converted from base64
  createdAt: string;
  updatedAt: string;
}

/**
 * Raw BaseRomFile data as returned from Supabase (before conversion)
 */
export interface BaseRomFileRaw {
  id: string;
  name: string;
  type: string;
  version: number | null;
  crc: number | null;
  meta: any | null;
  baseRomId: string;
  data: string; // Base64 encoded
  createdAt: string;
  updatedAt: string;
}

/**
 * Complete ROM payload containing branch data and files
 */
export interface BaseRomPayload {
  baseRomBranch: BaseRomBranchData;
  files: BaseRomFileData[];
}

/**
 * Options for loading ROM data by name
 */
export interface FromSupabaseByNameOptions {
  /**
   * Name of the game to load
   * @default 'Illusion of Gaia'
   */
  gameName: string;

  /**
   * Name of the base ROM to load
   * @default 'GaiaLabs BaseROM'
   */
  baseRomName: string;
  
  /**
   * Name of the branch to load
   * Set to null to load the main/develop branch
   * Set to undefined to not filter by branch name
   */
  branchName?: string | null;
  
  /**
   * Version of the branch to load
   * Set to null to load the latest/main version
   * Set to undefined to not filter by version
   */
  branchVersion?: number | null;
}

/**
 * Error codes for Supabase operations
 */
export enum SupabaseErrorCode {
  BRANCH_NOT_FOUND = 'BRANCH_NOT_FOUND',
  ROM_NOT_FOUND = 'ROM_NOT_FOUND',
  FILES_NOT_FOUND = 'FILES_NOT_FOUND',
  NETWORK_ERROR = 'NETWORK_ERROR',
  INVALID_DATA = 'INVALID_DATA',
  ENVIRONMENT_ERROR = 'ENVIRONMENT_ERROR',
  PERMISSION_ERROR = 'PERMISSION_ERROR',
}

/**
 * Custom error class for Supabase operations
 */
export class SupabaseFromError extends Error {
  constructor(
    message: string, 
    public readonly code: SupabaseErrorCode,
    public readonly details?: any
  ) {
    super(message);
    this.name = 'SupabaseFromError';
  }
}

/**
 * Result type for async operations that may fail
 */
export type SupabaseResult<T> = {
  data: T;
  error: null;
} | {
  data: null;
  error: SupabaseFromError;
};

/**
 * Query statistics for performance monitoring
 */
export interface QueryStats {
  branchQueryTime: number;
  fileQueryTime: number;
  totalTime: number;
  fileCount: number;
  totalDataSize: number;
}
