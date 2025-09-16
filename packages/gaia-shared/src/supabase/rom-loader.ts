/**
 * ROM data loading functions for Supabase integration
 * 
 * This module provides functions to load ROM branch data and files from Supabase,
 * enabling cloud-based ROM database functionality for the GaiaLabs platform.
 */

import { getSupabaseClient } from './client';
import { decodeDataString, getEnvVar } from './utils';
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
  SupabaseFromError,
  SupabaseErrorCode,
  QueryStats,
  GameRomBranchData,
  ProjectData
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
        isActive,
        notes,
        baseRomId,
        gameRomBranchId,
        fileCrcs,
        createdAt,
        updatedAt,
        gameRomBranch:GameRomBranch!inner(
          id,
          name,
          version,
          isActive,
          notes,
          gameRomId,
          platformBranchId,
          config,
          files,
          blocks,
          fixups,
          types,
          createdAt,
          updatedAt,
          platformBranch:PlatformBranch!inner(
            id,
            name,
            version,
            isActive,
            notes,
            platformId,
            addressingModes,
            instructionSet,
            vectors,
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
  options: FromSupabaseByNameOptions
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
        isActive,
        notes,
        baseRomId,
        gameRomBranchId,
        fileCrcs,
        createdAt,
        updatedAt,
        gameRomBranch:GameRomBranch!inner(
          id,
          name,
          version,
          isActive,
          notes,
          gameRomId,
          platformBranchId,
          config,
          coplib,
          files,
          blocks,
          fixups,
          types,
          createdAt,
          updatedAt,
          platformBranch:PlatformBranch!inner(
            id,
            name,
            version,
            isActive,
            notes,
            platformId,
            addressingModes,
            instructionSet,
            vectors,
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
export async function fromSupabaseByProject(projectName?: string, branchId?: string): Promise<ProjectPayload> {
  const startTime = performance.now();
  let branchQueryTime = 0;
  let fileQueryTime = 0;
  
  //Use default project name if not provided
  if(!projectName && !branchId){
    projectName = getEnvVar('PROJECT_NAME');
  }

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
        isActive,
        notes,
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
          isActive,
          notes,
          baseRomId,
          gameRomBranchId,
          fileCrcs,
          createdAt,
          updatedAt,
          baseRom:BaseRom!inner(
            id,
            name,
            gameId,
            gameRomId,
            createdAt,
            updatedAt
          ),
          gameRomBranch:GameRomBranch!inner(
            id,
            name,
            version,
            isActive,
            notes,
            gameRomId,
            platformBranchId,
            config,
            coplib,
            files,
            blocks,
            fixups,
            types,
            createdAt,
            updatedAt,
            gameRom:GameRom!inner(
              id,
              crc,
              gameId,
              regionId,
              createdAt,
              updatedAt,
              game:Game!inner(
                id,
                name,
                createdAt,
                updatedAt
              ),
              region:Region!inner(
                id,
                name,
                meta,
                platformId,
                createdAt,
                updatedAt
              )
            ),
            platformBranch:PlatformBranch!inner(
              id,
              name,
              version,
              isActive,
              notes,
              platformId,
              addressingModes,
              instructionSet,
              vectors,
              createdAt,
              updatedAt,
              platform:Platform!inner(
                id,
                name,
                meta,
                createdAt,
                updatedAt
              )
            )
          )
        )
      `);
    

    // Filter by Project name
    if(projectName) query = query.eq('project.name', projectName);

    // Make sure we use the selected or current active branch
    if(branchId) query = query.eq('id', branchId);
    else query = query.eq('isActive', true);
    
    // Execute query - get single result
    const { data: branchData, error: branchError } = await query.single();
    
    branchQueryTime = performance.now() - branchStart;
    
    if (branchError || !branchData) {
      throw new SupabaseFromError(
        `ProjectBranch not found for criteria: projectName="${projectName}"`,
        SupabaseErrorCode.BRANCH_NOT_FOUND,
        { projectName, error: branchError }
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
      { projectName, error }
    );
  }
}

export async function fromSupabaseByGameRom(gameName?: string, regionName?: string, platformName?: string, branchId?: string): Promise<ProjectPayload> {
  const startTime = performance.now();
  let branchQueryTime = 0;
  let fileQueryTime = 0;
  
  //Use default project name if not provided
  if(!branchId && !gameName && !regionName && !platformName) { 
    gameName = getEnvVar('GAME_NAME');
    regionName = getEnvVar('REGION_NAME');
    platformName = getEnvVar('PLATFORM_NAME');
  }

  try {
    const client = getSupabaseClient();
    
    // Step 1: Build query with filters
    const branchStart = performance.now();
    
    let query = client
      .from('GameRomBranch')
      .select(`
        id,
        name,
        version,
        isActive,
        notes,
        gameRomId,
        platformBranchId,
        coplib,
        config,
        files,
        blocks,
        fixups,
        types,
        createdAt,
        updatedAt,
        gameRom:GameRom!inner(
          id,
          crc,
          meta,
          gameId,
          regionId,
          createdAt,
          updatedAt,
          game:Game!inner(
            id,
            name,
            createdAt,
            updatedAt
          ),
          region:Region!inner(
            id,
            name,
            meta,
            platformId,
            createdAt,
            updatedAt
          )
        ),
        platformBranch:PlatformBranch!inner(
          id,
          name,
          version,
          isActive,
          platformId,
          addressingModes,
          instructionSet,
          vectors,
          createdAt,
          updatedAt,
          platform:Platform!inner(
            id,
            name,
            meta,
            createdAt,
            updatedAt
          )
        )
      `);
    

    // Filter by Project name
    if(gameName) query = query.eq('gameRom.game.name', gameName);
    if(regionName) query = query.eq('gameRom.region.name', regionName);
    if(platformName) query = query.eq('platformBranch.platform.name', platformName);

    // Make sure we use the selected or current active branch
    if(branchId) query = query.eq('id', branchId);
    else query = query.eq('isActive', true);
    
    // Execute query - get single result
    const { data: branchData, error: branchError } = await query.single();
    
    branchQueryTime = performance.now() - branchStart;
    
    if (branchError || !branchData) {
      throw new SupabaseFromError(
        `GameRomBranch not found for criteria: gameName="${gameName}", regionName="${regionName}", platformName="${platformName}"`,
        SupabaseErrorCode.BRANCH_NOT_FOUND,
        { gameName, regionName, platformName, error: branchError }
      );
    }

    const gameRomBranch = branchData as unknown as GameRomBranchData;

    // Construct a minimal BaseRomBranch wrapper so downstream code can consume a unified ProjectPayload
    const baseRomBranch: BaseRomBranchData = {
      id: '',
      name: null,
      version: null,
      baseRomId: '',
      gameRomBranchId: gameRomBranch.id,
      fileCrcs: [],
      gameRomBranch,
      baseRom: {
        id: '',
        name: '',
        gameId: '',
        gameRomId: '',
        createdAt: '',
        updatedAt: ''
      },
      createdAt: '',
      updatedAt: ''
    };

    const project: ProjectData = {
      id: '',
      name: '',
      meta: null,
      gameId: '',
      baseRomId: '',
      createdAt: '',
      updatedAt: '',
    };

    const projectBranch: ProjectBranchData = {
      id: '',
      name: null,
      version: null,
      projectId: '',
      baseRomBranchId: '',
      fileCrcs: [],
      modules: [],
      project,
      baseRomBranch,
      createdAt: '',
      updatedAt: ''
    };

    const payload: ProjectPayload = {
      projectBranch,
      projectFiles: [],
      baseRomBranch,
      baseRomFiles: []
    };

    fileQueryTime = performance.now() - branchStart - branchQueryTime;

    // Log performance statistics
    const totalTime = performance.now() - startTime;
    const stats: QueryStats = {
      branchQueryTime,
      fileQueryTime,
      totalTime,
      fileCount: 0,
      totalDataSize: 0,
    };

    console.log('Game ROM load stats:', stats);

    return payload;
    
  } catch (error) {
    if (error instanceof SupabaseFromError) {
      throw error;
    }
    
    throw new SupabaseFromError(
      `Failed to load GameRomBranch data: ${error instanceof Error ? error.message : 'Unknown error'}`,
      SupabaseErrorCode.NETWORK_ERROR,
      { gameName, regionName, platformName, error }
    );
  }
}

export async function summaryFromSupabaseByProject(projectName?: string): Promise<ProjectBranchData> {
  const startTime = performance.now();
  let branchQueryTime = 0;
  let fileQueryTime = 0;
  
  //Use default project name if not provided
  if(!projectName){
    projectName = getEnvVar('PROJECT_NAME');
  }

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
        isActive,
        notes,
        projectId,
        baseRomBranchId,
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
          isActive,
          notes,
          baseRomId,
          gameRomBranchId,
          createdAt,
          updatedAt,
          baseRom:BaseRom!inner(
            id,
            name,
            gameId,
            gameRomId,
            createdAt,
            updatedAt
          ),
          gameRomBranch:GameRomBranch!inner(
            id,
            name,
            version,
            isActive,
            notes,
            gameRomId,
            platformBranchId,
            createdAt,
            updatedAt,
            gameRom:GameRom!inner(
              id,
              crc,
              gameId,
              regionId,
              createdAt,
              updatedAt,
              game:Game!inner(
                id,
                name,
                createdAt,
                updatedAt
              ),
              region:Region!inner(
                id,
                name,
                meta,
                platformId,
                createdAt,
                updatedAt
              )
            ),
            platformBranch:PlatformBranch!inner(
              id,
              name,
              version,
              isActive,
              notes,
              platformId,
              createdAt,
              updatedAt,
              platform:Platform!inner(
                id,
                name,
                meta,
                createdAt,
                updatedAt
              )
            )
          )
        )
      `);
    
    // Filter by Project name
    query = query.eq('project.name', projectName);
    
    // Make sure we use the current active branch
    query = query.eq('isActive', true);
    
    // Execute query - get single result
    const { data: branchData, error: branchError } = await query.single();
    
    branchQueryTime = performance.now() - branchStart;
    
    if (branchError || !branchData) {
      throw new SupabaseFromError(
        `ProjectBranch not found for criteria: projectName="${projectName}"`,
        SupabaseErrorCode.BRANCH_NOT_FOUND,
        { projectName, error: branchError }
      );
    }

    const projectBranch = branchData as unknown as ProjectBranchData;
   

    fileQueryTime = performance.now() - branchStart - branchQueryTime;
    
    const payload = projectBranch;
    
    // Log performance statistics
    const totalTime = performance.now() - startTime;
    const stats: QueryStats = {
      branchQueryTime,
      fileQueryTime,
      totalTime,
      fileCount: 0,
      totalDataSize: 0,
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
      { projectName, error }
    );
  }
}
