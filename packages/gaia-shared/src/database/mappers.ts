import { BinType } from '../types/resources';
import type { DbFile } from './files';
import type { DbBlock } from './blocks';
import type { DbPart } from './parts';
import type { DbStringType, DbStringCommand, DbStringLayer } from './strings';
import type { DbOverride } from './overrides';
import type { DbStruct } from './structs';
import type { MemberType } from '../types/members';
import type { RegisterType } from '../types/processor';
import type { 
  GameFile as PrismaGameFile, 
  ReleaseFile as PrismaReleaseFile, 
  GameBlock as PrismaGameBlock, 
  ReleaseBlock as PrismaReleaseBlock, 
  GamePart as PrismaGamePart, 
  ReleasePart as PrismaReleasePart, 
  GameString as PrismaGameString, 
  ReleaseString as PrismaReleaseString, 
  GameStringCommand as PrismaGameStringCommand, 
  ReleaseStringCommand as PrismaReleaseStringCommand, 
  ReleaseStringLayer as PrismaReleaseStringLayer, 
  ReleaseOverride as PrismaReleaseOverride, 
  ReleaseRewrite as PrismaReleaseRewrite, 
  ReleaseLabel as PrismaReleaseLabel,
  ReleaseTransform as PrismaReleaseTransform
} from '@prisma/client';

// Temporary type definitions for GameStruct and ReleaseStruct 
// These will be replaced by generated Prisma types once the client is regenerated
interface PrismaGameStruct {
  id: string;
  gameId: string;
  name: string;
  types: any; // JsonValue
  delimiter: number | null;
  descriminator: number | null;
  parent: string | null;
  parts: any; // JsonValue
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date | null;
  createdById: string | null;
  updatedById: string | null;
  deletedById: string | null;
}

interface PrismaReleaseStruct {
  id: string;
  releaseId: string;
  gameStructId: string;
  name: string | null;
  types: any; // JsonValue
  delimiter: number | null;
  descriminator: number | null;
  parent: string | null;
  parts: any; // JsonValue
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date | null;
  createdById: string | null;
  updatedById: string | null;
  deletedById: string | null;
}

// Extended types that include the relations we need for mapping
export type GameFile = PrismaGameFile;
export type ReleaseFile = PrismaReleaseFile;
export type GameBlock = PrismaGameBlock;
export type ReleaseBlock = PrismaReleaseBlock;
export type GamePart = PrismaGamePart & {
  block?: string; // This comes from joins in queries
};
export type ReleasePart = PrismaReleasePart;

export type GameString = PrismaGameString & {
  commands?: GameStringCommand[];
  releaseStrings?: ReleaseString[];
};

export type ReleaseString = Omit<PrismaReleaseString, 'characterMap'> & {
  characterMap: string[]; // Cast JsonValue to string[]
  commands?: ReleaseStringCommand[];
  layers?: ReleaseStringLayer[];
};

export type GameStringCommand = Omit<PrismaGameStringCommand, 'types'> & {
  types: MemberType[]; // Cast JsonValue to MemberType[]
};

export type ReleaseStringCommand = Omit<PrismaReleaseStringCommand, 'types'> & {
  types?: MemberType[] | null; // Cast JsonValue to MemberType[]
};

export type ReleaseStringLayer = Omit<PrismaReleaseStringLayer, 'map'> & {
  map: string[]; // Cast JsonValue to string[]
};

// For JSON data fields, we need to define the expected structure
export type ReleaseOverrideData = {
  location: number;
  register: RegisterType;
  value: number;
};

export type ReleaseRewriteData = {
  location: number;
  value: number;
};

export type ReleaseOverride = Omit<PrismaReleaseOverride, 'data'> & {
  data: ReleaseOverrideData;
};

export type ReleaseRewrite = Omit<PrismaReleaseRewrite, 'data'> & {
  data: ReleaseRewriteData;
};

export type ReleaseLabel = PrismaReleaseLabel;

export type GameStruct = Omit<PrismaGameStruct, 'types' | 'parts'> & {
  types?: string[] | null; // Cast JsonValue to string[]
  parts?: string[] | null; // Cast JsonValue to string[]
};

export type ReleaseStruct = Omit<PrismaReleaseStruct, 'types' | 'parts'> & {
  types?: string[] | null; // Cast JsonValue to string[]
  parts?: string[] | null; // Cast JsonValue to string[]
};

/**
 * Utility for coalescing Game and Release data
 * ReleaseX data takes precedence over GameX data
 */
class CoalesceUtils {
  /**
   * Coalesce a value, preferring release over game
   * Treats null as undefined for compatibility with non-Prisma types
   */
  static coalesce<T>(releaseValue: T | null | undefined, gameValue: T): T {
    return releaseValue !== null && releaseValue !== undefined ? releaseValue : gameValue;
  }

  /**
   * Coalesce a nullable value, preferring release over game
   * Returns undefined if both values are null/undefined
   */
  static coalesceNullable<T>(releaseValue: T | null | undefined, gameValue: T | null | undefined): T | undefined {
    if (releaseValue !== null && releaseValue !== undefined) return releaseValue;
    if (gameValue !== null && gameValue !== undefined) return gameValue;
    return undefined;
  }

  /**
   * Coalesce boolean values
   */
  static coalesceBool(releaseValue: boolean | null | undefined, gameValue: boolean): boolean {
    return releaseValue !== null && releaseValue !== undefined ? releaseValue : gameValue;
  }
}

/**
 * Maps GameFile + ReleaseFile to DbFile
 */
export class FileMapper {
  static map(gameFile: GameFile, releaseFile?: ReleaseFile): DbFile {
    // Get the type string and validate it's a valid BinType
    const typeString = CoalesceUtils.coalesce(releaseFile?.type, gameFile.type) || 'Unknown';
    const binType = Object.values(BinType).includes(typeString as BinType) 
      ? typeString as BinType 
      : BinType.Unknown;

    return {
      name: CoalesceUtils.coalesce(releaseFile?.name, gameFile.name),
      type: binType,
      start: releaseFile?.romLocation || 0, // Map romLocation to start
      end: (releaseFile?.romLocation || 0) + (releaseFile?.romSize || 0),
      compressed: CoalesceUtils.coalesce(releaseFile?.compressed, gameFile.compressed),
      //move: CoalesceUtils.coalesce(releaseFile?.move, gameFile.move) || false, // Default - not available in Supabase schema  
      upper: CoalesceUtils.coalesce(releaseFile?.upper, gameFile.upper) || false // Default - not available in Supabase schema
    };
  }


}

/**
 * Maps GameBlock + ReleaseBlock to DbBlock
 */
export class BlockMapper {
  static map(gameBlock: GameBlock, releaseBlock?: ReleaseBlock, parts: DbPart[] = [], transforms?: { key: string; value: string }[]): DbBlock {
    return {
      name: CoalesceUtils.coalesce(releaseBlock?.name, gameBlock.name),
      movable: CoalesceUtils.coalesce(releaseBlock?.movable, gameBlock.movable) || false,
      group: CoalesceUtils.coalesce(releaseBlock?.group, gameBlock.group) || '',
      parts,
      transforms,
      postProcess: releaseBlock?.postProcess || ''
    };
  }
}

/**
 * Maps GamePart + ReleasePart to DbPart
 */
export class PartMapper {
  static map(gamePart: GamePart, releasePart?: ReleasePart): DbPart {
    return {
      name: CoalesceUtils.coalesce(releasePart?.name, gamePart.name),
      start: releasePart?.romLocation || 0, // Map romLocation to start
      struct: CoalesceUtils.coalesce(releasePart?.struct, gamePart.struct) || '',
      bank: releasePart?.bank,
      block: gamePart.block || '', // This should be the block name
      size: releasePart?.romSize || 0 // Map romSize to size
    };
  }
}

/**
 * Maps GameString + ReleaseString to DbStringType
 */
export class StringTypeMapper {
  static map(gameString: GameString, releaseString?: ReleaseString): DbStringType {
    const commands: Record<number, DbStringCommand> = {};
    const layers: DbStringLayer[] = [];

    // Process commands with coalesce logic
    if (gameString.commands) {
      for (const gameCmd of gameString.commands) {
        // Find matching ReleaseStringCommand
        const releaseCmd = releaseString?.commands?.find((rc: ReleaseStringCommand) => 
          rc.gameStringCommandId === gameCmd.id
        );

        commands[gameCmd.key] = {
          set: gameString.name, // Use the string type name as set
          key: CoalesceUtils.coalesce(releaseCmd?.key, gameCmd.key),
          value: CoalesceUtils.coalesce(releaseCmd?.value, gameCmd.value) || '',
          types: releaseCmd?.types || gameCmd.types || [],
          delimiter: CoalesceUtils.coalesceNullable(releaseCmd?.delimiter, gameCmd.delimiter),
          halt: CoalesceUtils.coalesceBool(releaseCmd?.halt, gameCmd.halt || false)
        };
      }
    }

    // Process layers
    if (releaseString?.layers) {
      for (const layer of releaseString.layers) {
        layers.push({
          type: gameString.name,
          base: layer.base,
          map: layer.map || []
        });
      }
    }

    return {
      name: CoalesceUtils.coalesce(releaseString?.name, gameString.name),
      delimiter: CoalesceUtils.coalesce(releaseString?.delimiter, gameString.delimiter) || '',
      terminator: CoalesceUtils.coalesce(releaseString?.terminator, gameString.terminator) || 0,
      shiftType: CoalesceUtils.coalesceNullable(releaseString?.shiftType, gameString.shiftType),
      characterMap: releaseString?.characterMap || [], // ReleaseString has the actual character map
      commands,
      layers,
      greedyTerminator: CoalesceUtils.coalesceBool(releaseString?.greedyTerminator, gameString.greedyTerminator || false)
    };
  }
}

/**
 * Maps ReleaseOverride to DbOverride record
 */
export class OverrideMapper {
  static mapToRecord(overrides: ReleaseOverride[]): Record<number, DbOverride> {
    const result: Record<number, DbOverride> = {};
    
    for (const override of overrides) {
      if (override.data?.location && typeof override.data.location === 'number') {
        result[override.data.location] = {
          location: override.data.location,
          register: override.data.register || 0, // Provide default if null/undefined
          value: override.data.value || 0 // Provide default if null/undefined
        };
      }
    }
    
    return result;
  }
}

/**
 * Maps ReleaseRewrite to rewrites record
 */
export class RewriteMapper {
  static mapToRecord(rewrites: ReleaseRewrite[]): Record<number, number> {
    const result: Record<number, number> = {};
    
    for (const rewrite of rewrites) {
      if (rewrite.data?.location && typeof rewrite.data.location === 'number' && 
          rewrite.data?.value !== undefined && typeof rewrite.data.value === 'number') {
        result[rewrite.data.location] = rewrite.data.value;
      }
    }
    
    return result;
  }
}

/**
 * Maps ReleaseLabel to labels record
 */
export class LabelMapper {
  static mapToRecord(labels: ReleaseLabel[]): Record<number, string> {
    const result: Record<number, string> = {};
    
    for (const label of labels) {
      if (typeof label.location === 'number' && typeof label.label === 'string') {
        result[label.location] = label.label;
      }
    }
    
    return result;
  }
}

/**
 * Maps GameStruct + ReleaseStruct to DbStruct
 */
export class StructMapper {
  static map(gameStruct: GameStruct, releaseStruct?: ReleaseStruct): DbStruct {
    return {
      name: CoalesceUtils.coalesce(releaseStruct?.name, gameStruct.name),
      types: CoalesceUtils.coalesce(releaseStruct?.types, gameStruct.types) || [],
      parent: CoalesceUtils.coalesce(releaseStruct?.parent, gameStruct.parent) || '',
      delimiter: CoalesceUtils.coalesceNullable(releaseStruct?.delimiter, gameStruct.delimiter),
      discriminator: CoalesceUtils.coalesceNullable(releaseStruct?.descriminator, gameStruct.descriminator)
    };
  }
}

/**
 * Main data processor that handles the Game/Release coalesce pattern
 */
export class DataProcessor {
  /**
   * Process game data with coalesce logic - Release* data overrides Game* data
   */
  static processWithCoalesce(
    gameData: { blocks: GameBlock[], parts: GamePart[], files: GameFile[], structs: GameStruct[] },
    releases: any[]
  ): {
    blocks: DbBlock[], 
    files: DbFile[], 
    parts: DbPart[],
    structs: DbStruct[],
    overrides: Record<number, DbOverride>,
    rewrites: Record<number, number>,
    labels: Record<number, string>
  } {
    const processedBlocks: DbBlock[] = [];
    const processedFiles: DbFile[] = [];
    const processedParts: DbPart[] = [];
    const processedStructs: DbStruct[] = [];
    let overrides: Record<number, DbOverride> = {};
    let rewrites: Record<number, number> = {};
    let labels: Record<number, string> = {};

    // Process each release
    for (const release of releases) {
      // Collect release-specific data
      if (release.overrides) {
        const releaseOverrides = OverrideMapper.mapToRecord(release.overrides);
        overrides = { ...overrides, ...releaseOverrides };
      }

      if (release.rewrites) {
        const releaseRewrites = RewriteMapper.mapToRecord(release.rewrites);
        rewrites = { ...rewrites, ...releaseRewrites };
      }

      if (release.labels) {
        const releaseLabels = LabelMapper.mapToRecord(release.labels);
        labels = { ...labels, ...releaseLabels };
      }

      // Transforms are now processed per-block using the relationship structure

      // Process files with coalesce logic
      for (const gameFile of gameData.files) {
        const releaseFile = release.files?.find((rf: any) => rf.gameFileId === gameFile.id);
        const mappedFile = FileMapper.map(gameFile, releaseFile);
        processedFiles.push(mappedFile);
      }

      // Process structs with coalesce logic
      for (const gameStruct of gameData.structs) {
        const releaseStruct = release.structs?.find((rs: any) => rs.gameStructId === gameStruct.id);
        const mappedStruct = StructMapper.map(gameStruct, releaseStruct);
        processedStructs.push(mappedStruct);
      }

      // Process blocks with coalesce logic
      for (const gameBlock of gameData.blocks) {
        const releaseBlock = release.blocks?.find((rb: any) => rb.gameBlockId === gameBlock.id);
        
        // Process parts for this block
        const blockParts = gameData.parts
          .filter(p => p.gameBlockId === gameBlock.id)
          .sort((a, b) => a.order - b.order)
          .map(gamePart => {
            const releasePart = release.parts?.find((rp: any) => rp.gamePartId === gamePart.id);
            return PartMapper.map(gamePart, releasePart);
          });

        // Find transforms for this block using the relationship structure
        const blockTransforms: { key: string; value: string }[] = [];
        if (release.transforms && releaseBlock) {
          const releaseBlockTransforms = release.transforms.filter((t: any) => 
            t.releaseBlockId === releaseBlock.id
          );
          releaseBlockTransforms.forEach((t: any) => {
            if (t.transforms && Array.isArray(t.transforms)) {
              blockTransforms.push(...t.transforms);
            }
          });
        }
        
        const mappedBlock = BlockMapper.map(gameBlock, releaseBlock, blockParts, blockTransforms);
        processedBlocks.push(mappedBlock);
      }
    }

    // If no releases, use game data directly
    if (releases.length === 0) {
      gameData.files.forEach(gameFile => {
        processedFiles.push(FileMapper.map(gameFile));
      });

      gameData.structs.forEach(gameStruct => {
        processedStructs.push(StructMapper.map(gameStruct));
      });

      gameData.blocks.forEach(gameBlock => {
        const blockParts = gameData.parts
          .filter(p => p.gameBlockId === gameBlock.id)
          .map(gamePart => PartMapper.map(gamePart));
        
        processedBlocks.push(BlockMapper.map(gameBlock, undefined, blockParts));
      });
    }

    // Create parts array for return
    processedBlocks.forEach(block => {
      processedParts.push(...block.parts);
      // Set internal _block reference
      block.parts.forEach(part => {
        (part as any)._block = block;
      });
    });

    return {
      blocks: processedBlocks,
      files: processedFiles,
      parts: processedParts,
      structs: processedStructs,
      overrides,
      rewrites,
      labels
    };
  }

  /**
   * Process string types with GameString/ReleaseString coalesce logic
   */
  static processStringTypes(gameStrings: GameString[]): DbStringType[] {
    return gameStrings.map(gameString => {
      // Find matching ReleaseString for coalesce logic
      const releaseString = gameString.releaseStrings?.[0]; // Assume one release for now
      return StringTypeMapper.map(gameString, releaseString);
    });
  }
}
