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

  // 5. Create the Release record
  console.log(`Creating Game ROM: ${RELEASE_ROM_TITLE}`);
  const rom = await prisma.gameRom.create({
    data: {
      gameId: game.id,
      regionId: region.id,
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
      platformBranchId: platformBranch.id,
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

  console.log('Creating baseRom');
  const baseRom = await prisma.baseRom.create({
    data: {
      name: "GaiaLabs BaseROM",
      gameId: game.id,
      gameRomId: rom.id
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
      gameRomBranchId: romBranch.id,
    },
  });

  console.log('Seed process finished successfully.');
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