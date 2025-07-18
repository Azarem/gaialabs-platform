import { BinType } from '../types/resources';
import { readJsonFile } from '../utils';
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
      stringLayers
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
      this.readTable<DbStringLayer[]>(`${folderPath}/stringLayers.json`)
    ]);

    // Process blocks and parts
    for (const block of blocks) {
      block.parts = parts.filter(p => p.block === block.name);
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
      }, {} as Record<string, DbStringType>)
    };

    // Set root references in blocks and initialize per-block mnemonic maps
    for (const block of blocks) {
      block.root = root;
      if (!block.mnemonics) {
        block.mnemonics = {};
      }
    }

    return root;
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