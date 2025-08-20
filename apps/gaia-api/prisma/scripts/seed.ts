import pkg from '@prisma/client';
const { PrismaClient } = pkg;
import type { Game, GameBlock } from '@prisma/client';
import * as fs from 'fs';
import * as path from 'path';
import { seed65C816 } from './seed-65c816.ts';
import { seedStringTypes } from './seed-string-types.ts';
import { join } from 'path';
import { readFileSync } from 'fs';
import type { CopDef, DbBlock, DbFile, DbLabel, DbMnemonic, DbOverride, DbPart, DbRewrite, DbStruct, DbTransform } from '@gaialabs/shared';




const prisma = new PrismaClient();



// --- Database Path Configuration ---
const DB_PATH = '../../ext/GaiaLib/db/us'; // Hardcoded relative path

// --- Game and Release Master Data ---
const GAME_TITLE = 'Illusion of Gaia';
const GAME_PLATFORM = 'SNES';
const GAME_ROM_DEVELOPER = 0x33; // Enix
const GAME_ROM_MODE = 0x31;
const GAME_ROM_CHIPSET = 0x02;
const GAME_ROM_SIZE = 0x0b; // 2^11 KB = 2MB
const GAME_RAM_SIZE = 0x03; // 2^3 KB = 8KB

const RELEASE_VERSION = 0x00; // US Version
const RELEASE_REGION = 0x01;
const RELEASE_ROM_CODE = '01JG  ';
const RELEASE_ROM_TITLE = 'ILLUSION OF GAIA USA ';
const RELEASE_ROM_CRC = 0x1C3848C0;

async function loadJsonData<T>(filePath: string): Promise<T> {
  try {
    const fullPath = join(process.cwd(), '../../ext/GaiaLib/db/us', filePath);
    const data = readFileSync(fullPath, 'utf-8')
      .replace(/^\uFEFF/, '') // Remove BOM if present
      .trim();
    return JSON.parse(data);
  } catch (error) {
    console.error(`Failed to load ${filePath}:`, error);
    return [] as T;
  }
}

async function main() {
  console.log('Starting seed process...');
  

  // 1. First, seed the 65C816 instruction set
  console.log('🔄 Seeding 65C816 instruction set...');
  try {
    await seed65C816();
  } catch (error) {
    console.error('❌ Failed to seed 65C816 instruction set:', error);
    throw error;
  }

  // 2. Skip string types seeding at this point - we'll do it after creating game/release

  // 3. Clean up existing game data for a clean seed
  console.log('Clearing existing game data...');
  
  // Clear release-specific data first
  await prisma.releaseLabel.deleteMany({});
  await prisma.releaseTransform.deleteMany({});
  await prisma.releaseRewrite.deleteMany({});
  await prisma.releaseOverride.deleteMany({});
  await prisma.releasePart.deleteMany({});
  await prisma.releaseBlock.deleteMany({});
  await prisma.releaseFile.deleteMany({});
  
  // Clear game-specific data
  await prisma.gameCop.deleteMany({});
  await prisma.gameMnemonic.deleteMany({});
  await prisma.gamePart.deleteMany({});
  await prisma.gameBlock.deleteMany({});
  await prisma.gameFile.deleteMany({});
  
  // Clear top-level entities
  await prisma.release.deleteMany({});
  await prisma.game.deleteMany({});
  
  console.log('Game data cleared.');

  // 4. Create the master Game record
  console.log(`Creating Game: ${GAME_TITLE}`);
  const game = await prisma.game.create({
    data: {
      title: GAME_TITLE,
      platform: GAME_PLATFORM,
      romDeveloper: GAME_ROM_DEVELOPER,
      romMode: GAME_ROM_MODE,
      romChipset: GAME_ROM_CHIPSET,
      romSize: GAME_ROM_SIZE,
      ramSize: GAME_RAM_SIZE,
    },
  });
  console.log(`Created game with ID: ${game.id}`);

  // 5. Create the Release record
  console.log(`Creating Release: ${RELEASE_ROM_TITLE}`);
  const release = await prisma.release.create({
    data: {
      gameId: game.id,
      romVersion: RELEASE_VERSION,
      romRegion: RELEASE_REGION,
      romCode: RELEASE_ROM_CODE,
      romTitle: RELEASE_ROM_TITLE,
      romCrc: RELEASE_ROM_CRC,
    },
  });
  console.log(`Created release with ID: ${release.id}`);

  // 6. Seed string types now that we have game and release IDs
  console.log('🔄 Seeding string types...');
  try {
    await seedStringTypes(game.id, release.id);
  } catch (error) {
    console.error('❌ Failed to seed string types:', error);
    throw error;
  }

  // 7. Seed struct definitions
  console.log('🔄 Seeding struct definitions...');
  try {
    await seedStructs(game.id, release.id);
  } catch (error) {
    console.error('❌ Failed to seed struct definitions:', error);
    throw error;
  }

  await seedGameFiles(game.id, release.id);

  // 7. Read and process blocks.json
  await seedGameBlocks(game.id, release.id);

  // 8. Read and process parts.json
  await seedGameParts(release.id);

  // 9. Read and process game-specific data files
  await seedGameMnemonics(game.id);
  await seedGameCops(game.id);

  // 10. Read and process release-specific data files  
  await seedReleaseOverrides(release.id);
  await seedReleaseRewrites(release.id);
  await seedReleaseTransforms(release.id);
  await seedReleaseLabels(release.id);

  console.log('Seed process finished successfully.');
}

async function seedGameFiles(gameId: string, releaseId: string){
  const filesData = await loadJsonData<DbFile[]>('files.json');
  console.log(`Importing ${filesData.length} files...`);
  for (const fileData of filesData) {
    const gameFile = await prisma.gameFile.create({
      data: {
        gameId: gameId,
        name: fileData.name,
        type: fileData.type,
      },
    });

    await prisma.releaseFile.create({
      data: {
        releaseId: releaseId,
        gameFileId: gameFile.id,
        romLocation: fileData.start,
        romSize: fileData.end - fileData.start,
      },
    });
  }
  console.log('Finished importing files.');
}

const gameBlocksMap = new Map<string, GameBlock>();
const releaseBlocksMap = new Map<string, string>(); // Maps block name to ReleaseBlock ID

async function seedGameBlocks(gameId: string, releaseId: string){
  const blocksData = await loadJsonData<DbBlock[]>('blocks.json');

  console.log(`Importing ${blocksData.length} blocks...`);
  for (const blockData of blocksData) {
    const gameBlock = await prisma.gameBlock.create({
      data: {
        gameId: gameId,
        name: blockData.name,
        group: blockData.group,
        movable: blockData.movable,
      },
    });
    gameBlocksMap.set(gameBlock.name, gameBlock);

    const releaseBlock = await prisma.releaseBlock.create({
      data: {
        releaseId: releaseId,
        gameBlockId: gameBlock.id,
        postProcess: blockData.postProcess,
      },
    });
    releaseBlocksMap.set(gameBlock.name, releaseBlock.id);
  }
  console.log('Finished importing blocks.');
}

async function seedGameParts(releaseId: string){

  // 8. Read and process parts.json
  const partsData = await loadJsonData<DbPart[]>('parts.json');

  console.log(`Importing ${partsData.length} parts...`);
  for (const [i, partData] of partsData.entries()) {
    const parentBlock = gameBlocksMap.get(partData.block);
    if (!parentBlock) {
      console.warn(`Could not find parent block named '${partData.block}' for part '${partData.name}'. Skipping.`);
      continue;
    }

    const gamePart = await prisma.gamePart.create({
      data: {
        block: {
          connect: {
            id: parentBlock.id,
          }
        },
        name: partData.name,
        struct: partData.struct,
        order: i, // Use array index for ordering
      },
    });

    await prisma.releasePart.create({
      data: {
        releaseId: releaseId,
        gamePartId: gamePart.id,
        romLocation: partData.start,
        romSize: partData.size,
        bank: partData.bank,
      },
    });
  }
  console.log('Finished importing parts.');
}

// Game-specific data seeding functions
async function seedGameMnemonics(gameId: string) {
  const mnemonicsData = await loadJsonData<DbMnemonic[]>('mnemonics_old.json');
  
  console.log(`Importing ${mnemonicsData.length} mnemonics...`);
  for (const mnemonicData of mnemonicsData) {
    await prisma.gameMnemonic.create({
      data: {
        gameId,
        key: mnemonicData.key,
        value: mnemonicData.value,
      },
    });
  }
  console.log('Finished importing mnemonics.');
}

async function seedGameCops(gameId: string) {
  const copsData = await loadJsonData<CopDef[]>('copdef.json');
  
  console.log(`Importing ${copsData.length} COP definitions...`);
  for (const copData of copsData) {
    await prisma.gameCop.create({
      data: {
        gameId,
        code: copData.code,
        mnem: copData.mnem,
        size: copData.size,
        halt: copData.halt,
        parts: copData.parts,
      },
    });
  }
  console.log('Finished importing COP definitions.');
}

// Release-specific data seeding functions
async function seedReleaseOverrides(releaseId: string) {
  const overridesData = await loadJsonData<DbOverride[]>('overrides.json');
  
  console.log(`Importing ${overridesData.length} overrides...`);
  for (const overrideData of overridesData) {
    await prisma.releaseOverride.create({
      data: {
        releaseId,
        data: overrideData,
      },
    });
  }
  console.log('Finished importing overrides.');
}

async function seedReleaseRewrites(releaseId: string) {
  const rewritesData = await loadJsonData<DbRewrite[]>('rewrites.json');
  
  console.log(`Importing ${rewritesData.length} rewrites...`);
  for (const rewriteData of rewritesData) {
    await prisma.releaseRewrite.create({
      data: {
        releaseId,
        data: rewriteData,
      },
    });
  }
  console.log('Finished importing rewrites.');
}

async function seedReleaseTransforms(releaseId: string) {
  const transformsData = await loadJsonData<DbTransform[]>('transforms.json');
  
  console.log(`Importing ${transformsData.length} transforms...`);
  for (const transformData of transformsData) {
    const releaseBlockId = releaseBlocksMap.get(transformData.block);
    if (!releaseBlockId) {
      console.warn(`Could not find ReleaseBlock for block name '${transformData.block}'. Skipping transform.`);
      continue;
    }

    await prisma.releaseTransform.create({
      data: {
        releaseId,
        releaseBlockId,
        transforms: transformData.transforms,
      },
    });
  }
  console.log('Finished importing transforms.');
}

async function seedReleaseLabels(releaseId: string) {
  const labelsData = await loadJsonData<DbLabel[]>('labels.json');
  
  console.log(`Importing ${labelsData.length} labels...`);
  for (const labelData of labelsData) {
    await prisma.releaseLabel.create({
      data: {
        releaseId,
        location: labelData.location,
        label: labelData.label,
      },
    });
  }
  console.log('Finished importing labels.');
}

async function seedStructs(gameId: string, releaseId: string) {
  try {
    const structsData = await loadJsonData<DbStruct[]>('structs.json');

    // Clear existing struct data
    console.log('🧹 Cleaning existing struct data...');
    await prisma.releaseStruct.deleteMany({});
    await prisma.gameStruct.deleteMany({});

    // Seed GameStruct (base struct definitions)
    console.log('📝 Creating game struct definitions...');
    for (const structDef of structsData) {
      const createdGameStruct = await prisma.gameStruct.create({
        data: {
          gameId,
          name: structDef.name,
          types: structDef.types,
          delimiter: structDef.delimiter,
          descriminator: structDef.discriminator,
          parent: structDef.parent,
          // parts field doesn't exist in the DbStruct interface yet, but is in the JSON
          // We'll handle it as JSON in case it's present in the actual data
          parts: (structDef as any).parts || null,
        },
      });

      console.log(`  ✅ Created game struct: ${createdGameStruct.name}`);

      // Create ReleaseStruct (release-specific overrides)
      // For now, we'll create a basic ReleaseStruct without overrides
      // In the future, release-specific struct variations can be added here
      await prisma.releaseStruct.create({
        data: {
          releaseId,
          gameStructId: createdGameStruct.id,
          // Override fields can be left null if same as GameStruct
          // romLocation and romSize can be added later when we know the actual addresses
        },
      });

      console.log(`    🎯 Created release struct for: ${createdGameStruct.name}`);
    }

    console.log(`✅ Successfully seeded ${structsData.length} struct definitions!`);
  } catch (error) {
    console.error('❌ Error seeding structs:', error);
    throw error;
  }
}

main()
  .catch((e) => {
    console.error('An error occurred during the seed process:');
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  }); 