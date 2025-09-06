import pkg from '@prisma/client';
const { PrismaClient } = pkg;
import type { Game } from '@prisma/client';
import * as fs from 'fs';
//import * as path from 'path';
import * as path from 'path';
import { readFileSync } from 'fs';
import type { CopDef, DbBlock, DbConfig, DbFile, DbLabel, DbMnemonic, DbOverride, DbPart, DbRewrite, DbStringCommand, DbStringLayer, DbStringType, DbStruct, DbTransform } from '@gaialabs/shared';
import { crc32_buffer, readFileAsBinary, OpCode } from '@gaialabs/shared';

const prisma = new PrismaClient();

// --- Database Path Configuration ---
const DATA_DIR = '../../data/65c816';
const DB_PATH = '../../ext/GaiaLib/db/us';
const BR_PATH = '../../working';
const SYS_PATH = '../../ext/GaiaLib/db/snes';
const RXLT_PATH = 'C:/Work/IOGRXLT/IOGRetranslation';

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


// Instruction group category mapping
const INSTRUCTION_GROUP_CATEGORIES: Record<string, string> = {
  'loadstore': 'LoadStore',
  'arithmetic': 'Arithmetic',
  'logical': 'Logical',
  'shift': 'Shift',
  'controlflow': 'ControlFlow',
  'branch': 'Branch',
  'system': 'System',
  'interrupt': 'Interrupt',
  'flags': 'Flags',
  'stack': 'Stack',
  'transfer': 'Transfer',
  'blockmove': 'BlockMove',
  'special': 'Special'
};

async function loadJsonData<T>(rootPath: string, filePath: string): Promise<T> {
  const fullPath = path.resolve(path.join(rootPath, filePath));
  const data = (await fs.promises.readFile(fullPath, 'utf-8'))
    .replace(/^\uFEFF/, '') // Remove BOM if present
    .trim();
  return JSON.parse(data);
}

async function loadBinaryData(rootPath: string, filePath: string): Promise<Uint8Array> {
  const fullPath = path.resolve(path.join(rootPath, filePath));
  const data = await readFileAsBinary(fullPath);
  return data;
}


async function main() {
  console.log('Starting seed process...');
  

  // // 1. First, seed the 65C816 instruction set
  // console.log('🔄 Seeding 65C816 instruction set...');
  // try {
  //   await seed65C816();
  // } catch (error) {
  //   console.error('❌ Failed to seed 65C816 instruction set:', error);
  //   throw error;
  // }

  // 2. Skip string types seeding at this point - we'll do it after creating game/release

  // 3. Clean up existing game data for a clean seed
  console.log('Clearing existing game data...');
    
  await prisma.projectBranch.deleteMany({});
  await prisma.projectFile.deleteMany({});
  await prisma.project.deleteMany({});
  await prisma.baseRomFile.deleteMany({});
  await prisma.baseRomBranch.deleteMany({});
  await prisma.baseRom.deleteMany({});
  await prisma.gameRomBranch.deleteMany({});
  await prisma.gameRom.deleteMany({});
  await prisma.game.deleteMany({});
  await prisma.developer.deleteMany({});
  await prisma.region.deleteMany({});
  await prisma.platformBranch.deleteMany({});
  await prisma.platform.deleteMany({});
  
  console.log('Game data cleared.');


  // 1. Create the platform
  console.log('Creating platform: ' + GAME_PLATFORM);
  const platform = await prisma.platform.create({
    data: {
      name: GAME_PLATFORM,
      meta: {},
    },
  });

  //Create the platform branch
  console.log('Creating platform branch: ' + GAME_PLATFORM);
  const platformBranch = await prisma.platformBranch.create({
    data: {
      platformId: platform.id,
      addressingModes: await createAddressingModes(),
      instructionSet: await createInstructionSet(),
      vectors: await createSnesVectors(),
    },
  });

  //Create the region
  console.log('Creating region: ' + RELEASE_REGION);
  const region = await prisma.region.create({
    data: {
      name: "US",
      platformId: platform.id,
      meta: { romRegion: RELEASE_REGION },
    },
  });

  const developer = await prisma.developer.create({
    data: {
      name: "Enix",
      platformId: platform.id,
      meta: { romDeveloper: GAME_ROM_DEVELOPER },
    },
  });
  
  // 4. Create the master Game record
  console.log(`Creating Game: ${GAME_TITLE}`);
  const game = await prisma.game.create({
    data: {
      name: GAME_TITLE,
      platformId: platform.id,
      developerId: developer.id,
      meta: {
        romMode: GAME_ROM_MODE,
        romChipset: GAME_ROM_CHIPSET,
        romSize: GAME_ROM_SIZE,
        ramSize: GAME_RAM_SIZE,
      }
    },
  });
  console.log(`Created game with ID: ${game.id}`);

  const { romId, romBranchId } = await createGameRom(game.id, region.id, platformBranch.id);
  const { baseRomId, baseRomBranchId } = await createBaseRom(game.id, romId, romBranchId);

  await createProject(game.id, baseRomId, baseRomBranchId);
  console.log('Seed process finished successfully.');
}

async function createGameRom(gameId: string, regionId: string, platformBranchId: string){
  console.log(`Creating Game ROM: ${RELEASE_ROM_TITLE}`);
  const rom = await prisma.gameRom.create({
    data: {
      gameId: gameId,
      regionId: regionId,
      crc: RELEASE_ROM_CRC,
      meta: {
        romVersion: RELEASE_VERSION,
        romCode: RELEASE_ROM_CODE,
        romTitle: RELEASE_ROM_TITLE,
      }
    },
  });

  //Create the rom branch
  const romBranch = await prisma.gameRomBranch.create({
    data: {
      gameRomId: rom.id,
      platformBranchId: platformBranchId,
      config: {
        sfxLocation: 327680,
        sfxCount: 60,
        compression: 'QuintetLZ',
        entryPoints: [
          { "location": 65508, "name": "native_mode_cop_008007" },
          { "location": 65510, "name": "native_mode_irq_00800F" },
          { "location": 65514, "name": "native_mode_nmi_00800B" },
          { "location": 65518, "name": "native_mode_irq_00800F" },
          { "location": 65532, "name": "emulation_mode_reset_008000" }
        ]
      },
      coplib: await createCopLib(),
      files: await createIogFiles(),
      blocks: await createIogBlocks(),
      fixups: await createIogFixups(),
      types: await createIogTypes(),
    },
  });

  return { romId: rom.id, romBranchId: romBranch.id };
}

async function createBaseRom(gameId: string, romId: string, romBranchId: string){

  console.log('Creating baseRom');
  const baseRom = await prisma.baseRom.create({
    data: {
      name: "GaiaLabs BaseROM",
      gameId: gameId,
      gameRomId: romId
    },
  });

  const asmCrcs = await createBaseRomFiles(baseRom.id, "Assembly", "asm", "asm", [
    "itemcomp_table_01EB0F", "system_strings", "table_17D000", "table_178000", "table_179000"
  ]);

  const graphicsCrcs = await createBaseRomFiles(baseRom.id, "Bitmap", "graphics", "bin", [
    "gfx_boot_exprite", "gfx_boot_logos", "gfx_credits_font", "gfx_fonts", "gfx_inventory_sprites", "gfx_item_exprite", "misc_fx_1CD580"
  ]);

  const paletteCrcs = await createBaseRomFiles(baseRom.id, "Palette", "palettes", "pal", [
    "fx_palette_198000", "pal_boot_logos", "pal_item_exprite", "pal_item_exprite2", "pal_sc02_main_characters"
  ]);
  
  const spritemapCrcs = await createBaseRomFiles(baseRom.id, "Spritemap", "spritemaps", "bin", [
    "spm_boot_logos", "spm_sc02_main_characters", "sprite_1A554C"
  ]);
  
  const patchCrcs = await createBaseRomFiles(baseRom.id, "Patch", "patches", "asm", [
    "AccentMap", "APUWaitFixes", "BitmapPatch", "BootMetaFix", "Cop51Patch", "EquippedIcon", "ExpriteLoader",
    "InventoryCounters", "InventoryManagement", "ItemSwapping", "MenuBGPatch", "MusicTransitions", "NewGamePlus",
    "NGPEpilogueSwitch", "PixelConverter", "RunButton", "SceneLoadPatch", "SFXTable", "SouthCapeDeliveryman",
    "SpritemapPatch", "Teleporter", "TilemapPatch", "TilesetPatch", "Utils"
  ]);

  console.log('Creating baseRomBranch');
  const baseRomBranch = await prisma.baseRomBranch.create({
    data: {
      baseRomId: baseRom.id,
      fileCrcs: [...asmCrcs, ...graphicsCrcs, ...paletteCrcs, ...spritemapCrcs, ...patchCrcs],
      //platformBranchId: platformBranch.id,
      gameRomBranchId: romBranchId,
    },
  });

  return { baseRomId: baseRom.id, baseRomBranchId: baseRomBranch.id };
}

async function createBaseRomFile(baseRomId: string, type: string, folder: string, extension: string, name: string) {
  const data = await loadBinaryData(BR_PATH, path.join(folder, name + '.' + extension));
  const crc = crc32_buffer(data);
  console.log('Creating baseRomFile for ' + name + ' with crc ' + crc);
  await prisma.baseRomFile.create({
    data: {
      baseRomId,
      name,
      type,
      crc,
      data,
    },
  });
  return crc;
}

async function createBaseRomFiles(baseRomId: string, type: string, folder: string, extension: string, names: string[]) {
  console.log('Creating baseRomFiles for ' + type + ' type');
  const fileCrcs: number[] = [];
  for (const name of names) {
    fileCrcs.push(await createBaseRomFile(baseRomId, type, folder, extension, name));
  }
  return fileCrcs;
}

async function createProject(gameId: string, baseRomId: string, baseRomBranchId: string){
  console.log('Creating project');
  const project = await prisma.project.create({
    data: {
      name: "Illusion of Gaia: Retranslated",
      gameId: gameId,
      baseRomId: baseRomId,
    },
  });

  const fileCrcs = await createAllProjectFiles(project.id);
  
  const projectBranch = await prisma.projectBranch.create({
    data: {
      projectId: project.id,
      baseRomBranchId: baseRomBranchId,
      fileCrcs,
      //Things will work without the modules definition, this gives us a place to put module meta in the future
      modules: [
        { name: 'blue-journal' },
        { name: 'crystal-ring-palette' },
        { name: 'enhanced-epilogue-text' },
        { name: 'enhanced-prologue-text' },
        { name: 'freejia-shortcut' },
        { name: 'freejia-slave-return' },
        { name: 'full-health-herb' },
        { name: 'jp-church-cross' },
        { name: 'jp-edward-mountains' },
        { name: 'jp-itory-mountains' },
        { name: 'jp-prologue-palettes' },
        { name: 'jp-viper' },
        { name: 'jp-wall-dunes' },
        { name: 'plain-borders' },
        { name: 'pyramid-elevator-speed' },
        { name: 'pyramid-portal-exit' },
        { name: 'red-fountain' },
        { name: 'south-cape-return' },
        { name: 'thankful-flower' },
        { name: 'title-alternate' },
        { name: 'title-enhanced' },
      ]
    },
  });
}

async function createAllProjectFiles(projectId: string){

  const fileCrcs: number[] = [];

  //base
  fileCrcs.push(await createProjectFile(projectId, "Assembly", "asm", "asm", "scene_actors"));
  fileCrcs.push(await createProjectFile(projectId, "Assembly", "asm", "asm", "templates_01CA95"));
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_fonts"));
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_sky_delivery_exprite"));
  fileCrcs.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_sc01_actors"));
  fileCrcs.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_wa78_actors"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter01"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter02"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter03"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter04"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter05"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter06"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter07"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter08"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter09"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter10"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter11"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter12"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter13"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter14"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter15"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter16"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter17"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter18"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter19"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter20"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter21"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter22"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter23"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter24"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter25"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter26"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter27"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter28"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter29"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter30"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter31"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter32"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter33"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter34"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter35"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter36"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "Credits"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "EnhancedTitle"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "ExpandedOverworldRoutes"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "ExpriteLoader"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "FreejiaDeliveryman"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "ItemStrings"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "OverworldNameSwitch"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "SouthCapeDeliveryman"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "StringProcessing"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "SwitchNameDictionary"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "WatermiaDeliveryman"));
  fileCrcs.push(await createProjectFile(projectId, "Spritemap", "spritemaps", "bin", "spm_fr32_actors"));
  fileCrcs.push(await createProjectFile(projectId, "Spritemap", "spritemaps", "bin", "spm_sc01_actors"));
  fileCrcs.push(await createProjectFile(projectId, "Spritemap", "spritemaps", "bin", "spm_wa78_actors"));

  //blue-journal
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "BlueJournal", "blue-journal"));

  //crystal-ring-palette
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_inventory_sprites", "crystal-ring-palette"));
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_item_exprite", "crystal-ring-palette"));
  fileCrcs.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_item_exprite2", "crystal-ring-palette"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "CrystalRingPalette", "crystal-ring-palette"));
  
  //enhanced-epilogue-text
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "EnhancedEpilogueText", "enhanced-epilogue-text"));

  //enhanced-prologue-text
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_overworld_font", "enhanced-prologue-text"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "EnhancedPrologueText", "enhanced-prologue-text"));

  //freejia-shortcut
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "FreejiaShortcut", "freejia-shortcut"));

  //freejia-slave-return
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "FreejiaSlaveReturn", "freejia-slave-return"));

  //full-health-herb
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "FullHealthHerb", "full-health-herb"));

  //jp-church-cross
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_sc01_ext_effect", "jp-church-cross"));

  //jp-edward-mountains
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_ec0A_tiles", "jp-edward-mountains"));
  fileCrcs.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_ec0A_tiles", "jp-edward-mountains"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "JpEdwardMountains", "jp-edward-mountains"));
  fileCrcs.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_ec0A_effect", "jp-edward-mountains"));
  fileCrcs.push(await createProjectFile(projectId, "Tileset", "tilesets", "set", "set_ec0A_effect", "jp-edward-mountains"));

  //jp-itory-mountains
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_it15_effect", "jp-itory-mountains"));
  fileCrcs.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_it15_tiles", "jp-itory-mountains"));
  fileCrcs.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_it16_int", "jp-itory-mountains"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "JpItoryMountains", "jp-itory-mountains"));
  fileCrcs.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_it15_effect", "jp-itory-mountains"));
  fileCrcs.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_it16_effect", "jp-itory-mountains"));
  fileCrcs.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_it18_effect", "jp-itory-mountains"));
  fileCrcs.push(await createProjectFile(projectId, "Tileset", "tilesets", "set", "set_it15_ext_effect", "jp-itory-mountains"));

  //jp-prologue-palettes
  fileCrcs.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "palette_1E1A35", "jp-prologue-palettes"));
  fileCrcs.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "palette_1E1935", "jp-prologue-palettes"));

  //jp-viper
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_viper", "jp-viper"));
  fileCrcs.push(await createProjectFile(projectId, "Spritemap", "spritemaps", "bin", "spm_viper", "jp-viper"));

  //jp-wall-dunes
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_gw82_tiles", "jp-wall-dunes"));
  fileCrcs.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_gw82_tiles", "jp-wall-dunes"));
  fileCrcs.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_gw82_effect", "jp-wall-dunes"));
  fileCrcs.push(await createProjectFile(projectId, "Tileset", "tilesets", "set", "set_gw82_effect", "jp-wall-dunes"));

  //plain-borders
  fileCrcs.push(await createProjectFile(projectId, "Assembly", "asm", "asm", "templates_01CA95", "plain-borders"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "StringProcessing", "plain-borders"));

  //pyramid-elevator-speed
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "PyramidElevatorSpeed", "pyramid-elevator-speed"));

  //pyramid-portal-exit
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "PyramidPortalExit", "pyramid-portal-exit"));

  //red-fountain
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "RedFountain", "red-fountain"));
  
  //south-cape-return
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "SouthCapeReturn", "south-cape-return"));
    
  //thankful-flower
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "ThankfulFlower", "thankful-flower"));

  //title-alternate
  fileCrcs.push(await createProjectFile(projectId, "Assembly", "asm/thinkers", "asm", "thinker_00BC91", "title-alternate"));
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_title", "title-alternate"));
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_title_actors", "title-alternate"));
  fileCrcs.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_title", "title-alternate"));
  fileCrcs.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_title_actors", "title-alternate"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "EnhancedTitle", "title-alternate"));
  fileCrcs.push(await createProjectFile(projectId, "Spritemap", "spritemaps", "bin", "spm_title_actors", "title-alternate"));
  fileCrcs.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_title_effect", "title-alternate"));
  fileCrcs.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_title_main", "title-alternate"));
  fileCrcs.push(await createProjectFile(projectId, "Tileset", "tilesets", "set", "set_title", "title-alternate"));

  //title-enhanced
  fileCrcs.push(await createProjectFile(projectId, "Assembly", "asm/thinkers", "asm", "thinker_00BC91", "title-enhanced"));
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_title", "title-enhanced"));
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_title_actors", "title-enhanced"));
  fileCrcs.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_title_exprite", "title-enhanced"));
  fileCrcs.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_title", "title-enhanced"));
  fileCrcs.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_title_actors", "title-enhanced"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "EnhancedTitle", "title-enhanced"));
  fileCrcs.push(await createProjectFile(projectId, "Patch", "patches", "asm", "ExpriteLoader", "title-enhanced"));
  fileCrcs.push(await createProjectFile(projectId, "Spritemap", "spritemaps", "bin", "spm_title_actors", "title-enhanced"));
  fileCrcs.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_title_effect", "title-enhanced"));
  fileCrcs.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_title_main", "title-enhanced"));
  fileCrcs.push(await createProjectFile(projectId, "Tileset", "tilesets", "set", "set_title", "title-enhanced"));

  return fileCrcs;
}

async function createProjectFile(projectId: string, type: string, folder: string, extension: string, name: string, module?: string) : Promise<number>{
  const resolvedModule = module ?? 'base';
  const data = await loadBinaryData(RXLT_PATH, path.join(resolvedModule, folder, name + '.' + extension));
  const crc = crc32_buffer(data);
  console.log('Creating project file for ' + name + ' with crc ' + crc);
  await prisma.projectFile.create({
    data: {
      projectId,
      name,
      type,
      crc,
      data,
      module,
    },
  });
  return crc;
}

// async function createProjectFiles(projectId: string, type: string, folder: string, extension: string, names: string[]){
//   console.log('Creating baseRomFiles for ' + type + ' type');
//   const fileCrcs: number[] = [];
//   for (const name of names) {
//     fileCrcs.push(await createProjectFile(projectId, type, folder, extension, name));
//   }
//   return fileCrcs;
// }

async function createAddressingModes() {
  console.log('🔄 Forming addressing modes...');
  
  const addressingData = await loadJsonData<any>(SYS_PATH, 'addressingModes.json');
  
  return addressingData;
}

async function createInstructionSet() {
  console.log('🔄 Forming instruction set...');
  
  const instructionSet = await loadJsonData<OpCode[]>(SYS_PATH, 'opCodes.json');
  const opGroups = {};
  for (const op of instructionSet) {
    if (!opGroups[op.mnem]) {
      opGroups[op.mnem] = {};
    }
    opGroups[op.mnem][op.mode] = op.code;
  }

  return opGroups;
}


async function createInstructionGroups() {
  console.log('🔄 Seeding instruction groups...');
  const result = {};
  
  // List of all instruction group files
  const groupFiles = [
    'load-store.json',
    'arithmetic.json',
    'logical.json',
    'shift.json',
    'control-flow.json',
    'branch.json',
    'system.json',
    'interrupt.json',
    'flags.json',
    'stack.json',
    'transfer.json',
    'block-move.json',
    'special.json'
  ];
  
  for (const filename of groupFiles) {
    const groupName = filename.replace('.json', '').replace('-', '');
    const category = INSTRUCTION_GROUP_CATEGORIES[groupName];
    
    if (!category) {
      console.warn(`⚠️  Unknown category for group: ${groupName}`);
      console.warn(`⚠️  Available categories:`, Object.keys(INSTRUCTION_GROUP_CATEGORIES));
      continue;
    }
    
    try {
      const groupData = await loadJsonData<any>(DATA_DIR, filename);
      
      result[category] = groupData;

      console.log(`✅ Created instruction group: ${groupName}`);
    } catch (error) {
      console.error(`❌ Error processing ${filename}:`, error);
    }
  }
  return result;
}

async function createCopLib() {
  console.log('🔄 Loading COP library...');
  const copLib = await loadJsonData<CopDef[]>(DB_PATH, 'copdef.json');

  const copLookup = copLib.reduce((acc, c) => {
    acc[c.mnem] = { code: c.code, parts: c.parts, halt: c.halt ? true : undefined };
    return acc;
  }, {});

  return copLookup;
}

async function createSnesVectors() {
  console.log('🔄 Seeding SNES vectors...');
  //Get entry points and mnemonics for system addresses
  return {};
}

async function createIogFiles() {
  console.log('🔄 Loading IOG files...');
  const files = await loadJsonData<DbFile[]>(DB_PATH, 'files.json');

  const fileLookup = files.reduce((acc, f) => {
    acc[f.name] = { 
      location: f.start, 
      size: f.end - f.start, 
      type: f.type, 
      compressed: f.compressed, 
      upper: f.upper 
    };
    return acc;
  }, {});

  return fileLookup;
}

async function createIogBlocks() {
  console.log('🔄 Loading IOG blocks...');
  const blocks = await loadJsonData<DbBlock[]>(DB_PATH, 'blocks.json');
  const parts = await loadJsonData<DbPart[]>(DB_PATH, 'parts.json');

  const blockLookup = blocks.reduce((acc, b) => {
    const partLookup = parts.filter((p) => p.block === b.name).reduce((acc, p) => {
      acc[p.name] = { 
        location: p.start, 
        size: p.end - p.start,
        type: p.struct,
        bank: p.bank,
        order: p.order
      };
      return acc;
    }, {});
    acc[b.name] = { 
      group: b.group, 
      movable: b.movable, 
      parts: partLookup, 
      postProcess: b.postProcess 
    };
    return acc;
  }, {});

  return blockLookup;
}

async function createIogTypes() {
  console.log('🔄 Loading IOG types...');
  const structs = await loadJsonData<DbStruct[]>(DB_PATH, 'structs.json');
  const strings = await loadJsonData<DbStringType[]>(DB_PATH, 'stringTypes.json');
  const stringCommands = await loadJsonData<DbStringCommand[]>(DB_PATH, 'stringCommands.json');
  const stringLayers = await loadJsonData<DbStringLayer[]>(DB_PATH, 'stringLayers.json');

  const stringLookup = strings.reduce((acc, s) => {
    const commands = stringCommands.filter((c) => c.set === s.name).reduce((acc, c) => {
      acc[c.value] = { code: c.key, types: c.types, delimiter: c.delimiter, halt: c.halt };
      return acc;
    }, {});
    const layers = stringLayers.filter((l) => l.type === s.name).map((l) => { return { base: l.base, map: l.map } });
    acc[s.name] = { 
      delimiter: s.delimiter, 
      terminator: s.terminator, 
      shiftType: s.shiftType, 
      characterMap: s.characterMap,
      greedyTerminator: s.greedyTerminator,
      commands: commands, 
      layers: layers
    };
    return acc;
  }, {});

  const structLookup = structs.reduce((acc, s) => {
    acc[s.name] = { 
      types: s.types, 
      parent: s.parent, 
      delimiter: s.delimiter, 
      discriminator: s.discriminator 
    };
    return acc;
  }, {});

  return {
    structs: structLookup,
    strings: stringLookup
  };
}

async function createIogFixups() {
  console.log('🔄 Loading IOG fixups...');
  const labels = await loadJsonData<DbLabel[]>(DB_PATH, 'labels.json');
  const rewrites = await loadJsonData<DbRewrite[]>(DB_PATH, 'rewrites.json');
  const overrides = await loadJsonData<DbOverride[]>(DB_PATH, 'overrides.json');
  const transforms = await loadJsonData<DbTransform[]>(DB_PATH, 'transforms.json');
  const mnemonics = await loadJsonData<DbMnemonic[]>(DB_PATH, 'mnemonics_old.json');

  const mnemonicLookup = mnemonics.reduce((acc, m) => {
    acc[m.value] = m.key;
    return acc;
  }, {});

  const transformLookup = transforms.reduce((acc, t) => {
    acc[t.block] = t.transforms.reduce((acc, t) => {
      acc[t.key] = t.value;
      return acc;
    }, {});
    return acc;
  }, {});

  return {
    labels,
    rewrites,
    overrides,
    transforms: transformLookup,
    mnemonics: mnemonicLookup
  };
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