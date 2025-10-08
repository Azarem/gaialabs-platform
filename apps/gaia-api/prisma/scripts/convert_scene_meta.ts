import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Type definitions
type SceneAsset = 
  | PPUAsset
  | MusicAsset
  | PaletteAsset
  | TilemapAsset
  | BitmapAsset
  | SpritemapAsset
  | TilesetAsset
  | BranchAsset
  | JumpAsset
  | LabelAsset
  | Meta17Asset;

interface PPUAsset {
  type: 'ppu';
  index: number;
}

interface MusicAsset {
  type: 'music';
  id: number;
  group?: number;
  data: string;
}

interface PaletteAsset {
  type: 'palette';
  srcOffset?: number;
  sizeW: number;
  dstOffset?: number;
  data: string;
}

interface TilemapAsset {
  type: 'tilemap';
  layer: number;
  data: string;
}

interface BitmapAsset {
  type: 'bitmap';
  srcOffset?: number;
  sizeW: number;
  dstOffset?: number;
  data: string;
  isSprite?: boolean;
}

interface SpritemapAsset {
  type: 'spritemap';
  size: number;
  dummy?: number;
  data: string;
}

interface TilesetAsset {
  type: 'tileset';
  srcOffset?: number;
  sizeW: number;
  dstOffset?: number;
  layer?: number;
  data: string;
}

interface BranchAsset {
  type: 'branch';
  flag: number;
  label: number;
}

interface JumpAsset {
  type: 'jump';
  label: number;
}

interface LabelAsset {
  type: 'label';
  id: number;
}

interface Meta17Asset {
  type: 'meta17';
  param: number;
  data: string;
}

interface Scene {
  id: number;
  assets: SceneAsset[];
  labels: Record<string, number>;
}

interface SceneCollection {
  scenes: Record<string, Record<string, Scene>>;
}

// Scene group mappings
const SCENE_GROUPS: Array<{ name: string; prefix: string; ranges: Array<number | [number, number]> }> = [
  { name: 'system', prefix: 's', ranges: [0x00, 0x59, 0xC0, [0xE6, 0xEA], 0xE9, [0xFA, 0xFE]] },
  { name: 'south-cape', prefix: 'sc', ranges: [[0x01, 0x08]] },
  { name: 'edward-castle', prefix: 'ec', ranges: [[0x0A, 0x13]] },
  { name: 'itory', prefix: 'it', ranges: [[0x15, 0x1B]] },
  { name: 'incan-ruins', prefix: 'ir', ranges: [[0x1C, 0x29]] },
  { name: 'gold-ship', prefix: 'gs', ranges: [[0x2A, 0x2E]] },
  { name: 'diamond-coast', prefix: 'dc', ranges: [[0x2F, 0x31]] },
  { name: 'freejia', prefix: 'fj', ranges: [[0x32, 0x3C]] },
  { name: 'diamond-mine', prefix: 'dm', ranges: [[0x3D, 0x47]] },
  { name: 'nazca', prefix: 'nz', ranges: [[0x49, 0x4B]] },
  { name: 'sky-garden', prefix: 'sg', ranges: [[0x4C, 0x58]] },
  { name: 'seaside-palace', prefix: 'sp', ranges: [[0x5A, 0x5E]] },
  { name: 'mu', prefix: 'mu', ranges: [[0x5F, 0x67]] },
  { name: 'angel-village', prefix: 'av', ranges: [[0x68, 0x75]] },
  { name: 'watermia', prefix: 'wm', ranges: [[0x78, 0x7F]] },
  { name: 'great-wall', prefix: 'gw', ranges: [[0x82, 0x8B]] },
  { name: 'prologue', prefix: 'pr', ranges: [[0x8C, 0x8F]] },
  { name: 'ending', prefix: 'ed', ranges: [0x89, 0x90, 0xE5, 0xF0] },
  { name: 'euro', prefix: 'eu', ranges: [[0x91, 0x9D]] },
  { name: 'mountain-temple', prefix: 'mt', ranges: [[0xA0, 0xA9]] },
  { name: 'native-village', prefix: 'nv', ranges: [[0xAC, 0xAE]] },
  { name: 'angkor-wat', prefix: 'aw', ranges: [[0xB0, 0xBF]] },
  { name: 'dao', prefix: 'dao', ranges: [[0xC3, 0xC9]] },
  { name: 'pyramid', prefix: 'py', ranges: [[0xCC, 0xDD]] },
  { name: 'credits', prefix: 'cr', ranges: [0xF7] },
  { name: 'babel-tower', prefix: 'bt', ranges: [0xDC, [0xDE, 0xE5], [0xF2, 0xF6]] },
  { name: 'mansion', prefix: 'mn', ranges: [0xE9] },
];

function isInRange(value: number, range: number | [number, number]): boolean {
  if (typeof range === 'number') {
    return value === range;
  }
  return value >= range[0] && value <= range[1];
}

function getSceneGroup(sceneId: number): { group: string; prefix: string } | null {
  // Special handling for ranges with exclusions
  if (sceneId === 0x89) {
    return { group: 'ending', prefix: 'ed' };
  }
  if (sceneId >= 0xE6 && sceneId <= 0xEA && sceneId !== 0xE9) {
    return { group: 'system', prefix: 's' };
  }
  if (sceneId >= 0x82 && sceneId <= 0x8B && sceneId !== 0x89) {
    return { group: 'great-wall', prefix: 'gw' };
  }
  if (sceneId >= 0xCC && sceneId <= 0xDD && sceneId !== 0xDC) {
    return { group: 'pyramid', prefix: 'py' };
  }

  for (const group of SCENE_GROUPS) {
    for (const range of group.ranges) {
      if (isInRange(sceneId, range)) {
        return { group: group.name, prefix: group.prefix };
      }
    }
  }
  return null;
}

function parseHex(hex: string): number {
  return parseInt(hex.replace(/[#$]/g, ''), 16);
}

// function formatLabelId(value: number): string {
//   return value.toString(16).toUpperCase().padStart(2, '0');
// }

function stripAt(label: string): string {
  return label.replace(/^@/, '');
}

function parseAssetLine(line: string): SceneAsset | null {
  line = line.trim();

  // ppu < #XX >
  const ppuMatch = line.match(/^ppu\s*<\s*#([0-9A-Fa-f]+)\s*>/);
  if (ppuMatch) {
    return { type: 'ppu', index: parseHex(ppuMatch[1]) };
  }

  // music < #XX, #XX, @label >
  const musicMatch = line.match(/^music\s*<\s*#([0-9A-Fa-f]+)\s*,\s*#([0-9A-Fa-f]+)\s*,\s*@(\w+)\s*>/);
  if (musicMatch) {
    return {
      type: 'music',
      id: parseHex(musicMatch[1]),
      ...(musicMatch[2] !== '00' ? { group: parseHex(musicMatch[2]) } : {}),
      data: musicMatch[3]
    };
  }

  // bitmap < #XX, #XX, #XX, @label, #XX >
  const bitmapMatch = line.match(/^bitmap\s*<\s*#([0-9A-Fa-f]+)\s*,\s*#([0-9A-Fa-f]+)\s*,\s*#([0-9A-Fa-f]+)\s*,\s*@(\w+)\s*,\s*#([0-9A-Fa-f]+)\s*>/);
  if (bitmapMatch) {
    return {
      type: 'bitmap',
      ...(bitmapMatch[1] !== '00' ? { srcOffset: parseHex(bitmapMatch[1]) } : {}),
      sizeW: parseHex(bitmapMatch[2]),
      ...(bitmapMatch[3] !== '00' ? { dstOffset: parseHex(bitmapMatch[3]) } : {}),
      data: bitmapMatch[4],
      ...(bitmapMatch[5] === '01' ? { isSprite: true } : {})
    };
  }

  // palette < #XX, #XX, #XX, @label >
  const paletteMatch = line.match(/^palette\s*<\s*#([0-9A-Fa-f]+)\s*,\s*#([0-9A-Fa-f]+)\s*,\s*#([0-9A-Fa-f]+)\s*,\s*@(\w+)\s*>/);
  if (paletteMatch) {
    return {
      type: 'palette',
      ...(paletteMatch[1] !== '00' ? { srcOffset: parseHex(paletteMatch[1]) } : {}),
      sizeW: parseHex(paletteMatch[2]),
      ...(paletteMatch[3] !== '00' ? { dstOffset: parseHex(paletteMatch[3]) } : {}),
      data: paletteMatch[4]
    };
  }

  // tileset < #XX, #XX, #XX, #XX, @label >
  const tilesetMatch = line.match(/^tileset\s*<\s*#([0-9A-Fa-f]+)\s*,\s*#([0-9A-Fa-f]+)\s*,\s*#([0-9A-Fa-f]+)\s*,\s*#([0-9A-Fa-f]+)\s*,\s*@(\w+)\s*>/);
  if (tilesetMatch) {
    return {
      type: 'tileset',
      ...(tilesetMatch[1] !== '00' ? { srcOffset: parseHex(tilesetMatch[1]) } : {}),
      sizeW: parseHex(tilesetMatch[2]),
      ...(tilesetMatch[3] !== '00' ? { dstOffset: parseHex(tilesetMatch[3]) } : {}),
      ...(tilesetMatch[4] !== '00' ? { layer: parseHex(tilesetMatch[4]) } : {}),
      data: tilesetMatch[5]
    };
  }

  // tilemap < #XX, @label >
  const tilemapMatch = line.match(/^tilemap\s*<\s*#([0-9A-Fa-f]+)\s*,\s*@(\w+)\s*>/);
  if (tilemapMatch) {
    return {
      type: 'tilemap',
      layer: parseHex(tilemapMatch[1]),
      data: tilemapMatch[2]
    };
  }

  // spritemap < #$XXXX, #XX, @label >
  const spritemapMatch = line.match(/^spritemap\s*<\s*#\$([0-9A-Fa-f]+)\s*,\s*#([0-9A-Fa-f]+)\s*,\s*@(\w+)\s*>/);
  if (spritemapMatch) {
    return {
      type: 'spritemap',
      size: parseHex(spritemapMatch[1]),
      ...(spritemapMatch[2] !== '00' ? { dummy: parseHex(spritemapMatch[2]) } : {}),
      data: spritemapMatch[3]
    };
  }

  // branch < #XX, #XX >
  const branchMatch = line.match(/^branch\s*<\s*#([0-9A-Fa-f]+)\s*,\s*#([0-9A-Fa-f]+)\s*>/);
  if (branchMatch) {
    return {
      type: 'branch',
      flag: parseHex(branchMatch[1]),
      label: parseHex(branchMatch[2])
    };
  }

  // jump < #XX >
  const jumpMatch = line.match(/^jump\s*<\s*#([0-9A-Fa-f]+)\s*>/);
  if (jumpMatch) {
    return {
      type: 'jump',
      label: parseHex(jumpMatch[1])
    };
  }

  // label < #XX >
  const labelMatch = line.match(/^label\s*<\s*#([0-9A-Fa-f]+)\s*>/);
  if (labelMatch) {
    return {
      type: 'label',
      id: parseHex(labelMatch[1])
    };
  }

  // meta17 < #XX, @label >
  const meta17Match = line.match(/^meta17\s*<\s*#([0-9A-Fa-f]+)\s*,\s*@(\w+)\s*>/);
  if (meta17Match) {
    return {
      type: 'meta17',
      param: parseHex(meta17Match[1]),
      data: meta17Match[2]
    };
  }

  return null;
}

export function parseSceneMetaFile(filePath: string): SceneCollection {
  const content = fs.readFileSync(filePath, 'utf-8');
  const lines = content.split('\n');

  const result: SceneCollection = { scenes: {} };
  let currentEntry: { id: number; assets: SceneAsset[] } | null = null;

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];

    // Check for entry start: entry_XX [
    const entryMatch = line.match(/^entry_([0-9A-Fa-f]{2})\s*\[/);
    if (entryMatch) {
      const entryId = parseHex(entryMatch[1]);
      currentEntry = { id: entryId, assets: [] };
      continue;
    }

    // Check for entry end: ]
    if (line.trim() === ']' && currentEntry) {
      // Process the completed entry
      const sceneInfo = getSceneGroup(currentEntry.id);
      if (sceneInfo) {
        const sceneId = `${sceneInfo.prefix}${currentEntry.id.toString(16).toUpperCase().padStart(2, '0')}`;

        // Build labels map
        const labels: Record<string, number> = {};
        currentEntry.assets.forEach((asset, index) => {
          if (asset.type === 'label') {
            labels[asset.id] = index;
          }
        });

        // Initialize scene group if needed
        if (!result.scenes[sceneInfo.group]) {
          result.scenes[sceneInfo.group] = {};
        }

        // Add scene
        result.scenes[sceneInfo.group][sceneId] = {
          id: currentEntry.id,
          assets: currentEntry.assets,
          labels
        };
      }

      currentEntry = null;
      continue;
    }

    // Parse asset lines within an entry
    if (currentEntry) {
      const asset = parseAssetLine(line);
      if (asset) {
        currentEntry.assets.push(asset);
      }
    }
  }

  return result;
}

export function main() {
  const inputPath = path.join(__dirname, '../../../../truth/asm/scene_meta.asm');
  const outputPath = path.join(__dirname, '../data/scene_meta.json');

  console.log('Parsing scene_meta.asm...');
  const sceneData = parseSceneMetaFile(inputPath);

  // Ensure output directory exists
  const outputDir = path.dirname(outputPath);
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }

  console.log('Writing JSON output...');
  fs.writeFileSync(outputPath, JSON.stringify(sceneData, null, 2), 'utf-8');

  // Print statistics
  let totalScenes = 0;
  let totalAssets = 0;
  for (const group in sceneData.scenes) {
    const sceneCount = Object.keys(sceneData.scenes[group]).length;
    totalScenes += sceneCount;

    for (const sceneId in sceneData.scenes[group]) {
      totalAssets += sceneData.scenes[group][sceneId].assets.length;
    }
  }

  console.log(`\nConversion complete!`);
  console.log(`Total scene groups: ${Object.keys(sceneData.scenes).length}`);
  console.log(`Total scenes: ${totalScenes}`);
  console.log(`Total assets: ${totalAssets}`);
  console.log(`Output written to: ${outputPath}`);
}

// Run the main function
//main();

//export { main, parseSceneMetaFile, SceneCollection, Scene, SceneAsset };

