import pkg from '@prisma/client';
const { PrismaClient } = pkg;
import type { Game, GameBlock } from '@prisma/client';
import * as fs from 'fs';
import * as path from 'path';

const prisma = new PrismaClient();

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

  // 1. Clean up existing data for a clean seed
  console.log('Clearing existing data...');
  await prisma.releasePart.deleteMany({});
  await prisma.gamePart.deleteMany({});
  await prisma.releaseBlock.deleteMany({});
  await prisma.gameBlock.deleteMany({});
  await prisma.releaseFile.deleteMany({});
  await prisma.gameFile.deleteMany({});
  await prisma.release.deleteMany({});
  await prisma.game.deleteMany({});
  console.log('Data cleared.');

  // 2. Create the master Game record
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

  // 3. Create the Release record
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

  // 4. Get the path to the DB files from command-line arguments
  const dbPath = process.argv[2];
  if (!dbPath) {
    console.error(
      'Error: Please provide the path to the database directory (e.g., ext/GaiaLib/db/us) as an argument.'
    );
    process.exit(1);
  }
  console.log(`Using database path: ${dbPath}`);

  // 5. Read and process files.json
  const filesPath = path.join(dbPath, 'files.json');
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

  // 6. Read and process blocks.json
  const blocksPath = path.join(dbPath, 'blocks.json');
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

  // 7. Read and process parts.json
  const partsPath = path.join(dbPath, 'parts.json');
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

  console.log('Seed process finished successfully.');
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