import pkg from '@prisma/client';
const { PrismaClient } = pkg;
import { crc32_buffer, crc32_text_utf8, readFileAsBinary, readFileAsText } from '@gaialabs/shared';
import { parseSceneMetaFile } from './convert_scene_meta.ts';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { createId } from '@paralleldrive/cuid2';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const prisma = new PrismaClient();

// --- Database Path Configuration ---
const ASM_PATH = path.join(__dirname, '../../../../truth/asm');
const RXLT_PATH = 'C:/Work/IOGRXLT/IOGRetranslation/modules';

async function createProjectFile(projectId: string, type: string, folder: string, extension: string, name: string, module?: string): Promise<string> {
  const resolvedModule = module ?? 'base';

  const filePath = path.resolve(path.join(RXLT_PATH, resolvedModule, folder ?? '', name + '.' + extension));
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
      module,
      isText,
      text,
    },
  });

  return id;
}

async function createGameRomArtifacts(gameRomBranch: any) {
  const blocks = gameRomBranch.blocks as any;
  const blockAssets: any[] = [];

  await Promise.all(Object.keys(blocks).map(async (name) => {
    const block = blocks[name];
    const rootPath = block.group ? path.join(ASM_PATH, block.group) : ASM_PATH;
    try{
      const text = await readFileAsText(path.resolve(path.join(rootPath, name + '.asm')));
      blockAssets.push({
        id: createId(),
        name,
        type: 'Assembly',
        gameRomId: gameRomBranch.gameRomId,
        text
      });
    } catch (error) {
      console.error(`Error loading block ${name}: ${error}`);
    }
  }));

  await prisma.gameRomArtifact.createMany({
    data: blockAssets
  });

  await prisma.gameRomBranchArtifact.createMany({
    data: blockAssets.map((asset) => ({
      branchId: gameRomBranch.id,
      artifactId: asset.id
    }))
  });

  console.log(`Created ${blockAssets.length} block artifacts`);
}

async function main() {
  console.log('Starting seed_143 migration process...');

  try {
    // Step 1: Query for the current active version
    console.log('🔍 Finding current active project version...');
    const currentBranch = await prisma.gameRomBranch.findFirst({
      where: {
        gameRom: {
          game: {
            name: "Illusion of Gaia"
          }
        },
        name: '1.0'
        //isActive: true
      },
      include: {
        gameRom: true
      }
    });

    if (!currentBranch) {
      throw new Error('Could not find active GameROM branch for "Illusion of Gaia"');
    }

    const inputPath = path.join(__dirname, '../../../../truth/asm/scene_meta.asm');
    const sceneData = parseSceneMetaFile(inputPath);

    console.log(`✅ Found current active version: ${currentBranch.name} (version ${currentBranch.version})`);

    console.log('🔄 Updating current branch...');
    await prisma.gameRomBranch.update({
      where: {
        id: currentBranch.id
      },
      data: {
        scenes: sceneData
      }
    });

    await createGameRomArtifacts(currentBranch);

    await prisma.platformBranch.update({
      where: {
        id: currentBranch.platformBranchId
      },
      data: {
        types: {
            'Byte': {
                'size': 1,
                'isPrimitive': true,
                'description': 'An 8-bit unsigned integer.'
            },
            'Word': {
                'size': 2,
                'isPrimitive': true,
                'description': 'A 16-bit unsigned integer.'
            },
            'Offset': {
                'size': 2,
                'isPrimitive': true,
                'isPointer': true,
                'pointerChar': '&',
                'description': 'A 16-bit unsigned integer used to represent an offset in memory. Bank is implied'
            },
            'Address': {
                'size': 3,
                'isPrimitive': true,
                'isPointer': true,
                'pointerChar': '@',
                'description': 'A 24-bit unsigned integer used to represent an address in memory or a file.'
            },
            'Bank': {
                'size': 1,
                'isPointer': true,
                'isBank': true,
                'pointerChar': '^',
                'description': 'A 8-bit unsigned integer used to represent a bank in memory.'
            },
            'WBank': {
                'size': 2,
                'isPointer': true,
                'isBank': true,
                'pointerChar': '*',
                'description': 'A 16-bit unsigned integer used to represent a bank in memory.'
            },
            'Binary': {
                'isPrimitive': true,
                'isData': true,
                'description': 'A binary string.'
            },
            'Code': {
                'isPrimitive': true,
                'isCode': true,
                'description': 'Assembly code'
            },
            'Relative': {
                'size': 1,
                'isPointer': true,
                'isRelative': true,
                'isSigned': true,
                'pointerChar': '%',
                'description': 'A 8-bit signed integer used to represent a relative offset in memory.'
            }
        },
        vectors: {
          'INIDISP': { id: 8448, meta: 'https://snes.nesdev.org/wiki/PPU_registers#INIDISP' },
          'OBJSEL': { id: 8449, meta: 'https://snes.nesdev.org/wiki/PPU_registers#OBJSEL' },
          'OAMADDL': { id: 8450, meta: 'https://snes.nesdev.org/wiki/PPU_registers#OAMADD' },
          'OAMADDH': { id: 8451, meta: 'https://snes.nesdev.org/wiki/PPU_registers#OAMADD' },
          'OAMDATA': { id: 8452, meta: 'https://snes.nesdev.org/wiki/PPU_registers#OAMDATA' },
          'BGMODE': { id: 8453, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BGMODE' },
          'MOSAIC': { id: 8454, meta: 'https://snes.nesdev.org/wiki/PPU_registers#MOSAIC' },
          'BG1SC': { id: 8455, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BGnSC' },
          'BG2SC': { id: 8456, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BGnSC' },
          'BG3SC': { id: 8457, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BGnSC' },
          'BG4SC': { id: 8458, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BGnSC' },
          'BG12NBA': { id: 8459, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BG12NBA' },
          'BG34NBA': { id: 8460, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BG34NBA' },
          'BG1HOFS': { id: 8461, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BGnHOFS' },
          'BG1VOFS': { id: 8462, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BGnVOFS' },
          'BG2HOFS': { id: 8463, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BGnHOFS' },
          'BG2VOFS': { id: 8464, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BGnVOFS' },
          'BG3HOFS': { id: 8465, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BGnHOFS' },
          'BG3VOFS': { id: 8466, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BGnVOFS' },
          'BG4HOFS': { id: 8467, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BGnHOFS' },
          'BG4VOFS': { id: 8468, meta: 'https://snes.nesdev.org/wiki/PPU_registers#BGnVOFS' },
          'VMAIN': { id: 8469, meta: 'https://snes.nesdev.org/wiki/PPU_registers#VMAIN' },
          'VMADDL': { id: 8470, meta: 'https://snes.nesdev.org/wiki/PPU_registers#VMADD' },
          'VMADDH': { id: 8471, meta: 'https://snes.nesdev.org/wiki/PPU_registers#VMADD' },
          'VMDATAL': { id: 8472, meta: 'https://snes.nesdev.org/wiki/PPU_registers#VMDATA' },
          'VMDATAH': { id: 8473, meta: 'https://snes.nesdev.org/wiki/PPU_registers#VMDATA' },
          'M7SEL': { id: 8474, meta: 'https://snes.nesdev.org/wiki/PPU_registers#M7SEL' },
          'M7A': { id: 8475, meta: 'https://snes.nesdev.org/wiki/PPU_registers#M7A' },
          'M7B': { id: 8476, meta: 'https://snes.nesdev.org/wiki/PPU_registers#M7B' },
          'M7C': { id: 8477, meta: 'https://snes.nesdev.org/wiki/PPU_registers#M7n' },
          'M7D': { id: 8478, meta: 'https://snes.nesdev.org/wiki/PPU_registers#M7n' },
          'M7X': { id: 8479, meta: 'https://snes.nesdev.org/wiki/PPU_registers#M7X' },
          'M7Y': { id: 8480, meta: 'https://snes.nesdev.org/wiki/PPU_registers#M7Y' },
          'CGADD': { id: 8481, meta: 'https://snes.nesdev.org/wiki/PPU_registers#CGADD' },
          'CGDATA': { id: 8482, meta: 'https://snes.nesdev.org/wiki/PPU_registers#CGDATA' },
          'W12SEL': { id: 8483, meta: 'https://snes.nesdev.org/wiki/PPU_registers#W12SEL' },
          'W34SEL': { id: 8484, meta: 'https://snes.nesdev.org/wiki/PPU_registers#W34SEL' },
          'WOBJSEL': { id: 8485, meta: 'https://snes.nesdev.org/wiki/PPU_registers#WOBJSEL' },
          'WH0': { id: 8486, meta: 'https://snes.nesdev.org/wiki/PPU_registers#WH0' },
          'WH1': { id: 8487, meta: 'https://snes.nesdev.org/wiki/PPU_registers#WH1' },
          'WH2': { id: 8488, meta: 'https://snes.nesdev.org/wiki/PPU_registers#WH2' },
          'WH3': { id: 8489, meta: 'https://snes.nesdev.org/wiki/PPU_registers#WH3' },
          'WBGLOG': { id: 8490, meta: 'https://snes.nesdev.org/wiki/PPU_registers#WBGLOG' },
          'WOBJLOG': { id: 8491, meta: 'https://snes.nesdev.org/wiki/PPU_registers#WOBJLOG' },
          'TM': { id: 8492, meta: 'https://snes.nesdev.org/wiki/PPU_registers#TM' },
          'TS': { id: 8493, meta: 'https://snes.nesdev.org/wiki/PPU_registers#TS' },
          'TMW': { id: 8494, meta: 'https://snes.nesdev.org/wiki/PPU_registers#TMW' },
          'TSW': { id: 8495, meta: 'https://snes.nesdev.org/wiki/PPU_registers#TSW' },
          'CGWSEL': { id: 8496, meta: 'https://snes.nesdev.org/wiki/PPU_registers#CGWSEL' },
          'CGADSUB': { id: 8497, meta: 'https://snes.nesdev.org/wiki/PPU_registers#CGADSUB' },
          'COLDATA': { id: 8498, meta: 'https://snes.nesdev.org/wiki/PPU_registers#COLDATA' },
          'SETINI': { id: 8499, meta: 'https://snes.nesdev.org/wiki/PPU_registers#SETINI' },
          'MPYL': { id: 8500, meta: 'https://snes.nesdev.org/wiki/PPU_registers#MPY' },
          'MPYM': { id: 8501, meta: 'https://snes.nesdev.org/wiki/PPU_registers#MPY' },
          'MPYH': { id: 8502, meta: 'https://snes.nesdev.org/wiki/PPU_registers#MPY' },
          'SLHV': { id: 8503, meta: 'https://snes.nesdev.org/wiki/PPU_registers#SLHV' },
          'OAMDATAREAD': { id: 8504, meta: 'https://snes.nesdev.org/wiki/PPU_registers#OAMDATAREAD' },
          'VMDATALREAD': { id: 8505, meta: 'https://snes.nesdev.org/wiki/PPU_registers#VMDATAREAD' },
          'VMDATAHREAD': { id: 8506, meta: 'https://snes.nesdev.org/wiki/PPU_registers#VMDATAREAD' },
          'CGDATAREAD': { id: 8507, meta: 'https://snes.nesdev.org/wiki/PPU_registers#CGDATAREAD' },
          'OPHCT': { id: 8508, meta: 'https://snes.nesdev.org/wiki/PPU_registers#OPHCT' },
          'OPVCT': { id: 8509, meta: 'https://snes.nesdev.org/wiki/PPU_registers#OPVCT' },
          'STAT77': { id: 8510, meta: 'https://snes.nesdev.org/wiki/PPU_registers#STAT77' },
          'STAT78': { id: 8511, meta: 'https://snes.nesdev.org/wiki/PPU_registers#STAT78' },
          'APUIO0': { id: 8512, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#APUIOn' },
          'APUIO1': { id: 8513, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#APUIOn' },
          'APUIO2': { id: 8514, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#APUIOn' },
          'APUIO3': { id: 8515, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#APUIOn' },
          'WMDATA': { id: 8576, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#WMDATA' },
          'WMADDL': { id: 8577, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#WMADD' },
          'WMADDM': { id: 8578, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#WMADD' },
          'WMADDH': { id: 8579, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#WMADD' },
          'JOYSER0': { id: 16406, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#JOYSER0' },
          'JOYSER1': { id: 16407, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#JOYSER1' },
          'NMITIMEN': { id: 16896, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#NMITIMEN' },
          'WRIO': { id: 16897, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#WRIO' },
          'WRMPYA': { id: 16898, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#WRMPYA' },
          'WRMPYB': { id: 16899, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#WRMPYB' },
          'WRDIVL': { id: 16900, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#WRDIV' },
          'WRDIVH': { id: 16901, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#WRDIV' },
          'WRDIVB': { id: 16902, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#WRDIVB' },
          'HTIMEL': { id: 16903, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#HTIME' },
          'HTIMEH': { id: 16904, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#HTIME' },
          'VTIMEL': { id: 16905, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#VTIME' },
          'VTIMEH': { id: 16906, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#VTIME' },
          'MDMAEN': { id: 16907, meta: 'https://snes.nesdev.org/wiki/DMA_registers#MDMAEN' },
          'HDMAEN': { id: 16908, meta: 'https://snes.nesdev.org/wiki/DMA_registers#HDMAEN' },
          'MEMSEL': { id: 16909, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#MEMSEL' },
          'RDNMI': { id: 16912, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#RDNMI' },
          'TIMEUP': { id: 16913, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#TIMEUP' },
          'HVBJOY': { id: 16914, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#HVBJOY' },
          'RDIO': { id: 16915, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#RDIO' },
          'RDDIVL': { id: 16916, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#RDDIV' },
          'RDDIVH': { id: 16917, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#RDDIV' },
          'RDMPYL': { id: 16918, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#RDMPY' },
          'RDMPYH': { id: 16919, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#RDMPY' },
          'JOY1L': { id: 16920, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#JOY1' },
          'JOY1H': { id: 16921, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#JOY1' },
          'JOY2L': { id: 16922, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#JOY2' },
          'JOY2H': { id: 16923, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#JOY2' },
          'JOY3L': { id: 16924, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#JOY3' },
          'JOY3H': { id: 16925, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#JOY3' },
          'JOY4L': { id: 16926, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#JOY4' },
          'JOY4H': { id: 16927, meta: 'https://snes.nesdev.org/wiki/MMIO_registers#JOY4' },
          'DMAP0': { id: 17152, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DMAPn' },
          'BBAD0': { id: 17153, meta: 'https://snes.nesdev.org/wiki/DMA_registers#BBADn' },
          'A1T0L': { id: 17154, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnL' },
          'A1T0H': { id: 17155, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnH' },
          'A1B0': { id: 17156, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1Bn' },
          'DAS0L': { id: 17157, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnL' },
          'DAS0H': { id: 17158, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnH' },
          'DASB0': { id: 17159, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASBn' },
          'A2A0L': { id: 17160, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnL' },
          'A2A0H': { id: 17161, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnH' },
          'NLTR0': { id: 17162, meta: 'https://snes.nesdev.org/wiki/DMA_registers#NLTRn' },
          'DMAP1': { id: 17168, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DMAPn' },
          'BBAD1': { id: 17169, meta: 'https://snes.nesdev.org/wiki/DMA_registers#BBADn' },
          'A1T1L': { id: 17170, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnL' },
          'A1T1H': { id: 17171, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnH' },
          'A1B1': { id: 17172, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1Bn' },
          'DAS1L': { id: 17173, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnL' },
          'DAS1H': { id: 17174, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnH' },
          'DASB1': { id: 17175, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASBn' },
          'A2A1L': { id: 17176, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnL' },
          'A2A1H': { id: 17177, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnH' },
          'NLTR1': { id: 17178, meta: 'https://snes.nesdev.org/wiki/DMA_registers#NLTRn' },
          'DMAP2': { id: 17184, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DMAPn' },
          'BBAD2': { id: 17185, meta: 'https://snes.nesdev.org/wiki/DMA_registers#BBADn' },
          'A1T2L': { id: 17186, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnL' },
          'A1T2H': { id: 17187, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnH' },
          'A1B2': { id: 17188, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1Bn' },
          'DAS2L': { id: 17189, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnL' },
          'DAS2H': { id: 17190, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnH' },
          'DASB2': { id: 17191, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASBn' },
          'A2A2L': { id: 17192, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnL' },
          'A2A2H': { id: 17193, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnH' },
          'NLTR2': { id: 17194, meta: 'https://snes.nesdev.org/wiki/DMA_registers#NLTRn' },
          'DMAP3': { id: 17200, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DMAPn' },
          'BBAD3': { id: 17201, meta: 'https://snes.nesdev.org/wiki/DMA_registers#BBADn' },
          'A1T3L': { id: 17202, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnL' },
          'A1T3H': { id: 17203, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnH' },
          'A1B3': { id: 17204, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1Bn' },
          'DAS3L': { id: 17205, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnL' },
          'DAS3H': { id: 17206, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnH' },
          'DASB3': { id: 17207, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASBn' },
          'A2A3L': { id: 17208, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnL' },
          'A2A3H': { id: 17209, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnH' },
          'NLTR3': { id: 17210, meta: 'https://snes.nesdev.org/wiki/DMA_registers#NLTRn' },
          'DMAP4': { id: 17216, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DMAPn' },
          'BBAD4': { id: 17217, meta: 'https://snes.nesdev.org/wiki/DMA_registers#BBADn' },
          'A1T4L': { id: 17218, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnL' },
          'A1T4H': { id: 17219, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnH' },
          'A1B4': { id: 17220, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1Bn' },
          'DAS4L': { id: 17221, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnL' },
          'DAS4H': { id: 17222, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnH' },
          'DASB4': { id: 17223, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASBn' },
          'A2A4L': { id: 17224, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnL' },
          'A2A4H': { id: 17225, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnH' },
          'NLTR4': { id: 17226, meta: 'https://snes.nesdev.org/wiki/DMA_registers#NLTRn' },
          'DMAP5': { id: 17232, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DMAPn' },
          'BBAD5': { id: 17233, meta: 'https://snes.nesdev.org/wiki/DMA_registers#BBADn' },
          'A1T5L': { id: 17234, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnL' },
          'A1T5H': { id: 17235, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnH' },
          'A1B5': { id: 17236, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1Bn' },
          'DAS5L': { id: 17237, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnL' },
          'DAS5H': { id: 17238, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnH' },
          'DASB5': { id: 17239, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASBn' },
          'A2A5L': { id: 17240, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnL' },
          'A2A5H': { id: 17241, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnH' },
          'NLTR5': { id: 17242, meta: 'https://snes.nesdev.org/wiki/DMA_registers#NLTRn' },
          'DMAP6': { id: 17248, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DMAPn' },
          'BBAD6': { id: 17249, meta: 'https://snes.nesdev.org/wiki/DMA_registers#BBADn' },
          'A1T6L': { id: 17250, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnL' },
          'A1T6H': { id: 17251, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnH' },
          'A1B6': { id: 17252, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1Bn' },
          'DAS6L': { id: 17253, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnL' },
          'DAS6H': { id: 17254, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnH' },
          'DASB6': { id: 17255, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASBn' },
          'A2A6L': { id: 17256, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnL' },
          'A2A6H': { id: 17257, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnH' },
          'NLTR6': { id: 17258, meta: 'https://snes.nesdev.org/wiki/DMA_registers#NLTRn' },
          'DMAP7': { id: 17264, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DMAPn' },
          'BBAD7': { id: 17265, meta: 'https://snes.nesdev.org/wiki/DMA_registers#BBADn' },
          'A1T7L': { id: 17266, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnL' },
          'A1T7H': { id: 17267, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1TnH' },
          'A1B7': { id: 17268, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A1Bn' },
          'DAS7L': { id: 17269, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnL' },
          'DAS7H': { id: 17270, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASnH' },
          'DASB7': { id: 17271, meta: 'https://snes.nesdev.org/wiki/DMA_registers#DASBn' },
          'A2A7L': { id: 17272, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnL' },
          'A2A7H': { id: 17273, meta: 'https://snes.nesdev.org/wiki/DMA_registers#A2AnH' },
          'NLTR7': { id: 17274, meta: 'https://snes.nesdev.org/wiki/DMA_registers#NLTRn' },
          'H_TITLE': { id: 65472, header: true, size: 21, meta: 'https://snes.nesdev.org/wiki/ROM_header#Cartridge_header' },
          'H_MODE': { id: 65493, header: true, meta: 'https://snes.nesdev.org/wiki/ROM_header#$FFD5' },
          'H_CHIPSET': { id: 65494, header: true, meta: 'https://snes.nesdev.org/wiki/ROM_header#$FFD6' },
          'H_SIZE': { id: 65495, header: true, meta: 'https://snes.nesdev.org/wiki/ROM_header#$Cartridge_header' },
          'H_RAM_SIZE': { id: 65496, header: true, meta: 'https://snes.nesdev.org/wiki/ROM_header#$Cartridge_header' },
          'H_COUNTRY_ID': { id: 65497, header: true, meta: 'https://snes.nesdev.org/wiki/ROM_header#$Cartridge_header' },
          'H_DEV_ID': { id: 65498, header: true, meta: 'https://snes.nesdev.org/wiki/ROM_header#$Cartridge_header' },
          'H_VERSION': { id: 65499, header: true, meta: 'https://snes.nesdev.org/wiki/ROM_header#$Cartridge_header' },
          'H_CHECKSUM_COMPLEMENT': { id: 65500, header: true, size: 2, meta: 'https://snes.nesdev.org/wiki/ROM_header#$Cartridge_header' },
          'H_CHECKSUM': { id: 65502, header: true, size: 2, meta: 'https://snes.nesdev.org/wiki/ROM_header#$Cartridge_header' },
          'E_COP': { id: 65508, entry: true, meta: 'https://snes.nesdev.org/wiki/CPU_vectors'},
          'E_BRK': { id: 65510, entry: true, meta: 'https://snes.nesdev.org/wiki/CPU_vectors'},
          'E_NMI': { id: 65514, entry: true, meta: 'https://snes.nesdev.org/wiki/CPU_vectors'},
          'E_IRQ': { id: 65518, entry: true, meta: 'https://snes.nesdev.org/wiki/CPU_vectors'},
          'E_EMU_COP': { id: 65524, entry: true, meta: 'https://snes.nesdev.org/wiki/CPU_vectors'},
          'E_EMU_NMI': { id: 65530, entry: true, meta: 'https://snes.nesdev.org/wiki/CPU_vectors'},
          'E_EMU_RESET': { id: 65532, entry: true, meta: 'https://snes.nesdev.org/wiki/CPU_vectors'},
          'E_EMU_BRK_IRQ': { id: 65534, entry: true, meta: 'https://snes.nesdev.org/wiki/CPU_vectors'},
        }
      }
    });

    // Step 1: Query for the current active version
    console.log('🔍 Finding current active project version...');
    const currentProject = await prisma.projectBranch.findFirst({
      where: {
        project: {
          name: "Illusion of Gaia: Retranslated"
        },
        name: '1.42',
        isActive: true
      },
      include: {
        project: true
      }
    });

    if (!currentProject) {
      throw new Error('Could not find active project branch for "Illusion of Gaia: Retranslated"');
    }

    console.log(`✅ Found current active version: ${currentProject.name} (version ${currentProject.version})`);

    console.log('🔄 Deactivating current branch...');
    await prisma.projectBranch.update({
      where: {
        id: currentProject.id
      },
      data: {
        isActive: null
      }
    });
    console.log('✅ Current branch deactivated');
    
    // Retrieve the current file ID list
    console.log('📋 Retrieving current fileIds list...');
    const fileIds = (await prisma.projectBranchFile.findMany({
      where: {
        branchId: currentProject.id
      }
    })).map(file => file.fileId);
    console.log(`✅ Retrieved ${fileIds.length} existing file IDs`);

    // Adjust modules configuration
    console.log('🔄 Adjusting modules configuration...');
    const modules = currentProject.modules as any[];

    // Add title-demo module
    const titleGroup = modules[0].groups[0];
    titleGroup!['options'].push({
      name: 'Demo',
      module: 'title-demo',
      description: 'Demo title screen with JP comet background'
    });

    // Add new project files to ID list
    console.log('➕ Adding new files...');
    fileIds.push(await createProjectFile(currentProject.projectId, "Patch", "", "patch.asm", "EnhancedTitle", "title-demo"));
    fileIds.push(await createProjectFile(currentProject.projectId, "Bitmap", "", "bin", "gfx_title", "title-demo"));
    fileIds.push(await createProjectFile(currentProject.projectId, "Bitmap", "", "bin", "gfx_title_actors", "title-demo"));
    fileIds.push(await createProjectFile(currentProject.projectId, "Tilemap", "", "map", "map_title_effect", "title-demo"));
    fileIds.push(await createProjectFile(currentProject.projectId, "Tilemap", "", "map", "map_title_main", "title-demo"));
    fileIds.push(await createProjectFile(currentProject.projectId, "Palette", "", "pal", "pal_title", "title-demo"));
    fileIds.push(await createProjectFile(currentProject.projectId, "Palette", "", "pal", "pal_title_actors", "title-demo"));
    fileIds.push(await createProjectFile(currentProject.projectId, "Tileset", "", "set", "set_title", "title-demo"));
    fileIds.push(await createProjectFile(currentProject.projectId, "Spritemap", "", "spm", "spm_title_actors", "title-demo"));
    
    // Add no-shira-spotlight module
    const extrasSection = modules[4];
    extrasSection.groups.push({
      name: 'No Shira Spotlight',
      options: [
        { name: 'Disable', module: null, default: true },
        { name: 'Enable', module: 'no-shira-spotlight' },
      ]
    });

    fileIds.push(await createProjectFile(currentProject.projectId, "Patch", "", "asm", "NoShiraSpotlight", "no-shira-spotlight"));

    // Step 5: Create new release branch
    console.log('🚀 Creating new release branch...');
    const newProjectBranchId = createId();
    const newProjectBranch = await prisma.projectBranch.create({
      data: {
        id: newProjectBranchId,
        projectId: currentProject.projectId,
        baseRomBranchId: currentProject.baseRomBranchId,
        name: '1.43',
        version: 3,
        isActive: true,
        notes: [
          'Added: Demo title screen',
          'Added: Option to remove the spotlight on Shira during dream'
        ],
        modules // Copy the modules configuration
      }
    });

    await prisma.projectBranchFile.createMany({
      data: fileIds.map(fileId => ({
        id: createId(),
        branchId: newProjectBranchId,
        fileId: fileId
      }))
    });

    // Update project meta to reflect new current version
    await prisma.project.update({
      where: {
        id: currentProject.projectId
      },
      data: {
        meta: {
          ...currentProject.project.meta,
          currentVersion: "1.43"
        }
      }
    });

    console.log(`✅ Created new project branch: ${newProjectBranch.name} (version ${newProjectBranch.version})`);
    console.log(`📊 New branch contains ${fileIds.length} files`);
    console.log('🎉 Updating for version 1.43 completed successfully!');

  } catch (error) {
    console.error('❌ Migration failed:', error);
    throw error;
  } finally {
    await prisma.$disconnect();
  }
}

// main()
//   .catch((e) => {
//     console.error('An error occurred during the migration process:');
//     console.error(e);
//     process.exit(1);
//   })
//   .finally(async () => {
//     await prisma.$disconnect();
//   });

export default main;
