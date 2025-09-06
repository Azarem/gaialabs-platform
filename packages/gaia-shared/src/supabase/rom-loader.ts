/**
 * ROM data loading functions for Supabase integration
 * 
 * This module provides functions to load ROM branch data and files from Supabase,
 * enabling cloud-based ROM database functionality for the GaiaLabs platform.
 */

import { getSupabaseClient } from './client';
import { decodeDataString } from './utils';
import {
  BaseRomPayload,
  BaseRomBranchData,
  BaseRomFileData,
  BaseRomFileRaw,
  FromSupabaseByNameOptions,
  ProjectPayload,
  ProjectBranchData,
  ProjectFileData,
  ProjectFileRaw,
  FromSupabaseByProjectOptions,
  SupabaseFromError,
  SupabaseErrorCode,
  QueryStats,
} from './types';

/**
 * Load ROM data from Supabase using a BaseRomBranch ID
 * 
 * @param baseRomBranchId - The ID of the BaseRomBranch to load
 * @returns Promise<BaseRomPayload> containing the branch data and files
 * @throws {SupabaseFromError} If the branch is not found or other errors occur
 * 
 * @example
 * ```typescript
 * const payload = await fromSupabaseById('clm1234567890');
 * console.log(payload.baseRomBranch.name);
 * console.log(`Loaded ${payload.files.length} files`);
 * ```
 */
export async function fromSupabaseById(baseRomBranchId: string): Promise<BaseRomPayload> {
  const startTime = performance.now();
  let branchQueryTime = 0;
  let fileQueryTime = 0;
  
  try {
    const client = getSupabaseClient();
    
    // Step 1: Get the BaseRomBranch with all related data using joins
    const branchStart = performance.now();
    
    const { data: branchData, error: branchError } = await client
      .from('BaseRomBranch')
      .select(`
        id,
        name,
        version,
        isPublic,
        baseRomId,
        gameRomBranchId,
        fileCrcs,
        createdAt,
        updatedAt,
        gameRomBranch:GameRomBranch!inner(
          id,
          name,
          version,
          gameRomId,
          platformBranchId,
          config,
          files,
          blocks,
          fixups,
          types,
          isPublic,
          createdAt,
          updatedAt,
          platformBranch:PlatformBranch!inner(
            id,
            name,
            version,
            platformId,
            addressingModes,
            instructionSet,
            vectors,
            isPublic,
            createdAt,
            updatedAt
          )
        ),
        baseRom:BaseRom!inner(
          id,
          name,
          gameId,
          gameRomId,
          createdAt,
          updatedAt
        )
      `)
      .eq('id', baseRomBranchId)
      .single();
    
    branchQueryTime = performance.now() - branchStart;
    
    if (branchError || !branchData) {
      throw new SupabaseFromError(
        `BaseRomBranch not found with ID: ${baseRomBranchId}`,
        SupabaseErrorCode.BRANCH_NOT_FOUND,
        { baseRomBranchId, error: branchError }
      );
    }
    
    // Step 2: Load all the BaseRomFile data using the fileCrcs array
    const files = await loadBaseRomFiles(branchData.baseRomId, branchData.fileCrcs);
    
    fileQueryTime = performance.now() - branchStart - branchQueryTime;
    
    const payload: BaseRomPayload = {
      baseRomBranch: branchData as unknown as BaseRomBranchData,
      files,
    };
    
    // Log performance statistics
    const totalTime = performance.now() - startTime;
    const stats: QueryStats = {
      branchQueryTime,
      fileQueryTime,
      totalTime,
      fileCount: files.length,
      totalDataSize: files.reduce((sum, file) => sum + file.data.length, 0),
    };
    
    console.log('ROM load stats:', stats);
    
    return payload;
    
  } catch (error) {
    if (error instanceof SupabaseFromError) {
      throw error;
    }
    
    throw new SupabaseFromError(
      `Failed to load ROM data: ${error instanceof Error ? error.message : 'Unknown error'}`,
      SupabaseErrorCode.NETWORK_ERROR,
      { baseRomBranchId, error }
    );
  }
}

/**
 * Load ROM data from Supabase using name-based lookup
 * 
 * @param options - Options for name-based lookup
 * @returns Promise<BaseRomPayload> containing the branch data and files
 * @throws {SupabaseFromError} If the branch is not found or other errors occur
 * 
 * @example
 * ```typescript
 * // Load default ROM (GaiaLabs BaseROM, main branch)
 * const payload1 = await fromSupabaseByName({});
 * 
 * // Load specific ROM and branch
 * const payload2 = await fromSupabaseByName({
 *   baseRomName: 'My Custom ROM',
 *   branchName: 'development',
 *   branchVersion: null // latest version
 * });
 * 
 * // Load main branch explicitly
 * const payload3 = await fromSupabaseByName({
 *   baseRomName: 'GaiaLabs BaseROM',
 *   branchName: null, // main branch
 *   branchVersion: null // latest version
 * });
 * ```
 */
export async function fromSupabaseByName(
  options: FromSupabaseByNameOptions = {
    gameName: 'Illusion of Gaia',
    baseRomName: 'GaiaLabs BaseROM',
  }
): Promise<BaseRomPayload> {
  const {
    gameName,
    baseRomName,
    branchName,
    branchVersion,
  } = options;
  
  const startTime = performance.now();
  let branchQueryTime = 0;
  let fileQueryTime = 0;
  
  try {
    const client = getSupabaseClient();
    
    // Step 1: Build query with filters
    const branchStart = performance.now();
    
    let query = client
      .from('BaseRomBranch')
      .select(`
        id,
        name,
        version,
        isPublic,
        baseRomId,
        gameRomBranchId,
        fileCrcs,
        createdAt,
        updatedAt,
        gameRomBranch:GameRomBranch!inner(
          id,
          name,
          version,
          gameRomId,
          platformBranchId,
          config,
          coplib,
          files,
          blocks,
          fixups,
          types,
          isPublic,
          createdAt,
          updatedAt,
          platformBranch:PlatformBranch!inner(
            id,
            name,
            version,
            platformId,
            addressingModes,
            instructionSet,
            vectors,
            isPublic,
            createdAt,
            updatedAt
          )
        ),
        baseRom:BaseRom!inner(
          id,
          name,
          gameId,
          gameRomId,
          createdAt,
          updatedAt,
          game:Game!inner(
            id,
            name,
            createdAt,
            updatedAt
          )
        )
      `);
    
    // Filter by Game name
    query = query.eq('baseRom.game.name', gameName);
    
    // Filter by BaseRom name
    query = query.eq('baseRom.name', baseRomName);
    
    // Filter by branch name if specified
    if (branchName !== undefined) {
      if (branchName === null) {
        query = query.is('name', null);
      } else {
        query = query.eq('name', branchName);
      }
    }
    
    // Filter by branch version if specified
    if (branchVersion !== undefined) {
      if (branchVersion === null) {
        query = query.is('version', null);
      } else {
        query = query.eq('version', branchVersion);
      }
    }
    
    // Execute query - get single result
    const { data: branchData, error: branchError } = await query.single();
    
    branchQueryTime = performance.now() - branchStart;
    
    if (branchError || !branchData) {
      throw new SupabaseFromError(
        `BaseRomBranch not found for criteria: gameName="${gameName}", baseRomName="${baseRomName}", branchName=${branchName}, branchVersion=${branchVersion}`,
        SupabaseErrorCode.BRANCH_NOT_FOUND,
        { options, error: branchError }
      );
    }
    
    // Step 2: Load all the BaseRomFile data using the fileCrcs array
    const files = await loadBaseRomFiles(branchData.baseRomId, branchData.fileCrcs);
    
    fileQueryTime = performance.now() - branchStart - branchQueryTime;
    
    const payload: BaseRomPayload = {
      baseRomBranch: branchData as unknown as BaseRomBranchData,
      files,
    };
    
    // Log performance statistics
    const totalTime = performance.now() - startTime;
    const stats: QueryStats = {
      branchQueryTime,
      fileQueryTime,
      totalTime,
      fileCount: files.length,
      totalDataSize: files.reduce((sum, file) => sum + file.data.length, 0),
    };
    
    console.log('ROM load stats:', stats);
    
    return payload;
    
  } catch (error) {
    if (error instanceof SupabaseFromError) {
      throw error;
    }
    
    throw new SupabaseFromError(
      `Failed to load ROM data: ${error instanceof Error ? error.message : 'Unknown error'}`,
      SupabaseErrorCode.NETWORK_ERROR,
      { options, error }
    );
  }
}

/**
 * Load BaseRomFile data using CRCs with parallel requests
 * 
 * @param baseRomId - The BaseRom ID to filter files
 * @param fileCrcs - Array of CRC values to fetch
 * @returns Promise<BaseRomFileData[]> Array of file data with converted binary content
 * @throws {SupabaseFromError} If files are not found or conversion fails
 */
async function loadBaseRomFiles(
  baseRomId: string, 
  fileCrcs: number[]
): Promise<BaseRomFileData[]> {
  if (!fileCrcs || fileCrcs.length === 0) {
    return [];
  }
  
  try {
    const client = getSupabaseClient();
    
    // Query all files with matching CRCs in one request
    const { data: filesData, error: filesError } = await client
      .from('BaseRomFile')
      .select('id, name, type, version, crc, meta, baseRomId, data, createdAt, updatedAt')
      .eq('baseRomId', baseRomId)
      .in('crc', fileCrcs);
    
    if (filesError) {
      throw new SupabaseFromError(
        `Failed to load BaseRomFiles: ${filesError.message}`,
        SupabaseErrorCode.FILES_NOT_FOUND,
        { baseRomId, fileCrcs, error: filesError }
      );
    }
    
    if (!filesData || filesData.length === 0) {
      throw new SupabaseFromError(
        `No BaseRomFiles found for CRCs: ${fileCrcs.join(', ')}`,
        SupabaseErrorCode.FILES_NOT_FOUND,
        { baseRomId, fileCrcs }
      );
    }
    
    // Convert data to Uint8Array for each file (handles both hex and base64 formats)
    const convertedFiles: BaseRomFileData[] = filesData.map((file: BaseRomFileRaw) => {
      try {
        const binaryData = decodeDataString(file.data);

        return {
          ...file,
          data: binaryData,
        } as BaseRomFileData;
      } catch (error) {
        throw new SupabaseFromError(
          `Failed to convert data for file ${file.name}: ${error instanceof Error ? error.message : 'Unknown error'}`,
          SupabaseErrorCode.INVALID_DATA,
          { file, error }
        );
      }
    });
    
    // Validate that we got all requested files
    const foundCrcs = new Set(filesData.map(f => f.crc).filter(Boolean));
    const requestedCrcs = new Set(fileCrcs);
    const missingCrcs = [...requestedCrcs].filter(crc => !foundCrcs.has(crc));
    
    if (missingCrcs.length > 0) {
      console.warn(`Some files were not found with CRCs: ${missingCrcs.join(', ')}`);
    }
    
    return convertedFiles;
    
  } catch (error) {
    if (error instanceof SupabaseFromError) {
      throw error;
    }
    
    throw new SupabaseFromError(
      `Failed to load and convert BaseRomFiles: ${error instanceof Error ? error.message : 'Unknown error'}`,
      SupabaseErrorCode.NETWORK_ERROR,
      { baseRomId, fileCrcs, error }
    );
  }
}

/**
 * Load ProjectFile data using CRCs with parallel requests
 * 
 * @param projectId - The Project ID to filter files
 * @param fileCrcs - Array of CRC values to fetch
 * @returns Promise<ProjectFileData[]> Array of file data with converted binary content
 * @throws {SupabaseFromError} If files are not found or conversion fails
 */
async function loadProjectFiles(
  projectId: string, 
  fileCrcs: number[]
): Promise<ProjectFileData[]> {
  if (!fileCrcs || fileCrcs.length === 0) {
    return [];
  }
  
  try {
    const client = getSupabaseClient();
    
    // Query all files with matching CRCs in one request
    const { data: filesData, error: filesError } = await client
      .from('ProjectFile')
      .select('id, name, type, module, version, crc, meta, projectId, data, createdAt, updatedAt')
      .eq('projectId', projectId)
      .in('crc', fileCrcs);
    
    if (filesError) {
      throw new SupabaseFromError(
        `Failed to load ProjectFiles: ${filesError.message}`,
        SupabaseErrorCode.FILES_NOT_FOUND,
        { projectId, fileCrcs, error: filesError }
      );
    }
    
    if (!filesData || filesData.length === 0) {
      throw new SupabaseFromError(
        `No ProjectFiles found for CRCs: ${fileCrcs.join(', ')}`,
        SupabaseErrorCode.FILES_NOT_FOUND,
        { projectId, fileCrcs }
      );
    }
    
    // Convert data to Uint8Array for each file (handles both hex and base64 formats)
    const convertedFiles: ProjectFileData[] = filesData.map((file: ProjectFileRaw) => {
      try {
        const binaryData = decodeDataString(file.data);

        return {
          ...file,
          data: binaryData,
        } as ProjectFileData;
      } catch (error) {
        throw new SupabaseFromError(
          `Failed to convert data for file ${file.name}: ${error instanceof Error ? error.message : 'Unknown error'}`,
          SupabaseErrorCode.INVALID_DATA,
          { file, error }
        );
      }
    });
    
    // Validate that we got all requested files
    const foundCrcs = new Set(filesData.map(f => f.crc).filter(Boolean));
    const requestedCrcs = new Set(fileCrcs);
    const missingCrcs = [...requestedCrcs].filter(crc => !foundCrcs.has(crc));
    
    if (missingCrcs.length > 0) {
      console.warn(`Some files were not found with CRCs: ${missingCrcs.join(', ')}`);
    }
    
    return convertedFiles;
    
  } catch (error) {
    if (error instanceof SupabaseFromError) {
      throw error;
    }
    
    throw new SupabaseFromError(
      `Failed to load and convert ProjectFiles: ${error instanceof Error ? error.message : 'Unknown error'}`,
      SupabaseErrorCode.NETWORK_ERROR,
      { projectId, fileCrcs, error }
    );
  }
}

/**
 * Load Project data from Supabase using project name-based lookup
 * 
 * @param projectName - The name of the project to load
 * @param options - Options for branch filtering
 * @returns Promise<ProjectPayload> containing the project branch data and files
 * @throws {SupabaseFromError} If the project branch is not found or other errors occur
 * 
 * @example
 * ```typescript
 * // Load default project branch (main/latest)
 * const payload1 = await fromSupabaseByProject('My Game Project');
 * 
 * // Load specific branch
 * const payload2 = await fromSupabaseByProject('My Game Project', {
 *   branchName: 'development',
 *   branchVersion: null // latest version
 * });
 * 
 * // Load main branch explicitly
 * const payload3 = await fromSupabaseByProject('My Game Project', {
 *   branchName: null, // main branch
 *   branchVersion: null // latest version
 * });
 * ```
 */
export async function fromSupabaseByProject(
  options: FromSupabaseByProjectOptions
): Promise<ProjectPayload> {
  const {
    branchName,
    branchVersion,
  } = options;
  
  const startTime = performance.now();
  let branchQueryTime = 0;
  let fileQueryTime = 0;
  
  try {
    const client = getSupabaseClient();
    
    // Step 1: Build query with filters
    const branchStart = performance.now();
    
    let query = client
      .from('ProjectBranch')
      .select(`
        id,
        name,
        version,
        isPublic,
        projectId,
        baseRomBranchId,
        fileCrcs,
        modules,
        createdAt,
        updatedAt,
        project:Project!inner(
          id,
          name,
          meta,
          gameId,
          baseRomId,
          createdAt,
          updatedAt
        ),
        baseRomBranch:BaseRomBranch!inner(
          id,
          name,
          version,
          isPublic,
          baseRomId,
          gameRomBranchId,
          fileCrcs,
          createdAt,
          updatedAt,
          gameRomBranch:GameRomBranch!inner(
            id,
            name,
            version,
            gameRomId,
            platformBranchId,
            config,
            coplib,
            files,
            blocks,
            fixups,
            types,
            isPublic,
            createdAt,
            updatedAt,
            platformBranch:PlatformBranch!inner(
              id,
              name,
              version,
              platformId,
              addressingModes,
              instructionSet,
              vectors,
              isPublic,
              createdAt,
              updatedAt
            )
          ),
          baseRom:BaseRom!inner(
            id,
            name,
            gameId,
            gameRomId,
            createdAt,
            updatedAt,
            game:Game!inner(
              id,
              name,
              createdAt,
              updatedAt
            )
          )
        )
      `);
    
    // Filter by Project name
    query = query.eq('project.name', options.projectName);
    
    // Filter by branch name if specified
    if (branchName !== undefined) {
      if (branchName === null) {
        query = query.is('name', null);
      } else {
        query = query.eq('name', branchName);
      }
    }
    
    // Filter by branch version if specified
    if (branchVersion !== undefined) {
      if (branchVersion === null) {
        query = query.is('version', null);
      } else {
        query = query.eq('version', branchVersion);
      }
    }
    
    // Execute query - get single result
    const { data: branchData, error: branchError } = await query.single();
    
    branchQueryTime = performance.now() - branchStart;
    
    if (branchError || !branchData) {
      throw new SupabaseFromError(
        `ProjectBranch not found for criteria: projectName="${options.projectName}", branchName=${branchName}, branchVersion=${branchVersion}`,
        SupabaseErrorCode.BRANCH_NOT_FOUND,
        { options, error: branchError }
      );
    }

    const baseRomBranch = branchData.baseRomBranch as unknown as BaseRomBranchData;
    
    // Step 2: Load all the ProjectFile data using the fileCrcs array
    const projectFiles = await loadProjectFiles(branchData.projectId, branchData.fileCrcs);
  
    const baseRomFiles = await loadBaseRomFiles(baseRomBranch.baseRomId, baseRomBranch.fileCrcs);
    

    fileQueryTime = performance.now() - branchStart - branchQueryTime;
    
    const payload: ProjectPayload = {
      projectBranch: branchData as unknown as ProjectBranchData,
      projectFiles,
      baseRomBranch,
      baseRomFiles
    };
    
    // Log performance statistics
    const totalTime = performance.now() - startTime;
    const stats: QueryStats = {
      branchQueryTime,
      fileQueryTime,
      totalTime,
      fileCount: projectFiles.length,
      totalDataSize: projectFiles.reduce((sum, file) => sum + file.data.length, 0),
    };
    
    console.log('Project ROM load stats:', stats);
    
    return payload;
    
  } catch (error) {
    if (error instanceof SupabaseFromError) {
      throw error;
    }
    
    throw new SupabaseFromError(
      `Failed to load Project data: ${error instanceof Error ? error.message : 'Unknown error'}`,
      SupabaseErrorCode.NETWORK_ERROR,
      { options, error }
    );
  }
}
