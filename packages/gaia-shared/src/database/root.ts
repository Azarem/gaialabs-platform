import { BinType } from '../types/resources';
import { readJsonFile, binaryToUtf8String } from '../utils';
import type { ICompressionProvider } from '../types/compression';
import { CompressionRegistry } from '../types/compression-registry';
import type { DbBlock } from './blocks';
import type { DbConfig } from './config';
import type { DbEntryPoint } from './entrypoints';
import type { DbFile } from './files';
import type { DbLabel } from './labels';
import type { DbMnemonic } from './mnemonics';
import type { DbOverride } from './overrides';
import type { DbPart } from './parts';
import type { DbRewrite } from './rewrites';
import type { DbStruct } from './structs';
import type { DbStringType, DbStringCommand, DbStringLayer } from './strings';
import type { CopDef } from './cop';
import type { DbTransform } from './transforms';
import type { BaseRomFileData, BaseRomPayload, FromSupabaseByNameOptions } from '../supabase/types';
import { OpCode } from './opcode';
import { fromSupabaseByName, fromSupabaseById } from '../supabase/rom-loader';
import { RomProcessingConstants } from '../types/constants';
import { ChunkFile } from '../types/files';


/**
 * Main database root class
 * Converted from GaiaLib/Database/DbRoot.cs
 */
export interface DbRoot {
  copDef: Record<number, CopDef>;
  copLookup: Record<string, CopDef>;
  mnemonics: Record<number, string>;
  //paths: Record<BinType, DbPath>;
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
  addrLookup: Record<string, any>; // AddressingMode lookup by name
  compression: ICompressionProvider;
  chunkPatches?: ChunkFile[];
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
      addressingModes,
      stringTypes,
      stringCommands,
      stringLayers,
      transforms
    ] = await Promise.all([
      readJsonFile<DbMnemonic[]>(`${folderPath}/mnemonics_old.json`),
      readJsonFile<DbOverride[]>(`${folderPath}/overrides.json`),
      readJsonFile<DbRewrite[]>(`${folderPath}/rewrites.json`),
      readJsonFile<DbBlock[]>(`${folderPath}/blocks.json`),
      readJsonFile<DbPart[]>(`${folderPath}/parts.json`),
      readJsonFile<DbFile[]>(`${folderPath}/files.json`),
      readJsonFile<DbConfig[]>(`${folderPath}/config.json`),
      readJsonFile<DbLabel[]>(`${folderPath}/labels.json`),
      readJsonFile<DbStruct[]>(`${folderPath}/structs.json`),
      readJsonFile<CopDef[]>(`${folderPath}/copdef.json`),
      readJsonFile<OpCode[]>(`${systemPath}/opCodes.json`), // OpCode type (from gaia-core/assembly)
      readJsonFile<any[]>(`${systemPath}/addressingModes.json`),
      readJsonFile<DbStringType[]>(`${folderPath}/stringTypes.json`),
      readJsonFile<DbStringCommand[]>(`${folderPath}/stringCommands.json`),
      readJsonFile<DbStringLayer[]>(`${folderPath}/stringLayers.json`),
      readJsonFile<DbTransform[]>(`${folderPath}/transforms.json`)
    ]);

    // Process blocks and parts
    for (const block of blocks) {
      block.parts = parts.filter(p => p.block === block.name);
      block.transforms = transforms.find(t => t.block === block.name)?.transforms;
      // for (const part of block.parts) {
      //   (part as any)._block = block;
      // }
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
      addrLookup: addressingModes,
      entryPoints: cfg.entryPoints,
      //paths: cfg.paths,
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

  // /**
  //  * Get path configuration for a resource type
  //  */
  // public static getPath(root: DbRoot, type: BinType): DbPath {
  //   return root.paths[type] || root.paths[BinType.Unknown];
  // }

  // /**
  //  * Get resource path for a file
  //  */
  // public static getResource(root: DbRoot, baseDir: string, name: string, type: BinType): string {
  //   const res = this.getPath(root, type);
  //   return `${baseDir}/${res.folder}/${name}.${res.extension}`;
  // }

  /**
   * Load database from Supabase using BaseRomBranch ID
   * @param baseRomBranchId - The ID of the BaseRomBranch to load
   * @returns Promise<DbRoot> containing the complete database root
   * @throws {Error} If the branch is not found or loading fails
   * 
   * @example
   * ```typescript
   * const dbRoot = await DbRootUtils.fromSupabaseById('clm1234567890');
   * console.log(dbRoot.files.length);
   * ```
   */
  public static async fromSupabaseById(baseRomBranchId: string): Promise<DbRoot> {
    const payload = await fromSupabaseById(baseRomBranchId);
    return this.fromSupabasePayload(payload);
  }

  /**
   * Load database from Supabase using name-based lookup
   * @param options - Options for name-based lookup (optional)
   * @returns Promise<DbRoot> containing the complete database root
   * @throws {Error} If the branch is not found or loading fails
   * 
   * @example
   * ```typescript
   * // Load default ROM (GaiaLabs BaseROM, main branch)
   * const dbRoot1 = await DbRootUtils.fromSupabase({});
   * 
   * // Load specific ROM and branch
   * const dbRoot2 = await DbRootUtils.fromSupabase({
   *   baseRomName: 'My Custom ROM',
   *   branchName: 'development',
   *   branchVersion: null
   * });
   * ```
   */
  public static async fromSupabase(options?: FromSupabaseByNameOptions): Promise<DbRoot> {
    const payload = await fromSupabaseByName(options);
    return this.fromSupabasePayload(payload);
  }

  /**
   * Convert Supabase payload to DbRoot structure
   * @private
   * @param payload - The ROM payload from Supabase
   * @returns DbRoot containing the processed database structure
   */
  private static async fromSupabasePayload(payload: BaseRomPayload): Promise<DbRoot> {
    
    // Extract data from the Supabase payload
    const gameRomBranch = payload.baseRomBranch.gameRomBranch;
    
    const config = gameRomBranch.config;
    const copDef = gameRomBranch.coplib;
    const romFiles = gameRomBranch.files;
    const romBlocks = gameRomBranch.blocks;
    const romTypes = gameRomBranch.types;
    const romFixups = gameRomBranch.fixups;

    const platformBranch = gameRomBranch.platformBranch;
    const instructionSet = platformBranch.instructionSet;
    const addressingModes = platformBranch.addressingModes;
    const vectors = platformBranch.vectors;

    const transforms = romFixups.transforms || [];

    // Build configuration from available data
    const compression = CompressionRegistry.get(config.compression || 'QuintetLZ');
    
    const files: DbFile[] = Object.entries(romFiles).map((x: any) => {
      const file = x[1];
      file.start = file.location;
      file.end = file.location + file.size;
      //file.type = BinType[file.type as keyof typeof BinType] || BinType.Unknown;
      file.name = x[0];
      return file;
    });
    
    const blocks: DbBlock[] = Object.entries(romBlocks).map((x: any) => {
      const block = x[1];
      block.name = x[0];

      const transform = transforms[block.name];
      block.transforms = transform ? Object.entries(transform).map((t: any) => { return { key: t[0], value: t[1] } }) : [];
      
      block.parts = Object.entries(block.parts)
        .sort((a: any, b: any) => {
          const orderA = a[1].order ?? 0;
          const orderB = b[1].order ?? 0;
          if (orderA !== orderB) {
            return orderA - orderB;
          }
          return a[1].location - b[1].location;
        })
        .map((p: any) => {
          const part = p[1];
          part.name = p[0];
          part.start = part.location;
          part.end = part.location + part.size;
          part.struct = part.type;
          return part;
        });

      return block;
    }).sort((a: any, b: any) => a.parts[0].location - b.parts[0].location);
    
    const chunkPatches : ChunkFile[] = payload.files && payload.files.map((file: BaseRomFileData) => {
      const chunkFile = new ChunkFile(
        file.name, 
        file.data.length, 
        0, 
        BinType[file.type as keyof typeof BinType] || BinType.Unknown
      );
      if(chunkFile.type === BinType.Assembly || chunkFile.type === BinType.Patch) {
        chunkFile.textData = binaryToUtf8String(file.data);
      } else {
        chunkFile.rawData = file.data;
        chunkFile.size = file.data.length;
      }
      return chunkFile;
    });

    // Extract other data from the JSON structures
    const mnemonics = romFixups.mnemonics || {};
    const opCodes = this.extractOpCodesFromInstructionSet(instructionSet);
    const overrides = romFixups.overrides || {};
    const rewrites = romFixups.rewrites || {};
    const labels = romFixups.labels || {};
    const structs = romTypes.structs || {};
    //const parts: DbPart[] = Array.isArray(typesJson.parts) ? typesJson.parts : [];
    //const transforms: DbTransform[] = Array.isArray(typesJson.transforms) ? typesJson.transforms : [];
    //const stringTypes = romTypes.strings || {};
    //const stringCommands = romTypes.stringCommands || {};
    //const stringLayers = Array.isArray(romTypes.stringLayers) ? romTypes.stringLayers : [];
    //const copDef = Array.isArray(romTypes.copDef) ? romTypes.copDef : [];
    const entryPoints = Array.isArray(config.entryPoints) ? config.entryPoints : [];
    
    // // Process parts and connect them to blocks
    // for (const block of blocks) {
    //   //block.parts = parts.filter(p => p.block === block.name);
    //   block.transforms = transforms.find((t: any) => t.block === block.name)?.transforms;
    //   // for (const part of block.parts) {
    //   //   (part as any)._block = block;
    //   // }
    // }
    
    // // Process string types
    // for (const strTypeName in stringTypes) {
    //   const strType = stringTypes[strTypeName];
    //   if (strType) {
    //     strType.commands = stringCommands[strTypeName] || {};
    //     strType.layers = stringLayers.filter((x: any) => x.type === strTypeName);
    //   }
    // }

    const stringTypes = Object.entries(romTypes.strings).reduce((acc: any, x: any) => {
      const strType = x[1];
      strType.name = x[0];

      const commands = Object.entries(strType.commands).reduce((acc: any, x: any) => {
        const cmd = x[1];
        acc[cmd.code] = {
          key: cmd.code,
          value: x[0],
          types: cmd.types,
          delimiter: cmd.delimiter,
          halt: cmd.halt
        };
        return acc;
      }, {} as Record<number, any>);
      strType.commands = commands;

      acc[strType.name] = strType;
      return acc;
    }, {} as Record<string, DbStringType>);
    
    // Build lookup tables
    const copLookup = Object.entries(copDef).reduce((acc: any, x: any) => {
      const def = x[1];
      def.mnem = x[0];
      def.size = RomProcessingConstants.getSize(def.parts);
      acc[x[0]] = def;
      return acc;
    }, {} as Record<string, CopDef>);
    
    const copDefLookup = Object.values(copDef).reduce((acc: any, x: any) => {
      acc[x.code] = x;
      return acc;
    }, {} as Record<number, CopDef>);
    
    
    const opLookup = Object.entries(instructionSet).reduce((acc: any, x: any) => {
      acc[x[0]] = Object.entries(x[1]).map((y: any) => new OpCode(y[1], x[0], y[0]));
      return acc;
    }, {});

    const stringDelimiters = Object.values(stringTypes).map((x: any) => x?.delimiter).filter(Boolean);
    const stringCharLookup = Object.values(stringTypes).reduce((acc: any, x: any) => {
      if (x?.delimiter) {
        acc[x.delimiter] = x;
      }
      return acc;
    }, {});
    
    // // Build configuration with defaults
    // const config = {
    //   sfxLocation: typesJson.sfxLocation || 0,
    //   sfxCount: typesJson.sfxCount || 0,
    //   accentMap: typesJson.accentMap || [],
    //   compression: typesJson.compression || 'QuintetLZ',
    //   entryPoints: entryPoints.map((ep: any) => ({
    //     location: ep.location,
    //     name: ep.name
    //   })),
    //   paths: typesJson.paths || {
    //     [BinType.Bitmap]: { folder: 'graphics', extension: 'bin' },
    //     [BinType.Palette]: { folder: 'palettes', extension: 'pal' },
    //     [BinType.Music]: { folder: 'music', extension: 'bgm' },
    //     [BinType.Tileset]: { folder: 'tilesets', extension: 'set' },
    //     [BinType.Tilemap]: { folder: 'tilemaps', extension: 'map' },
    //     [BinType.Spritemap]: { folder: 'spritemaps', extension: 'bin' },
    //     [BinType.Assembly]: { folder: 'asm', extension: 'asm' },
    //     [BinType.Sound]: { folder: 'sfx', extension: 'bin' },
    //     [BinType.Unknown]: { folder: 'misc', extension: 'bin' },
    //     [BinType.Patch]: { folder: 'patches', extension: 'asm' },
    //     [BinType.Transform]: { folder: 'transforms', extension: 'json' }
    //   }
    // };
    
    // Build the complete DbRoot structure
    const root: DbRoot = {
      mnemonics: Object.entries(mnemonics).reduce((acc: any, x: any) => {
        acc[x[1]] = x[0];
        return acc;
      }, {} as Record<number, string>),
      overrides: Array.isArray(overrides) ? overrides.reduce((acc: any, x: any) => {
        acc[x.location] = x;
        return acc;
      }, {}) : overrides,
      rewrites: Array.isArray(rewrites) ? rewrites.reduce((acc: any, x: any) => {
        acc[x.location] = x.value;
        return acc;
      }, {}) : rewrites,
      labels: Array.isArray(labels) ? labels.reduce((acc: any, x: any) => {
        acc[x.location] = x.label;
        return acc;
      }, {}) : labels,
      structs: Object.entries(structs).reduce((acc: any, x: any) => {
        const struct = x[1];
        struct.name = x[0];
        acc[x[0]] = struct;
        return acc;
      }, {} as Record<string, DbStruct>),
      blocks,
      files,
      copDef: copDefLookup as Record<number, CopDef>,
      copLookup,
      chunkPatches,
      config,
      opCodes,
      opLookup,
      addrLookup: addressingModes,
      entryPoints,
      //paths: config.paths,
      stringTypes: stringTypes,
      stringDelimiters,
      stringCharLookup: stringCharLookup as Record<string, DbStringType>,
      compression
    };

    console.log('✅ Successfully transformed Supabase payload to DbRoot');
    console.log(`📁 Files: ${files.length}, 🧱 Blocks: ${blocks.length}`);
    console.log(`🎯 ROM: ${payload.baseRomBranch.baseRom.name} (${payload.baseRomBranch.name || 'main'})`);
    console.log(`💾 Binary files: ${payload.files.length} files, ${payload.files.reduce((sum, f) => sum + f.data.length, 0)} bytes total`);
    
    return root;
  }

  /**
   * Extract and flatten OpCodes from the instruction set schema
   * @private
   * @param instructionSet - The instruction set object from the schema
   * @returns Array of OpCode objects with code, mnem, mode, and size properties
   */
  private static extractOpCodesFromInstructionSet(instructionSet: any): OpCode[] {
    const opCodes: OpCode[] = [];
    
    for (const mnem in instructionSet) {
      for (const mode in instructionSet[mnem]) {
        const op = instructionSet[mnem][mode];
        opCodes[op] = new OpCode(op, mnem, mode);
      }
    }
    
    return opCodes;
  }
} 