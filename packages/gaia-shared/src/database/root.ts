import { BinType } from '../types/resources';
import { readJsonFile } from '../utils';
import type { ICompressionProvider } from '../types/compression';
import { CompressionRegistry } from '../types/compression-registry';
import { DataProcessor, StringTypeMapper } from './mappers';
import type { DbBlock } from './blocks';
import type { DbConfig } from './config';
import type { DbEntryPoint } from './entrypoints';
import type { DbFile } from './files';
import type { DbLabel } from './labels';
import type { DbMnemonic } from './mnemonics';
import type { DbOverride } from './overrides';
import type { DbPart } from './parts';
import type { DbPath } from './paths';
import type { DbRewrite } from './rewrites';
import type { DbStruct } from './structs';
import type { DbStringType, DbStringCommand, DbStringLayer } from './strings';
import type { CopDef } from './cop';
import type { DbTransform } from './transforms';
import { createClient } from '@supabase/supabase-js';

/**
 * Main database root class
 * Converted from GaiaLib/Database/DbRoot.cs
 */
export interface DbRoot {
  copDef: Record<number, CopDef>;
  copLookup: Record<string, CopDef>;
  mnemonics: Record<number, string>;
  paths: Record<BinType, DbPath>;
  structs: Record<string, DbStruct>;
  stringTypes: Record<string, DbStringType>;
  stringDelimiters: string[];
  stringCharLookup: Record<string, DbStringType>;
  files: DbFile[];
  config: DbConfig;
  blocks: DbBlock[];
  overrides: Record<number, DbOverride>;
  labels: Record<number, string>;
  rewrites: Record<number, number>;
  entryPoints: DbEntryPoint[];
  opCodes: Record<number, any>; // OpCode type (from gaia-core/assembly)
  opLookup: Record<string, any[]>; // OpCode[] type (from gaia-core/assembly)
  addrModes: any[]; // AddressingMode type (from database)
  addrLookup: Record<string, any>; // AddressingMode lookup by name
  compression: ICompressionProvider;
}

/**
 * Database root utilities
 */
export class DbRootUtils {
  /**
   * JSON serialization options
   */
  public static readonly JSON_OPTIONS = {
    propertyNamingPolicy: 'camelCase',
    readCommentHandling: 'skip',
    writeIndented: true
  };

  /**
   * Load database from a single file
   */
  public static async fromFile(dbFilePath: string): Promise<DbRoot> {
    return await readJsonFile<DbRoot>(dbFilePath);
  }

  /**
   * Load database from folder structure
   */
  public static async fromFolder(folderPath: string, systemPath: string): Promise<DbRoot> {
    // Load all the JSON files
    const [
      mnemonics,
      overrides,
      rewrites,
      blocks,
      parts,
      files,
      config,
      labels,
      structs,
      copdef,
      opCodes,
      stringTypes,
      stringCommands,
      stringLayers,
      transforms
    ] = await Promise.all([
      this.readTable<DbMnemonic[]>(`${folderPath}/mnemonics_old.json`),
      this.readTable<DbOverride[]>(`${folderPath}/overrides.json`),
      this.readTable<DbRewrite[]>(`${folderPath}/rewrites.json`),
      this.readTable<DbBlock[]>(`${folderPath}/blocks.json`),
      this.readTable<DbPart[]>(`${folderPath}/parts.json`),
      this.readTable<DbFile[]>(`${folderPath}/files.json`),
      this.readTable<DbConfig[]>(`${folderPath}/config.json`),
      this.readTable<DbLabel[]>(`${folderPath}/labels.json`),
      this.readTable<DbStruct[]>(`${folderPath}/structs.json`),
      this.readTable<CopDef[]>(`${folderPath}/copdef.json`),
      this.readTable<any[]>(`${systemPath}/opCodes.json`), // OpCode type (from gaia-core/assembly)
      this.readTable<DbStringType[]>(`${folderPath}/stringTypes.json`),
      this.readTable<DbStringCommand[]>(`${folderPath}/stringCommands.json`),
      this.readTable<DbStringLayer[]>(`${folderPath}/stringLayers.json`),
      this.readTable<DbTransform[]>(`${folderPath}/transforms.json`)
    ]);

    // Process blocks and parts
    for (const block of blocks) {
      block.parts = parts.filter(p => p.block === block.name);
      block.transforms = transforms.find(t => t.block === block.name)?.transforms;
      for (const part of block.parts) {
        (part as any)._block = block;
      }
    }

    const cfg = config[0];

    // Process string types
    for (const strType of stringTypes) {
      strType.commands = stringCommands
        .filter(x => x.set === strType.name)
        .reduce((acc, x) => {
          acc[x.key] = x;
          return acc;
        }, {} as Record<number, any>);
      strType.layers = stringLayers.filter(x => x.type === strType.name);
    }

    const compression = CompressionRegistry.get(cfg.compression || 'QuintetLZ');

    // Build the database root
    const root: DbRoot = {
      mnemonics: mnemonics.reduce((acc, x) => {
        acc[x.key] = x.value;
        return acc;
      }, {} as Record<number, string>),
      overrides: overrides.reduce((acc, x) => {
        acc[x.location] = x;
        return acc;
      }, {} as Record<number, DbOverride>),
      rewrites: rewrites.reduce((acc, x) => {
        acc[x.location] = x.value;
        return acc;
      }, {} as Record<number, number>),
      labels: labels.reduce((acc, x) => {
        acc[x.location] = x.label;
        return acc;
      }, {} as Record<number, string>),
      structs: structs.reduce((acc, x) => {
        acc[x.name] = x;
        return acc;
      }, {} as Record<string, DbStruct>),
      blocks,
      files,
      copDef: copdef.reduce((acc, x) => {
        acc[x.code] = x;
        return acc;
      }, {} as Record<number, CopDef>),
      copLookup: copdef.reduce((acc, x) => {
        acc[x.mnem] = x;
        return acc;
      }, {} as Record<string, CopDef>),
      config: cfg,
      opCodes: opCodes.reduce((acc, x) => {
        acc[x.code] = x;
        return acc;
      }, {} as Record<number, any>),
      opLookup: opCodes.reduce((acc, x) => {
        if (!acc[x.mnem]) acc[x.mnem] = [];
        acc[x.mnem].push(x);
        return acc;
      }, {} as Record<string, any[]>),
      addrModes: [], // Not available in file-based loading
      addrLookup: {}, // Not available in file-based loading
      entryPoints: cfg.entryPoints,
      paths: cfg.paths,
      stringTypes: stringTypes.reduce((acc, x) => {
        acc[x.name] = x;
        return acc;
      }, {} as Record<string, DbStringType>),
      stringDelimiters: stringTypes.map(x => x.delimiter),
      stringCharLookup: stringTypes.reduce((acc, x) => {
        acc[x.delimiter] = x;
        return acc;
      }, {} as Record<string, DbStringType>),
      compression
    };

    return root;
  }

  /**
   * Load database from Supabase
   * 
   * Queries the Supabase database to load all necessary tables and build a DbRoot object.
   * Uses VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY environment variables for connection.
   * Queries for "Illusion of Gaia" (SNES) game data specifically.
   * 
   * @param gameName Game title to query (defaults to "Illusion of Gaia")
   * @param platform Game platform (defaults to "SNES")
   * @param systemPath Optional path to load additional data from local files (fallback for opCodes)
   * @returns Promise<DbRoot> The loaded database root object
   * 
   * @example
   * ```typescript
   * // Make sure environment variables are set:
   * // VITE_SUPABASE_URL=https://your-project.supabase.co
   * // VITE_SUPABASE_ANON_KEY=your-anon-key
   * 
   * const dbRoot = await DbRootUtils.fromSupabase();
   * console.log('Loaded database with', dbRoot.files.length, 'files');
   * ```
   */
  public static async fromSupabase(
    gameName: string = 'Illusion of Gaia', 
    platform: string = 'SNES'
  ): Promise<DbRoot> {
    // Get environment variables
    const supabaseUrl = process.env.VITE_SUPABASE_URL;
    const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;

    if (!supabaseUrl || !supabaseKey) {
      throw new Error('VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY environment variables are required');
    }

    // Create Supabase client
    const supabase = createClient(supabaseUrl, supabaseKey);

    // First, find the game by title and platform
    const gameResponse = await supabase
      .from('Game')
      .select('*')
      .eq('title', gameName)
      .eq('platform', platform)
      .single();

    if (gameResponse.error || !gameResponse.data) {
      throw new Error(`Game "${gameName}" (${platform}) not found: ${gameResponse.error?.message || 'No data returned'}`);
    }

    const game = gameResponse.data;
    const gameId = game.id;

    // Query all game-specific, instruction set, and string processing data in parallel
    const [
      mnemonicsResponse,
      blocksResponse,
      partsResponse,
      filesResponse,
      copdefResponse,
      structsResponse,
      releasesResponse,
      instructionSetResponse,
      addressingModesResponse,
      stringTypesResponse
    ] = await Promise.all([
      supabase.from('GameMnemonic').select('*').eq('gameId', gameId),
      supabase.from('GameBlock').select('*').eq('gameId', gameId),
      supabase.from('GamePart').select('*, block:GameBlock!inner(gameId)').eq('block.gameId', gameId),
      supabase.from('GameFile').select('*').eq('gameId', gameId),
      supabase.from('GameCop').select('*').eq('gameId', gameId),
      supabase.from('GameStruct').select('*').eq('gameId', gameId),
      supabase.from('Release').select(`
        *,
        files:ReleaseFile(*,gameFile:GameFile(*)),
        blocks:ReleaseBlock(*,gameBlock:GameBlock(*)),
        parts:ReleasePart(*,gamePart:GamePart(*)),
        overrides:ReleaseOverride(*),
        rewrites:ReleaseRewrite(*),
        transforms:ReleaseTransform(*,releaseBlock:ReleaseBlock(*,gameBlock:GameBlock(name))),
        labels:ReleaseLabel(*),
        structs:ReleaseStruct(*,gameStruct:GameStruct(*))
      `).eq('gameId', gameId),
      supabase.from('InstructionSet').select(`
        *,
        instructionGroups:InstructionGroup(
          *,
          instructions:Instruction(
            *,
            variants:InstructionVariant(
              *,
              addressingMode:AddressingMode(name)
            )
          )
        )
      `).eq('name', '65c816-instruction-set-complete').single(),
      supabase.from('AddressingMode').select('*'),
      supabase.from('GameString')
        .select(`
          *,
          commands:GameStringCommand(*),
          releaseStrings:ReleaseString(
            *,
            commands:ReleaseStringCommand(*),
            layers:ReleaseStringLayer(*)
          )
        `)
        .eq('gameId', gameId)
    ]);

    // Check for errors
    const responses = [
      { name: 'mnemonics', response: mnemonicsResponse },
      { name: 'blocks', response: blocksResponse },
      { name: 'parts', response: partsResponse },
      { name: 'files', response: filesResponse },
      { name: 'copdef', response: copdefResponse },
      { name: 'structs', response: structsResponse },
      { name: 'releases', response: releasesResponse },
      { name: 'instructionSet', response: instructionSetResponse },
      { name: 'addressingModes', response: addressingModesResponse },
      { name: 'gameStrings', response: stringTypesResponse }
    ];

    for (const { name, response } of responses) {
      if (response.error && name !== 'instructionSet') { // InstructionSet might not exist
        throw new Error(`Failed to fetch ${name}: ${response.error.message}`);
      }
    }

    // Extract data from responses
    const mnemonics = mnemonicsResponse.data || [];
    const gameBlocks = blocksResponse.data || [];
    const gameParts = partsResponse.data || [];
    const gameFiles = filesResponse.data || [];
    const copdef = copdefResponse.data || [];
    const gameStructs = structsResponse.data || [];
    const releases = releasesResponse.data || [];
    const instructionSetData = instructionSetResponse.data;
    const addressingModes = addressingModesResponse.data || [];
    const gameStringsData = stringTypesResponse.data || [];

    // Build addressing mode lookup tables
    const addrLookup: Record<string, any> = {};
    for (const mode of addressingModes) {
      addrLookup[mode.name] = mode;
    }

    // Build opCodes from instruction set data
    let opCodes: Record<number, any> = {};
    if (instructionSetData?.instructionGroups) {
      console.log('Building opCodes from instruction set data...');
      console.log('InstructionSet found:', instructionSetData.name);
      console.log('Instruction groups:', instructionSetData.instructionGroups?.length || 0);
      opCodes = this.buildOpCodesFromInstructionSet(instructionSetData, addrLookup);
      console.log(`Built ${Object.keys(opCodes).length} opCodes`);
    } else {
      console.log('No instruction set data found:', instructionSetData);
    }

    // Process blocks and parts with coalesce logic using new mappers
    const processedData = DataProcessor.processWithCoalesce(
      { blocks: gameBlocks, parts: gameParts, files: gameFiles, structs: gameStructs },
      releases
    );

    // Extract processed data
    const { blocks, files, parts, structs, overrides, rewrites, labels } = processedData;

    // Process string types with GameString/ReleaseString coalesce logic using new mappers
    const stringTypes: DbStringType[] = DataProcessor.processStringTypes(gameStringsData);

    // Build config from game data
    const cfg: DbConfig = {
      compression: (game.meta as any)?.compression || 'QuintetLZ',
      entryPoints: (game.meta as any)?.entryPoints || [],
      paths: (game.meta as any)?.paths || {},
      sfxLocation: (game.meta as any)?.sfxLocation || 0,
      sfxCount: (game.meta as any)?.sfxCount || 0,
      accentMap: (game.meta as any)?.accentMap || [],
      //asmFormats: (game.meta as any)?.asmFormats || {}
    };

    // String types are now fully processed by the DataProcessor.processStringTypes method

    const compression = CompressionRegistry.get(cfg.compression || 'QuintetLZ');

    // Build the database root with processed data
    const root: DbRoot = {
      mnemonics: mnemonics.reduce((acc, x) => {
        acc[x.key] = x.value;
        return acc;
      }, {} as Record<number, string>),
      overrides,
      rewrites,
      labels,
      structs: structs.reduce((acc, x) => {
        acc[x.name] = x;
        return acc;
      }, {} as Record<string, DbStruct>),
      blocks,
      files,
      copDef: copdef.reduce((acc, x) => {
        acc[x.code] = x;
        return acc;
      }, {} as Record<number, CopDef>),
      copLookup: copdef.reduce((acc, x) => {
        acc[x.mnem] = x;
        return acc;
      }, {} as Record<string, CopDef>),
      config: cfg,
      opCodes: opCodes,
      opLookup: Object.values(opCodes).reduce((acc, x) => {
        if (!acc[x.mnem]) acc[x.mnem] = [];
        acc[x.mnem].push(x);
        return acc;
      }, {} as Record<string, any[]>),
      addrModes: addressingModes,
      addrLookup: addrLookup,
      entryPoints: cfg.entryPoints || [],
      paths: cfg.paths || {},
      stringTypes: stringTypes.reduce((acc, x) => {
        acc[x.name] = x;
        return acc;
      }, {} as Record<string, DbStringType>),
      stringDelimiters: stringTypes.map(x => x.delimiter),
      stringCharLookup: stringTypes.reduce((acc, x) => {
        acc[x.delimiter] = x;
        return acc;
      }, {} as Record<string, DbStringType>),
      compression
    };

    return root;
  }

  /**
   * Build opCodes record from instruction set data - indexed by opcode value
   */
  private static buildOpCodesFromInstructionSet(instructionSetData: any, addrLookup: Record<string, any>): Record<number, any> {
    const opCodes: Record<number, any> = {};
    
    console.log('Processing instruction groups:', instructionSetData.instructionGroups?.length);
    for (const group of instructionSetData.instructionGroups || []) {
      console.log(`Processing group: ${group.name}, instructions: ${group.instructions?.length || 0}`);
      for (const instruction of group.instructions || []) {
        console.log(`Processing instruction: ${instruction.mnemonic}, variants: ${instruction.variants?.length || 0}`);
        for (const variant of instruction.variants || []) {
          console.log(`Adding opcode: ${variant.opcode} (0x${variant.opcode.toString(16)}) - ${instruction.mnemonic}`);
          opCodes[variant.opcode] = {
            code: variant.opcode,
            mnem: instruction.mnemonic,
            description: instruction.description,
            size: variant.size,
            cycleTiming: variant.cycleTiming,
            mode: variant.addressingMode?.name || 'Unknown',
            affectedFlags: instruction.affectedFlags
          };
        }
      }
    }
    
    console.log(`Final opCodes count: ${Object.keys(opCodes).length}`);
    return opCodes;
  }



  /**
   * Read a JSON table file
   */
  private static async readTable<T>(path: string): Promise<T> {
    return await readJsonFile<T>(path);
  }

  /**
   * Get path configuration for a resource type
   */
  public static getPath(root: DbRoot, type: BinType): DbPath {
    return root.paths[type] || root.paths[BinType.Unknown];
  }

  /**
   * Get resource path for a file
   */
  public static getResource(root: DbRoot, baseDir: string, name: string, type: BinType): string {
    const res = this.getPath(root, type);
    return `${baseDir}/${res.folder}/${name}.${res.extension}`;
  }
} 