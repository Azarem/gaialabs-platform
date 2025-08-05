import { RomProcessor } from './RomProcessor';
import { type ProjectConfig } from '../rom/project';
import type { DbRoot } from '@gaialabs/shared';
import { RomState } from '../rom/state';

/**
 * Project lifecycle management events
 */
export interface ProjectEvents {
  onLoadStart?: () => void;
  onLoadComplete?: (processor: RomProcessor) => void;
  onLoadError?: (error: Error) => void;
  onAnalysisStart?: () => void;
  onAnalysisComplete?: (results: any) => void;
  onExtractionStart?: () => void;
  onExtractionComplete?: (results: any) => void;
  onBuildStart?: () => void;
  onBuildComplete?: (results: any) => void;
}

/**
 * Project status tracking
 */
export interface ProjectStatus {
  isLoaded: boolean;
  isAnalyzed: boolean;
  isExtracted: boolean;
  canBuild: boolean;
  lastError?: Error;
  progress: number;
  currentTask?: string;
}

/**
 * Unified project manager for complete project lifecycle management
 * This is the highest-level API for managing ROM hacking projects
 */
export class ProjectManager {
  private processor: RomProcessor | null = null;
  private status: ProjectStatus = {
    isLoaded: false,
    isAnalyzed: false,
    isExtracted: false,
    canBuild: false,
    progress: 0
  };
  private events: ProjectEvents = {};

  constructor(events?: ProjectEvents) {
    this.events = events || {};
  }

  /**
   * Create project manager from existing project configuration
   */
  public static async fromConfig(config: ProjectConfig, events?: ProjectEvents): Promise<ProjectManager> {
    const manager = new ProjectManager(events);
    await manager.loadProject(config);
    return manager;
  }

  /**
   * Create project manager from project file or directory
   */
  public static async fromPath(path: string, events?: ProjectEvents): Promise<ProjectManager> {
    const manager = new ProjectManager(events);
    await manager.loadProjectFromPath(path);
    return manager;
  }

  /**
   * Load project from configuration
   */
  public async loadProject(config: ProjectConfig): Promise<void> {
    try {
      this.updateStatus({ currentTask: 'Loading project configuration', progress: 10 });
      this.events.onLoadStart?.();
      
      this.processor = new RomProcessor(config);
      
      this.updateStatus({ currentTask: 'Loading ROM data', progress: 30 });
      await this.processor.loadRom();
      
      this.updateStatus({ currentTask: 'Initializing database', progress: 60 });
      await this.processor.initialize();
      
      this.updateStatus({ 
        isLoaded: true, 
        currentTask: 'Project loaded successfully', 
        progress: 100 
      });
      
      this.events.onLoadComplete?.(this.processor);
    } catch (error) {
      const err = error as Error;
      this.updateStatus({ lastError: err, currentTask: 'Load failed', progress: 0 });
      this.events.onLoadError?.(err);
      throw err;
    }
  }

  /**
   * Load project from file or directory path
   */
  public async loadProjectFromPath(path: string): Promise<void> {
    const processor = await RomProcessor.fromProject(path);
    await this.loadProject(processor.getProject().config);
  }

  /**
   * Analyze ROM structure and extract metadata
   */
  public async analyzeRom(): Promise<any> {
    if (!this.processor) {
      throw new Error('Project not loaded. Call loadProject() first.');
    }

    try {
      this.updateStatus({ currentTask: 'Analyzing ROM structure', progress: 20 });
      this.events.onAnalysisStart?.();
      
      const results = await this.processor.analyze();
      
      this.updateStatus({ 
        isAnalyzed: true, 
        currentTask: 'ROM analysis complete', 
        progress: 100 
      });
      
      this.events.onAnalysisComplete?.(results);
      return results;
    } catch (error) {
      const err = error as Error;
      this.updateStatus({ lastError: err, currentTask: 'Analysis failed' });
      throw err;
    }
  }

  /**
   * Extract files from ROM
   */
  public async extractFiles(outputDir: string): Promise<any> {
    if (!this.processor) {
      throw new Error('Project not loaded. Call loadProject() first.');
    }

    try {
      this.updateStatus({ currentTask: 'Extracting files from ROM', progress: 30 });
      this.events.onExtractionStart?.();
      
      const results = await this.processor.extract(outputDir);
      
      this.updateStatus({ 
        isExtracted: true, 
        canBuild: true, 
        currentTask: 'File extraction complete', 
        progress: 100 
      });
      
      this.events.onExtractionComplete?.(results);
      return results;
    } catch (error) {
      const err = error as Error;
      this.updateStatus({ lastError: err, currentTask: 'Extraction failed' });
      throw err;
    }
  }

  /**
   * Build ROM from extracted files
   */
  public async buildRom(outputPath: string): Promise<any> {
    if (!this.processor) {
      throw new Error('Project not loaded. Call loadProject() first.');
    }

    if (!this.status.canBuild) {
      throw new Error('Cannot build ROM. Extract files first.');
    }

    try {
      this.updateStatus({ currentTask: 'Building ROM', progress: 40 });
      this.events.onBuildStart?.();
      
      const results = await this.processor.build(outputPath);
      
      this.updateStatus({ 
        currentTask: 'ROM build complete', 
        progress: 100 
      });
      
      this.events.onBuildComplete?.(results);
      return results;
    } catch (error) {
      const err = error as Error;
      this.updateStatus({ lastError: err, currentTask: 'Build failed' });
      throw err;
    }
  }

  /**
   * Process specific scene
   */
  public async processScene(sceneId: number, metaFile: string): Promise<RomState> {
    if (!this.processor) {
      throw new Error('Project not loaded. Call loadProject() first.');
    }

    return await this.processor.processScene(sceneId, metaFile);
  }

  /**
   * Get current project status
   */
  public getStatus(): ProjectStatus {
    return { ...this.status };
  }

  /**
   * Get the ROM processor instance
   */
  public getProcessor(): RomProcessor | null {
    return this.processor;
  }

  /**
   * Get project configuration
   */
  public getProjectConfig(): ProjectConfig | null {
    return this.processor?.getProject().config || null;
  }

  /**
   * Get database root
   */
  public getDatabase(): DbRoot | null {
    return this.processor?.getDatabase() || null;
  }

  /**
   * Get ROM state
   */
  public getRomState(): RomState | null {
    return this.processor?.getRomState() || null;
  }

  /**
   * Reset project to initial state
   */
  public reset(): void {
    this.processor = null;
    this.status = {
      isLoaded: false,
      isAnalyzed: false,
      isExtracted: false,
      canBuild: false,
      progress: 0
    };
  }

  /**
   * Complete workflow: load, analyze, extract, and build
   */
  public async completeWorkflow(
    projectPath: string, 
    outputDir: string, 
    outputRomPath: string
  ): Promise<any> {
    // Load project
    await this.loadProjectFromPath(projectPath);
    
    // Analyze ROM
    const analysisResults = await this.analyzeRom();
    
    // Extract files
    const extractionResults = await this.extractFiles(outputDir);
    
    // Build ROM
    const buildResults = await this.buildRom(outputRomPath);
    
    return {
      analysis: analysisResults,
      extraction: extractionResults,
      build: buildResults
    };
  }

  // Private helper methods

  private updateStatus(update: Partial<ProjectStatus>): void {
    this.status = { ...this.status, ...update };
  }
} 