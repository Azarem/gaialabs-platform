/**
 * TypeScript interfaces for Supabase API responses
 * These types represent the structured data returned from ROM database queries
 */

export interface PlatformData {
  id: string;
  name: string;
  meta: any | null;
  createdAt: string;
  updatedAt: string;
}

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
  types: any | null; // JSON field
  // Optional metadata commonly present in branch tables
  isActive?: boolean | null;
  notes?: string[] | null;
  createdAt: string;
  updatedAt: string;
  platform: PlatformData;
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
  //types: any | null; // JSON field
  strings: any | null; // JSON field
  structs: any | null; // JSON field
  scenes: any | null; // JSON field
  // Optional metadata commonly present in branch tables
  isActive?: boolean | null;
  notes?: string[] | null;
  gameRom: GameRomData;
  platformBranch: PlatformBranchData;
  createdAt: string;
  updatedAt: string;
}

export interface GameRomBranchAssetData {
  id: string;
  name: string;
  type: string;
  gameRomBranchId: string;
  text?: string;
  data?: Uint8Array;
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
  //game: GameData;
  //gameRom: GameRomData;
}

export interface GameData {
  id: string;
  name: string;
  createdAt: string;
  updatedAt: string;
}

export interface RegionData {
  id: string;
  name: string;
  meta: any | null;
  platformId: string;
  createdAt: string;
  updatedAt: string;
}

export interface GameRomData {
  id: string;
  crc: number;
  meta: any | null;
  gameId: string;
  regionId: string;
  createdAt: string;
  updatedAt: string;
  game: GameData;
  region: RegionData;
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
  // Optional metadata commonly present in branch tables
  isActive?: boolean | null;
  notes?: string[] | null;
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
 * Project information
 */
export interface ProjectData {
  id: string;
  name: string;
  meta: any | null; // JSON field
  gameId: string;
  baseRomId: string;
  createdAt: string;
  updatedAt: string;
  //baseRom: BaseRomData | null;
}

/**
 * Project branch with complete relationship chain
 */
export interface ProjectBranchData {
  id: string;
  name: string | null;
  version: number | null;
  projectId: string;
  baseRomBranchId: string;
  fileCrcs: number[];
  modules: any[]; // JSON array
  // Optional metadata commonly present in branch tables
  isActive?: boolean | null;
  notes?: string[] | null;
  project: ProjectData;
  baseRomBranch: BaseRomBranchData;
  createdAt: string;
  updatedAt: string;
}

/**
 * Project file containing binary data
 */
export interface ProjectFileData {
  id: string;
  name: string;
  type: string;
  module: string | null;
  version: number | null;
  crc: number | null;
  meta: any | null; // JSON field
  projectId: string;
  data: Uint8Array; // Converted from base64
  createdAt: string;
  updatedAt: string;
}

/**
 * Raw ProjectFile data as returned from Supabase (before conversion)
 */
export interface ProjectFileRaw {
  id: string;
  name: string;
  type: string;
  module: string | null;
  version: number | null;
  crc: number | null;
  meta: any | null;
  projectId: string;
  data: string; // Base64 encoded
  createdAt: string;
  updatedAt: string;
}

/**
 * Complete Project payload containing branch data and files
 */
export interface ProjectPayload {
  projectBranch: ProjectBranchData;
  projectFiles: ProjectFileData[];
  baseRomBranch: BaseRomBranchData;
  baseRomFiles: BaseRomFileData[];
}

/**
 * Options for loading Project data by name
 */
export interface FromSupabaseByProjectOptions {
  projectName: string;
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
 * Query statistics for performance monitoring
 */
export interface QueryStats {
  branchQueryTime: number;
  fileQueryTime: number;
  totalTime: number;
  fileCount: number;
  totalDataSize: number;
}
