import { BinType } from 'gaia-shared';
import type { DbRoot } from 'gaia-shared';
import { readFileAsBinary } from 'gaia-shared';
import { SpriteMap } from '../sprites';

/**
 * ROM state management for SNES hardware emulation
 * Converted from GaiaLib/Rom/RomState.cs
 */
export class RomState {
  // Hardware memory buffers
  public readonly cgram = new Uint8Array(0x200);     // Color palette RAM
  public readonly vram = new Uint8Array(0x10000);    // Video RAM
  
  // Tileset data
  public readonly mainTileset = new Uint8Array(0x800);
  public readonly effectTileset = new Uint8Array(0x800);
  public mainTilesetPath?: string;
  public effectTilesetPath?: string;
  
  // Tilemap data
  public mainTilemap = new Uint8Array(0x2000);
  public mainTilemapW = 0;
  public mainTilemapH = 0;
  public mainTilemapPath?: string;
  
  public effectTilemap = new Uint8Array(0x2000);
  public effectTilemapW = 0;
  public effectTilemapH = 0;
  public effectTilemapPath?: string;
  
  // Sprite data
  public static spriteMap: SpriteMap | null = null;
  public static spriteMapPath: string | null = null;

  /**
   * Strip address space prefixes from names
   */
  public static stripName(name: string): string {
    const addressSpace = ['@', '&', '^', '#', '$', '%', '*'];
    while (name.length > 0 && addressSpace.includes(name[0])) {
      name = name.substring(1);
    }
    return name;
  }

  /**
   * Create ROM state from scene metadata
   * Simplified version of the C# implementation
   */
  public static async fromScene(
    baseDir: string, 
    root: DbRoot, 
    metaFile: string, 
    id: number
  ): Promise<RomState> {
    const state = new RomState();
    
    // TODO: Implement full scene parsing when Assembler is available
    // This is a simplified version that sets up the basic structure
    
    // Helper function to get resource file
    const getResource = (name: string, type: BinType): string => {
      const path = root.paths[type] || root.paths[BinType.Unknown];
      return `${baseDir}/${path.folder}/${RomState.stripName(name)}.${path.extension}`;
    };

    // TODO: Parse assembly file and process commands
    // const res = root.paths[BinType.Assembly];
    // const filePath = `${baseDir}/${res.folder}/${metaFile}.${res.extension}`;
    
    // For now, return empty state
    return state;
  }

  /**
   * Process scene command (simplified version)
   * TODO: Implement full command processing
   */
  private static async processCommand(
    state: RomState,
    command: number,
    params: any[],
    getResource: (name: string, type: BinType) => string
  ): Promise<void> {
    switch (command) {
      case 0x02: // PPU index
        // TODO: Handle PPU index
        break;
        
      case 0x03: // Load bitmap data to VRAM
        // TODO: Implement bitmap loading
        break;
        
      case 0x04: // Load palette data to CGRAM
        // TODO: Implement palette loading
        break;
        
      case 0x05: // Load tileset data
        // TODO: Implement tileset loading
        break;
        
      case 0x06: // Load tilemap data
        // TODO: Implement tilemap loading
        break;
        
      case 0x10: // Load sprite map
        if (params.length > 0) {
          const spritePath = getResource(params[0], BinType.Spritemap);
          try {
            const data = await readFileAsBinary(spritePath);
            RomState.spriteMap = SpriteMap.fromBytes(data);
            RomState.spriteMapPath = spritePath;
          } catch (error) {
            console.warn(`Failed to load sprite map: ${spritePath}`, error);
          }
        }
        break;
        
      case 0x11: // Music setup
        // TODO: Handle music setup
        break;
        
      case 0x13: // Flag check
        // TODO: Handle flag checking
        break;
        
      case 0x14: // Jump to label
        // TODO: Handle label jumping
        break;
        
      case 0x15: // Process sub-block
        // TODO: Handle sub-block processing
        break;
        
      case 0x17: // Unknown command
        // TODO: Handle unknown command
        break;
        
      default:
        // Unknown command, stop processing
        break;
    }
  }
}

/**
 * ROM state utilities
 */
export class RomStateUtils {
  /**
   * Create empty ROM state
   */
  public static createEmpty(): RomState {
    return new RomState();
  }

  /**
   * Clear all data in ROM state
   */
  public static clear(state: RomState): void {
    state.cgram.fill(0);
    state.vram.fill(0);
    state.mainTileset.fill(0);
    state.effectTileset.fill(0);
    state.mainTilemap.fill(0);
    state.effectTilemap.fill(0);
    
    state.mainTilesetPath = undefined;
    state.effectTilesetPath = undefined;
    state.mainTilemapPath = undefined;
    state.effectTilemapPath = undefined;
    state.mainTilemapW = 0;
    state.mainTilemapH = 0;
    state.effectTilemapW = 0;
    state.effectTilemapH = 0;
  }
} 