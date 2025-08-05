import type { DbRoot } from '@gaialabs/shared';
import { readFileAsBinary } from '@gaialabs/shared';
import { RomState } from '../rom/state';
import { ProjectRoot, type ProjectConfig } from '../rom/project';
import { QuintetLZ } from '../compression/QuintetLZ';
import { OpCodeUtils } from '../assembly/OpCode';

/**
 * Unified ROM processor providing high-level APIs for common ROM processing workflows
 * This is the main entry point for ROM processing operations
 */
export class RomProcessor {
  private projectRoot: ProjectRoot;
  private dbRoot: DbRoot | null = null;
  private romData: Uint8Array | null = null;
  private romState: RomState | null = null;

  constructor(projectConfig: ProjectConfig) {
    this.projectRoot = new ProjectRoot(projectConfig);
  }

  /**
   * Create ROM processor from project file or directory
   */
  public static async fromProject(path?: string): Promise<RomProcessor> {
    const projectRoot = await ProjectRoot.load(path);
    return new RomProcessor(projectRoot.config);
  }

  /**
   * Load ROM data from file or URL
   */
  public async loadRom(romPath?: string): Promise<void> {
    const path = romPath || this.projectRoot.romPath;
    if (!path) {
      throw new Error('ROM path not specified');
    }

    try {
      this.romData = await readFileAsBinary(path);
    } catch (error) {
      throw new Error(`Failed to load ROM from ${path}: ${error}`);
    }
  }

  /**
   * Initialize database and load ROM metadata
   */
  public async initialize(): Promise<void> {
    if (!this.romData) {
      throw new Error('ROM data not loaded. Call loadRom() first.');
    }

    // Load database
    this.dbRoot = await this.projectRoot.dumpDatabase();
    
    // Initialize ROM state
    this.romState = new RomState();
  }

  /**
   * Analyze ROM structure and extract metadata
   */
  public async analyze(): Promise<RomAnalysisResult> {
    if (!this.dbRoot || !this.romData) {
      throw new Error('ROM processor not initialized. Call initialize() first.');
    }

    const result: RomAnalysisResult = {
      romSize: this.romData.length,
      headerInfo: this.analyzeHeader(),
      entryPoints: this.dbRoot.entryPoints,
      fileCount: this.dbRoot.files.length,
      blockCount: this.dbRoot.blocks.length,
      compressionUsed: this.detectCompression(),
      opcodeStats: this.analyzeOpcodes()
    };

    return result;
  }

  /**
   * Extract files from ROM data
   */
  public async extract(_outputDir: string): Promise<ExtractionResult> {
    if (!this.dbRoot || !this.romData) {
      throw new Error('ROM processor not initialized. Call initialize() first.');
    }

    const result: ExtractionResult = {
      extractedFiles: [],
      errors: [],
      totalSize: 0
    };

    // TODO: Implement file extraction when FileReader is available
    // This is a placeholder for the extraction logic
    console.warn('File extraction not yet implemented - awaiting FileReader conversion');

    return result;
  }

  /**
   * Process scene data for a specific scene ID
   */
  public async processScene(sceneId: number, metaFile: string): Promise<RomState> {
    if (!this.dbRoot) {
      throw new Error('ROM processor not initialized. Call initialize() first.');
    }

    const state = await RomState.fromScene(
      this.projectRoot.baseDir,
      this.dbRoot,
      metaFile,
      sceneId
    );

    this.romState = state;
    return state;
  }

  /**
   * Build ROM from extracted files
   */
  public async build(outputPath: string): Promise<BuildResult> {
    if (!this.dbRoot) {
      throw new Error('ROM processor not initialized. Call initialize() first.');
    }

    const result: BuildResult = {
      success: false,
      outputPath,
      romSize: 0,
      errors: []
    };

    // TODO: Implement ROM building when Assembler is available
    console.warn('ROM building not yet implemented - awaiting Assembler conversion');

    return result;
  }

  /**
   * Get compression provider for the project
   */
  public getCompression(): QuintetLZ {
    return this.projectRoot.getCompression();
  }

  /**
   * Get current ROM state
   */
  public getRomState(): RomState | null {
    return this.romState;
  }

  /**
   * Get database root
   */
  public getDatabase(): DbRoot | null {
    return this.dbRoot;
  }

  /**
   * Get project configuration
   */
  public getProject(): ProjectRoot {
    return this.projectRoot;
  }

  // Private helper methods

  private analyzeHeader(): RomHeaderInfo {
    if (!this.romData) {
      throw new Error('ROM data not loaded');
    }

    // Basic SNES ROM header analysis
    const headerOffset = 0x7FC0; // LoROM header location
    const title = new TextDecoder().decode(this.romData.slice(headerOffset, headerOffset + 21)).replace(/\0/g, '');
    const mapMode = this.romData[headerOffset + 21];
    const cartridgeType = this.romData[headerOffset + 22];
    const romSize = this.romData[headerOffset + 23];
    const ramSize = this.romData[headerOffset + 24];
    
    return {
      title,
      mapMode,
      cartridgeType,
      romSize,
      ramSize,
      isValid: title.length > 0 && mapMode !== 0xFF
    };
  }

  private detectCompression(): boolean {
    // Check if QuintetLZ compression is used
    return this.projectRoot.getCompression() instanceof QuintetLZ;
  }

  private analyzeOpcodes(): OpcodeStats {
    if (!this.dbRoot) {
      return { totalOpcodes: 0, uniqueOpcodes: 0, coverage: 0 };
    }

    const totalOpcodes = Object.keys(this.dbRoot.opCodes).length;
    const uniqueOpcodes = new Set(Object.values(this.dbRoot.opCodes)).size;
    const coverage = totalOpcodes > 0 ? (uniqueOpcodes / OpCodeUtils.getAllOpcodes().length) * 100 : 0;

    return {
      totalOpcodes,
      uniqueOpcodes,
      coverage
    };
  }
}

// Result interfaces

export interface RomAnalysisResult {
  romSize: number;
  headerInfo: RomHeaderInfo;
  entryPoints: any[];
  fileCount: number;
  blockCount: number;
  compressionUsed: boolean;
  opcodeStats: OpcodeStats;
}

export interface RomHeaderInfo {
  title: string;
  mapMode: number;
  cartridgeType: number;
  romSize: number;
  ramSize: number;
  isValid: boolean;
}

export interface ExtractionResult {
  extractedFiles: string[];
  errors: string[];
  totalSize: number;
}

export interface BuildResult {
  success: boolean;
  outputPath: string;
  romSize: number;
  errors: string[];
}

export interface OpcodeStats {
  totalOpcodes: number;
  uniqueOpcodes: number;
  coverage: number;
} 