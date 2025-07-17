import { BinType } from 'gaia-shared';
import type { DbRoot } from 'gaia-shared';
import { DbRootUtils } from 'gaia-shared';
import type { DbPath } from 'gaia-shared';
import { readJsonFile, readFileAsBinary, getDirectory } from 'gaia-shared';
import { QuintetLZ, type ICompressionProvider } from '../compression';
import { FileReader, SfxReader, BlockReader, BlockWriter } from './extraction';

/**
 * Main project management class
 * Converted from GaiaLib/ProjectRoot.cs
 */
export interface ProjectConfig {
  name: string;
  romPath: string;
  baseDir: string;
  system?: string;
  database: string;
  flipsPath?: string;
  resources: Record<BinType, DbPath>;
  databasePath?: string;
  systemPath?: string;
  compression?: string;
}

/**
 * Project root management
 */
export class ProjectRoot {
  public config: ProjectConfig;
  public name: string;
  public romPath: string;
  public baseDir: string;
  public system?: string;
  public database: string;
  public flipsPath?: string;
  public resources: Record<BinType, DbPath>;
  public databasePath?: string;
  public systemPath?: string;
  public compression?: string;

  constructor(config: ProjectConfig) {
    this.config = config;
    this.name = config.name;
    this.romPath = config.romPath;
    this.baseDir = config.baseDir;
    this.system = config.system;
    this.database = config.database;
    this.flipsPath = config.flipsPath;
    this.resources = config.resources;
    this.databasePath = config.databasePath;
    this.systemPath = config.systemPath;
    this.compression = config.compression;
  }

  /**
   * Get compression provider
   */
  public getCompression(): ICompressionProvider {
    const compressionType = this.compression || 'QuintetLZ';
    
    switch (compressionType) {
      case 'QuintetLZ':
      default:
        return new QuintetLZ();
    }
  }

  /**
   * Load project from file or directory
   */
  public static async load(path?: string): Promise<ProjectRoot> {
    path = path || './project.json';

    try {
      // Try to load as JSON file using shared utility
      const config = await readJsonFile<ProjectConfig>(path);
      
      // Set default values
      if (!config.baseDir) {
        config.baseDir = getDirectory(path);
      }
      
      //if (!config.database) {
      //  config.database = 'us';
      //}

      //config.databasePath = `${config.baseDir}/db/${config.database}`;
      //config.systemPath = `${config.baseDir}/db/snes`;

      return new ProjectRoot(config);
    } catch (error) {
      // Fall back to directory-based configuration
      console.warn(`Failed to load project file: ${error}. Using directory-based configuration.`);
    }

    // Try as directory
    const defaultConfig: ProjectConfig = {
      name: 'GaiaLabs',
      baseDir: path,
      flipsPath: process?.env?.flips_path,
      romPath: process?.env?.rom_path || '',
      database: 'us',
      databasePath: `${path}/db/us`,
      systemPath: `${path}/db/snes`,
      resources: {} as Record<BinType, DbPath>
    };

    return new ProjectRoot(defaultConfig);
  }

  /**
   * Build the ROM (simplified)
   */
  public async build(): Promise<void> {
    // TODO: Implement ROM building when RomWriter is available
    throw new Error('ROM building not yet implemented');
  }

  /**
   * Dump database and extract ROM data
   */
  public async dumpDatabase(): Promise<DbRoot> {
    // Load database from folder structure
    const root = await DbRootUtils.fromFolder(this.databasePath!, this.systemPath!);
    
    // Load ROM data using shared utility
    const data = await readFileAsBinary(this.romPath);
    
    root.paths = this.resources;

    // Extract files from ROM data
    const fileReader = new FileReader(data, root, this.getCompression());
    await fileReader.extract(this.baseDir);

    // Extract sound effects
    const sfxReader = new SfxReader(data, root);
    await sfxReader.extract(this.baseDir);

    // Process blocks - analyze and resolve ROM structure
    const blockReader = new BlockReader(data, root);
    blockReader.analyzeAndResolve();
    
    // Write processed blocks to assembly files
    const blockWriter = new BlockWriter(blockReader);
    await blockWriter.writeBlocks(this.baseDir);

    return root;
  }
} 