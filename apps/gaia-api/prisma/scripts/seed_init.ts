import pkg from '@prisma/client';
const { PrismaClient } = pkg;
import type { Game } from '@prisma/client';
import * as fs from 'fs';
//import * as path from 'path';
import * as path from 'path';
import { readFileSync } from 'fs';
import type { CopDef, DbBlock, DbConfig, DbFile, DbLabel, DbMnemonic, DbOverride, DbPart, DbRewrite, DbStringCommand, DbStringLayer, DbStringType, DbStruct, DbTransform } from '@gaialabs/shared';
import { crc32_buffer, readFileAsBinary, OpCode, crc32_text_utf8, readFileAsText } from '@gaialabs/shared';
import { createId } from '@paralleldrive/cuid2';

const prisma = new PrismaClient();

// --- Database Path Configuration ---
const DATA_DIR = '../../data/65c816';
const DB_PATH = '../../ext/GaiaLib/db/us';
const BR_PATH = '../../working';
const SYS_PATH = '../../ext/GaiaLib/db/snes';
const RXLT_PATH = 'C:/Work/IOGRXLT/IOGRetranslation/modules';

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

async function loadTextData(rootPath: string, filePath: string): Promise<string> {
  const fullPath = path.resolve(path.join(rootPath, filePath));
  const data = await readFileAsText(fullPath);
  return data;
}


async function main() {
  try {
        
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
      
    await prisma.projectBranchFile.deleteMany({});
    await prisma.projectBranch.deleteMany({});
    await prisma.projectFile.deleteMany({});
    await prisma.project.deleteMany({});
    await prisma.baseRomBranchFile.deleteMany({});
    await prisma.baseRomFile.deleteMany({});
    await prisma.baseRomBranch.deleteMany({});
    await prisma.baseRom.deleteMany({});
    await prisma.gameRomBranchArtifact.deleteMany({});
    await prisma.gameRomBranch.deleteMany({});
    await prisma.gameRomArtifact.deleteMany({});
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
        name: '1.0',
        version: 1,
        isActive: true,
        notes: [],
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
  } finally {
    await prisma.$disconnect();
  }
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
      name: '1.0',
      version: 1,
      isActive: true,
      notes: [],
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
      structs: await createIogStructs(),
      strings: await createIogStrings(),
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

  const asmIds = await createBaseRomFiles(baseRom.id, "Assembly", "asm", "asm", [
    "itemcomp_table_01EB0F", "system_strings", "table_17D000", "table_178000", "table_179000"
  ]);

  const graphicsIds = await createBaseRomFiles(baseRom.id, "Bitmap", "graphics", "bin", [
    "gfx_boot_exprite", "gfx_boot_logos", "gfx_credits_font", "gfx_fonts", "gfx_inventory_sprites", "gfx_item_exprite", "misc_fx_1CD580"
  ]);

  const paletteIds = await createBaseRomFiles(baseRom.id, "Palette", "palettes", "pal", [
    "fx_palette_198000", "pal_boot_logos", "pal_item_exprite", "pal_item_exprite2", "pal_sc02_main_characters"
  ]);
  
  const spritemapIds = await createBaseRomFiles(baseRom.id, "Spritemap", "spritemaps", "bin", [
    "spm_boot_logos", "spm_sc02_main_characters", "sprite_1A554C"
  ]);
  
  const patchIds = await createBaseRomFiles(baseRom.id, "Patch", "patches", "asm", [
    "AccentMap", "APUWaitFixes", "BitmapPatch", "BootMetaFix", "Cop51Patch", "EquippedIcon", "ExpriteLoader",
    "InventoryCounters", "InventoryManagement", "ItemSwapping", "MenuBGPatch", "MusicTransitions", "NewGamePlus",
    "NGPEpilogueSwitch", "PixelConverter", "RunButton", "SceneLoadPatch", "SFXTable", "SouthCapeDeliveryman",
    "SpritemapPatch", "Teleporter", "TilemapPatch", "TilesetPatch", "Utils"
  ]);

  console.log('Creating baseRomBranch');
  const baseRomBranchId = createId();
  const baseRomBranch = await prisma.baseRomBranch.create({
    data: {
      id: baseRomBranchId,
      baseRomId: baseRom.id,
      gameRomBranchId: romBranchId,
      name: '2.0',
      version: 1,
      isActive: true,
      notes: [],
    },
  });

  await prisma.baseRomBranchFile.createMany({
    data: [...asmIds, ...graphicsIds, ...paletteIds, ...spritemapIds, ...patchIds].map(fileId => ({
      id: createId(),
      branchId: baseRomBranchId,
      fileId: fileId
    }))
  });

  return { baseRomId: baseRom.id, baseRomBranchId: baseRomBranch.id };
}

async function createBaseRomFile(baseRomId: string, type: string, folder: string, extension: string, name: string) {

  const filePath = path.resolve(path.join(BR_PATH, folder, name + '.' + extension));
  let crc: number | undefined;
  let text: string | undefined;
  let data: Uint8Array | undefined;
  let isText: boolean = false;
  if(type === 'Assembly' || type === 'Patch') {
    text = await readFileAsText(filePath);
    crc = crc32_text_utf8(text);
    isText = true;
  } else {
    data = await readFileAsBinary(filePath);
    crc = crc32_buffer(data);
  }

  console.log('Creating baseRomFile for ' + name + ' with crc ' + crc);
  const id = createId();
  await prisma.baseRomFile.create({
    data: {
      id,
      baseRomId,
      name,
      type,
      crc,
      data,
      text,
      isText
    },
  });

  return id;
}

async function createBaseRomFiles(baseRomId: string, type: string, folder: string, extension: string, names: string[]) {
  console.log('Creating baseRomFiles for ' + type + ' type');
  const fileIds: string[] = [];
  for (const name of names) {
    fileIds.push(await createBaseRomFile(baseRomId, type, folder, extension, name));
  }
  return fileIds;
}

async function createProject(gameId: string, baseRomId: string, baseRomBranchId: string){
  console.log('Creating project');
  const project = await prisma.project.create({
    data: {
      name: "Illusion of Gaia: Retranslated",
      gameId: gameId,
      baseRomId: baseRomId,
      meta: {
        currentVersion: "1.41"
      },
    },
  });

  // Create project branch
  const projectBranchId = createId();
  const projectBranch = await prisma.projectBranch.create({
    data: {
      id: projectBranchId,
      projectId: project.id,
      baseRomBranchId: baseRomBranchId,
      name: '1.41',
      version: 1,
      isActive: true,
      notes: [
        'Removed URL from boot logo',
        'Changed credits URL to QR code',
        'Added: Option for floating (unboxed) text during ending comet scene',
        'Added: Jackal / Black Panther name changes depending on language setting',
        'Added: Option for changing church statue to cross (JP content)',
        'Added: Support for Portuguese letter accents',
        'Added: Option for plain borders',
        'Fixed: Laborers in chapel now display properly',
        'Fixed: New game plus menu option now highlights properly',
        'Fixed: Equipped icon and HUD should now be hidden during plane scenes',
        'Fixed: Freedan\'s Special abilities no longer corrupt the equipped icon palette',
        'Fixed: Queen\'s crown correctly shows on gold ship',
        'Many community script changes',
      ],
      modules: [
        { name: '🎨 Title Screen', groups: [
          { name: null, options: [
            { name: 'NA Original', module: null, description: 'The original North American title screen' },
            { name: 'Enhanced', module: 'title-enhanced', description: 'Enhanced NA title screen with JP comet background', default: true },
            { name: 'Hybrid', module: 'title-alternate', description: 'Hybrid JP title screen with NA title text' }
          ] }
        ] },
        { name: '🏯 JP Content', groups: [
          { name: 'Edward Castle Background', options: [
            { name: 'NA', module: null },
            { name: 'JP', module: 'jp-edward-mountains', default: true },
          ] },
          { name: 'Itory Background', options: [
            { name: 'NA', module: null },
            { name: 'JP', module: 'jp-itory-mountains', default: true },
          ] },
          { name: 'Great Wall Background', options: [
            { name: 'NA', module: null },
            { name: 'JP', module: 'jp-wall-dunes', default: true },
          ] },
          { name: 'Fountain Color', options: [
            { name: 'NA (Brown)', module: null },
            { name: 'JP (Red)', module: 'red-fountain', default: true },
          ] },
          { name: 'Viper Boss', options: [
            { name: 'NA', module: null, default: true },
            { name: 'JP', module: 'jp-viper' },
          ] },
          { name: 'Church Cross/Statue', options: [
            { name: 'NA (Statue)', module: null },
            { name: 'JP (Cross)', module: 'jp-church-cross', default: true },
          ] }
        ] },
        { name: '⚡ Quality of Life', groups: [
          { name: 'Prologue / Overworld Text', options: [
            { name: 'Enhanced', module: 'enhanced-prologue-text', default: true },
          ] },
          { name: 'Epilogue Text (Comet scene)', options: [
            { name: 'Original (Boxed)', module: null },
            { name: 'No dialog box/borders', module: 'enhanced-epilogue-text', default: true },
          ] },
          { name: 'Herb Heals', options: [
            { name: '+8 HP', module: null },
            { name: 'Full HP', module: 'full-health-herb', default: true },
          ] },
          { name: 'Pyramid Elevator Speed', options: [
            { name: '1x', module: null },
            { name: '2x', module: 'pyramid-elevator-speed', default: true },
          ] },
          { name: 'Pyramid Portal Exit', options: [
            { name: 'Original', module: null },
            { name: 'Altered', module: 'pyramid-portal-exit', description: 'Portals will take you to the lower main area. Lower portal brings you to the top.', default: true },
          ] },
          { name: 'Shortcut from Mines to Freejia', options: [
            { name: 'No', module: null },
            { name: 'Yes', module: 'freejia-shortcut', description: 'Sam will offer to take you to Freejia, skipping the return trip.', default: true },
          ] },
        ] },
        { name: '📚 Cut Content', groups: [
          { name: 'Sky Delivery Man', options: [
            { name: 'Enable', module: null, description: 'The Sky Deliveryman will appear in Watermia, South Cape, and Freejia.', default: true },
          ] },
          { name: 'Blue Journal', options: [
            { name: 'Disable', module: null },
            { name: 'Enable', module: 'blue-journal', default: true },
          ] },
        ] },
        { name: '✨ Extras', groups: [
          { name: 'Thankful Flower', options: [
            { name: 'Disable', module: null },
            { name: 'Enable', module: 'thankful-flower', default: true },
          ] },
          { name: 'South Cape Return', options: [
            { name: 'Disable', module: null },
            { name: 'Enable', module: 'south-cape-return', default: true },
          ] },
          { name: 'Crystal Ring Palette', options: [
            { name: 'Original', module: null },
            { name: 'New', module: 'crystal-ring-palette', default: true },
          ] },
          { name: 'Border Graphics', options: [
            { name: 'Enhanced', module: null, default: true },
            { name: 'Plain', module: 'plain-borders' },
          ] },
        ] }
      ]
    },
  });

  // Create project files
  const fileIds = await createAllProjectFiles(project.id);

  // Create project branch files
  await prisma.projectBranchFile.createMany({
    data: fileIds.map(fileId => ({
      id: createId(),
      branchId: projectBranchId,
      fileId: fileId
    }))
  });
}

async function createAllProjectFiles(projectId: string){

  const fileIds: string[] = [];

  //base
  fileIds.push(await createProjectFile(projectId, "Assembly", "asm", "asm", "scene_actors"));
  fileIds.push(await createProjectFile(projectId, "Assembly", "asm", "asm", "templates_01CA95"));
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_fonts"));
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_sky_delivery_exprite"));
  fileIds.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_sc01_actors"));
  fileIds.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_wa78_actors"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter01"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter02"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter03"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter04"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter05"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter06"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter07"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter08"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter09"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter10"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter11"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter12"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter13"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter14"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter15"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter16"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter17"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter18"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter19"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter20"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter21"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter22"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter23"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter24"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter25"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter26"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter27"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter28"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter29"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter30"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter31"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter32"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter33"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter34"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter35"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "chapter36"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "Credits"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "EnhancedTitle"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "ExpandedOverworldRoutes"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "ExpriteLoader"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "FreejiaDeliveryman"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "ItemStrings"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "OverworldNameSwitch"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "SouthCapeDeliveryman"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "StringProcessing"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "SwitchNameDictionary"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "WatermiaDeliveryman"));
  fileIds.push(await createProjectFile(projectId, "Spritemap", "spritemaps", "bin", "spm_fr32_actors"));
  fileIds.push(await createProjectFile(projectId, "Spritemap", "spritemaps", "bin", "spm_sc01_actors"));
  fileIds.push(await createProjectFile(projectId, "Spritemap", "spritemaps", "bin", "spm_wa78_actors"));

  //blue-journal
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "BlueJournal", "blue-journal"));

  //crystal-ring-palette
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_inventory_sprites", "crystal-ring-palette"));
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_item_exprite", "crystal-ring-palette"));
  fileIds.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_item_exprite2", "crystal-ring-palette"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "CrystalRingPalette", "crystal-ring-palette"));
  
  //enhanced-epilogue-text
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "EnhancedEpilogueText", "enhanced-epilogue-text"));

  //enhanced-prologue-text
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_overworld_font", "enhanced-prologue-text"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "EnhancedPrologueText", "enhanced-prologue-text"));

  //freejia-shortcut
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "FreejiaShortcut", "freejia-shortcut"));

  //freejia-slave-return
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "FreejiaSlaveReturn", "freejia-slave-return"));

  //full-health-herb
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "FullHealthHerb", "full-health-herb"));

  //jp-church-cross
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_sc01_ext_effect", "jp-church-cross"));

  //jp-edward-mountains
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_ec0A_tiles", "jp-edward-mountains"));
  fileIds.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_ec0A_tiles", "jp-edward-mountains"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "JpEdwardMountains", "jp-edward-mountains"));
  fileIds.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_ec0A_effect", "jp-edward-mountains"));
  fileIds.push(await createProjectFile(projectId, "Tileset", "tilesets", "set", "set_ec0A_effect", "jp-edward-mountains"));

  //jp-itory-mountains
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_it15_effect", "jp-itory-mountains"));
  fileIds.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_it15_tiles", "jp-itory-mountains"));
  fileIds.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_it16_int", "jp-itory-mountains"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "JpItoryMountains", "jp-itory-mountains"));
  fileIds.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_it15_effect", "jp-itory-mountains"));
  fileIds.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_it16_effect", "jp-itory-mountains"));
  fileIds.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_it18_effect", "jp-itory-mountains"));
  fileIds.push(await createProjectFile(projectId, "Tileset", "tilesets", "set", "set_it15_ext_effect", "jp-itory-mountains"));

  //jp-prologue-palettes
  fileIds.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "palette_1E1A35", "jp-prologue-palettes"));
  fileIds.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "palette_1E1935", "jp-prologue-palettes"));

  //jp-viper
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_viper", "jp-viper"));
  fileIds.push(await createProjectFile(projectId, "Spritemap", "spritemaps", "bin", "spm_viper", "jp-viper"));

  //jp-wall-dunes
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_gw82_tiles", "jp-wall-dunes"));
  fileIds.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_gw82_tiles", "jp-wall-dunes"));
  fileIds.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_gw82_effect", "jp-wall-dunes"));
  fileIds.push(await createProjectFile(projectId, "Tileset", "tilesets", "set", "set_gw82_effect", "jp-wall-dunes"));

  //plain-borders
  fileIds.push(await createProjectFile(projectId, "Assembly", "asm", "asm", "templates_01CA95", "plain-borders"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "StringProcessing", "plain-borders"));

  //pyramid-elevator-speed
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "PyramidElevatorSpeed", "pyramid-elevator-speed"));

  //pyramid-portal-exit
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "PyramidPortalExit", "pyramid-portal-exit"));

  //red-fountain
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "RedFountain", "red-fountain"));
  
  //south-cape-return
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "SouthCapeReturn", "south-cape-return"));
    
  //thankful-flower
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "ThankfulFlower", "thankful-flower"));

  //title-alternate
  fileIds.push(await createProjectFile(projectId, "Assembly", "asm/thinkers", "asm", "thinker_00BC91", "title-alternate"));
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_title", "title-alternate"));
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_title_actors", "title-alternate"));
  fileIds.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_title", "title-alternate"));
  fileIds.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_title_actors", "title-alternate"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "EnhancedTitle", "title-alternate"));
  fileIds.push(await createProjectFile(projectId, "Spritemap", "spritemaps", "bin", "spm_title_actors", "title-alternate"));
  fileIds.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_title_effect", "title-alternate"));
  fileIds.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_title_main", "title-alternate"));
  fileIds.push(await createProjectFile(projectId, "Tileset", "tilesets", "set", "set_title", "title-alternate"));

  //title-enhanced
  fileIds.push(await createProjectFile(projectId, "Assembly", "asm/thinkers", "asm", "thinker_00BC91", "title-enhanced"));
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_title", "title-enhanced"));
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_title_actors", "title-enhanced"));
  fileIds.push(await createProjectFile(projectId, "Bitmap", "graphics", "bin", "gfx_title_exprite", "title-enhanced"));
  fileIds.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_title", "title-enhanced"));
  fileIds.push(await createProjectFile(projectId, "Palette", "palettes", "pal", "pal_title_actors", "title-enhanced"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "EnhancedTitle", "title-enhanced"));
  fileIds.push(await createProjectFile(projectId, "Patch", "patches", "asm", "ExpriteLoader", "title-enhanced"));
  fileIds.push(await createProjectFile(projectId, "Spritemap", "spritemaps", "bin", "spm_title_actors", "title-enhanced"));
  fileIds.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_title_effect", "title-enhanced"));
  fileIds.push(await createProjectFile(projectId, "Tilemap", "tilemaps", "map", "map_title_main", "title-enhanced"));
  fileIds.push(await createProjectFile(projectId, "Tileset", "tilesets", "set", "set_title", "title-enhanced"));

  return fileIds;
}

async function createProjectFile(projectId: string, type: string, folder: string, extension: string, name: string, module?: string) : Promise<string>{
  const resolvedModule = module ?? 'base';
  const filePath = path.resolve(path.join(RXLT_PATH, resolvedModule, folder, name + '.' + extension));
  let crc: number | undefined;
  let text: string | undefined;
  let data: Uint8Array | undefined;
  let isText: boolean = false;
  if(type === 'Assembly' || type === 'Patch') {
    text = await readFileAsText(filePath);
    crc = crc32_text_utf8(text);
    isText = true;
  } else {
    data = await readFileAsBinary(filePath);
    crc = crc32_buffer(data);
  }

  console.log('Creating project file for ' + name + ' with crc ' + crc);
  const id = createId();
  await prisma.projectFile.create({
    data: {
      id,
      projectId,
      name,
      type,
      crc,
      data,
      isText,
      text,
      module,
    },
  });
  return id;
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

async function createIogStructs() {
  console.log('🔄 Loading IOG structs...');
  const structs = await loadJsonData<DbStruct[]>(DB_PATH, 'structs.json');
  return structs.reduce((acc, s) => {
    acc[s.name] = { 
      types: s.types, 
      parent: s.parent, 
      delimiter: s.delimiter, 
      discriminator: s.discriminator 
    };
    return acc;
  }, {});
}

async function createIogStrings() {
  console.log('🔄 Loading IOG strings...');
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


  return stringLookup;
}

async function createIogFixups() : Promise<{}> {
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

// main()
//   .catch((e) => {
//     console.error('An error occurred during the seed process:');
//     console.error(e);
//     process.exit(1);
//   })
//   .finally(async () => {
//     await prisma.$disconnect();
//   }); 

export default main;