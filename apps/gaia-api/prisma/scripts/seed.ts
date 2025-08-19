import pkg from '@prisma/client';
const { PrismaClient } = pkg;
import type { Game, GameBlock } from '@prisma/client';
import * as fs from 'fs';
import * as path from 'path';

// Import seed functions from other modules - will resolve at runtime
let seed65C816: any;
let seedStringTypesExternal: any;

// Dynamic imports to avoid circular dependencies
async function initSeedFunctions() {
  try {
    const mod65c816 = await import('file://' + import.meta.url.replace(/seed\.ts$/, 'seed-65c816.ts'));
    seed65C816 = mod65c816.seed65C816;
  } catch (error) {
    try {
      // Fallback: try different import path
      const mod65c816 = await import('./seed-65c816.ts');
      seed65C816 = mod65c816.seed65C816;
    } catch (error2) {
      console.warn('Could not import seed65C816:', error2);
    }
  }
  
  try {
    const modStringTypes = await import('file://' + import.meta.url.replace(/seed\.ts$/, 'seed-string-types.ts'));
    seedStringTypesExternal = modStringTypes.seedStringTypes;
  } catch (error) {
    try {
      // Fallback: try different import path
      const modStringTypes = await import('./seed-string-types.ts');
      seedStringTypesExternal = modStringTypes.seedStringTypes;
    } catch (error2) {
      console.warn('Could not import seedStringTypes:', error2);
    }
  }
}


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


async function main() {
  console.log('Starting seed process...');
  
  // Initialize imported functions
  await initSeedFunctions();

  // 1. First, seed the 65C816 instruction set
  console.log('🔄 Seeding 65C816 instruction set...');
  try {
    if (seed65C816) {
      await seed65C816();
      console.log('✅ 65C816 instruction set seeded successfully');
    } else {
      console.warn('⚠️ seed65C816 function not available, skipping');
    }
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
    if (seedStringTypesExternal) {
      await seedStringTypesExternal(game.id, release.id);
      console.log('✅ String types seeded successfully');
    } else {
      console.warn('⚠️ seedStringTypes function not available, skipping');
    }
  } catch (error) {
    console.error('❌ Failed to seed string types:', error);
    throw error;
  }

  // 7. Read and process files.json
  console.log(`Using database path: ${DB_PATH}`);
  const filesPath = path.join(DB_PATH, 'files.json');
  console.log(`Reading files from: ${filesPath}`);
  const filesFile = fs.readFileSync(filesPath, 'utf-8');
  const filesData = JSON.parse(filesFile);

  console.log(`Importing ${filesData.length} files...`);
  for (const fileData of filesData) {
    const gameFile = await prisma.gameFile.create({
      data: {
        gameId: game.id,
        name: fileData.name,
        type: fileData.type,
      },
    });

    await prisma.releaseFile.create({
      data: {
        releaseId: release.id,
        gameFileId: gameFile.id,
        romLocation: fileData.start,
        romSize: fileData.end - fileData.start,
      },
    });
  }
  console.log('Finished importing files.');

  // 7. Read and process blocks.json
  const blocksPath = path.join(DB_PATH, 'blocks.json');
  console.log(`Reading blocks from: ${blocksPath}`);
  const blocksFile = fs.readFileSync(blocksPath, 'utf-8');
  const blocksData = JSON.parse(blocksFile);
  const gameBlocksMap = new Map<string, GameBlock>();

  console.log(`Importing ${blocksData.length} blocks...`);
  for (const blockData of blocksData) {
    const gameBlock = await prisma.gameBlock.create({
      data: {
        gameId: game.id,
        name: blockData.name,
        group: blockData.group,
      },
    });
    gameBlocksMap.set(gameBlock.name, gameBlock);

    await prisma.releaseBlock.create({
      data: {
        releaseId: release.id,
        gameBlockId: gameBlock.id,
      },
    });
  }
  console.log('Finished importing blocks.');

  // 8. Read and process parts.json
  const partsPath = path.join(DB_PATH, 'parts.json');
  console.log(`Reading parts from: ${partsPath}`);
  const partsFile = fs.readFileSync(partsPath, 'utf-8');
  const partsData = JSON.parse(partsFile);

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
        releaseId: release.id,
        gamePartId: gamePart.id,
        romLocation: partData.start,
        romSize: partData.end - partData.start,
      },
    });
  }
  console.log('Finished importing parts.');

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

// Game-specific data seeding functions
async function seedGameMnemonics(gameId: string) {
  const mnemonicsPath = path.join(DB_PATH, 'mnemonics_old.json');
  console.log(`Reading mnemonics from: ${mnemonicsPath}`);
  
  if (!fs.existsSync(mnemonicsPath)) {
    console.log('No mnemonics file found, skipping...');
    return;
  }
  
  const mnemonicsFile = fs.readFileSync(mnemonicsPath, 'utf-8');
  const mnemonicsData = JSON.parse(mnemonicsFile);
  
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
  const copsPath = path.join(DB_PATH, 'copdef.json');
  console.log(`Reading COP definitions from: ${copsPath}`);
  
  if (!fs.existsSync(copsPath)) {
    console.log('No copdef file found, skipping...');
    return;
  }
  
  const copsFile = fs.readFileSync(copsPath, 'utf-8');
  const copsData = JSON.parse(copsFile);
  
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
  const overridesPath = path.join(DB_PATH, 'overrides.json');
  console.log(`Reading overrides from: ${overridesPath}`);
  
  if (!fs.existsSync(overridesPath)) {
    console.log('No overrides file found, skipping...');
    return;
  }
  
  const overridesFile = fs.readFileSync(overridesPath, 'utf-8');
  const overridesData = JSON.parse(overridesFile);
  
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
  const rewritesPath = path.join(DB_PATH, 'rewrites.json');
  console.log(`Reading rewrites from: ${rewritesPath}`);
  
  if (!fs.existsSync(rewritesPath)) {
    console.log('No rewrites file found, skipping...');
    return;
  }
  
  const rewritesFile = fs.readFileSync(rewritesPath, 'utf-8');
  const rewritesData = JSON.parse(rewritesFile);
  
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
  const transformsPath = path.join(DB_PATH, 'transforms.json');
  console.log(`Reading transforms from: ${transformsPath}`);
  
  if (!fs.existsSync(transformsPath)) {
    console.log('No transforms file found, skipping...');
    return;
  }
  
  const transformsFile = fs.readFileSync(transformsPath, 'utf-8');
  const transformsData = JSON.parse(transformsFile);
  
  console.log(`Importing ${transformsData.length} transforms...`);
  for (const transformData of transformsData) {
    await prisma.releaseTransform.create({
      data: {
        releaseId,
        block: transformData.block,
        transforms: transformData.transforms,
      },
    });
  }
  console.log('Finished importing transforms.');
}

async function seedReleaseLabels(releaseId: string) {
  const labelsPath = path.join(DB_PATH, 'labels.json');
  console.log(`Reading labels from: ${labelsPath}`);
  
  if (!fs.existsSync(labelsPath)) {
    console.log('No labels file found, skipping...');
    return;
  }
  
  const labelsFile = fs.readFileSync(labelsPath, 'utf-8');
  const labelsData = JSON.parse(labelsFile);
  
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

main()
  .catch((e) => {
    console.error('An error occurred during the seed process:');
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  }); 