import { PrismaClient } from '@prisma/client';
import * as fs from 'fs';
import * as path from 'path';

const prisma = new PrismaClient();

// Configuration
const ASM_DIRECTORY = '/mnt/c/Work/gaialabs-platform/truth/asm';
const DEFAULT_REGION_CODE = 'NA-English';
const DEFAULT_REGION_NAME = 'NA-English';

// Statistics tracking
interface SeedStats {
  filesScanned: number;
  filesProcessed: number;
  sceneGroupsCreated: number;
  scenesCreated: number;
  filesCreated: number;
  gameStringsCreated: number;
  stringTextsCreated: number;
  errors: string[];
}

// Data structures for collected information
interface ParsedString {
  type: string;
  location: string;
  text: string;
  name: string;
}

interface FileInfo {
  filePath: string;
  fileName: string;
  folderName: string;
  sceneCode: string | null;
  content: string;
  strings: ParsedString[];
}

/**
 * Recursively scan directory for .asm files
 */
async function scanDirectory(dirPath: string): Promise<string[]> {
  const asmFiles: string[] = [];

  try {
    const entries = await fs.promises.readdir(dirPath, { withFileTypes: true });

    for (const entry of entries) {
      const fullPath = path.join(dirPath, entry.name);

      if (entry.isDirectory()) {
        const subFiles = await scanDirectory(fullPath);
        asmFiles.push(...subFiles);
      } else if (entry.isFile() && entry.name.endsWith('.asm')) {
        asmFiles.push(fullPath);
      }
    }
  } catch (error) {
    console.warn(`⚠️ Warning: Could not scan directory ${dirPath}:`, error);
  }

  return asmFiles;
}

/**
 * Extract scene code from filename using stricter pattern matching
 */
function extractSceneCode(fileName: string): string | null {
  // Pattern: {code}_*.asm where code is 1-2 non-whitespace chars + exactly 2 hex digits (A-F or 0-9)
  // Examples: sc01_astronomer.asm -> sc01, av69_erik.asm -> av69
  const match = fileName.match(/^(\S{1,2}[A-F0-9]{2})_.*\.asm$/);
  return match ? match[1] : null;
}

/**
 * Parse string patterns from file content
 */
function parseStringPatterns(content: string): ParsedString[] {
  const strings: ParsedString[] = [];

  // Pattern for widestring: widestring_{location} `{text}`
  const widestringRegex = /widestring_([0-9A-Fa-f]+)\s+`([^`]*)`/g;
  let match;

  while ((match = widestringRegex.exec(content)) !== null) {
    strings.push({
      type: 'widestring',
      location: match[1],
      text: match[2],
      name: `widestring_${match[1]}`
    });
  }

  // Pattern for asciiString: asciiString_{location} ~{text}~
  const asciiStringRegex = /asciistring_([0-9A-Fa-f]+)\s+\|([^|]*)\|/g;
  while ((match = asciiStringRegex.exec(content)) !== null) {
    strings.push({
      type: 'asciistring',
      location: match[1],
      text: match[2],
      name: `asciistring_${match[1]}`
    });
  }

  // Pattern for spriteString: spriteString_{location} |{text}|
  const spriteStringRegex = /spritestring_([0-9A-Fa-f]+)\s+~([^~]*)~/g;
  while ((match = spriteStringRegex.exec(content)) !== null) {
    strings.push({
      type: 'spritestring',
      location: match[1],
      text: match[2],
      name: `spritestring_${match[1]}`
    });
  }

  return strings;
}

/**
 * Process a single .asm file and extract information
 * Only returns FileInfo if the file contains at least one valid string pattern
 */
async function processFile(filePath: string): Promise<FileInfo | null> {
  try {
    const content = await fs.promises.readFile(filePath, 'utf-8');
    const fileName = path.basename(filePath);
    const dirPath = path.dirname(filePath);
    const asmDirPath = path.resolve(ASM_DIRECTORY);

    // Determine folder name - handle files in root asm directory
    let folderName: string;
    if (dirPath === asmDirPath) {
      folderName = ''; // No parent folder (root directory)
    } else {
      folderName = path.basename(dirPath);
    }

    const sceneCode = extractSceneCode(fileName);
    const strings = parseStringPatterns(content);

    // Only return FileInfo if the file contains at least one valid string
    if (strings.length === 0) {
      return null;
    }

    return {
      filePath,
      fileName: fileName.replace('.asm', ''),
      folderName,
      sceneCode,
      content,
      strings
    };
  } catch (error) {
    console.warn(`⚠️ Warning: Could not process file ${filePath}:`, error);
    return null;
  }
}

/**
 * Clean up existing database records in correct order to avoid foreign key violations
 */
async function cleanupDatabase() {
  console.log('🧹 Cleaning up existing database records...');

  try {
    // Delete in reverse dependency order
    const stringTextCount = await prisma.stringText.count();
    if (stringTextCount > 0) {
      await prisma.stringText.deleteMany();
      console.log(`   🗑️ Deleted ${stringTextCount} StringText records`);
    }

    const gameStringCount = await prisma.gameString.count();
    if (gameStringCount > 0) {
      await prisma.gameString.deleteMany();
      console.log(`   🗑️ Deleted ${gameStringCount} GameString records`);
    }

    const fileCount = await prisma.file.count();
    if (fileCount > 0) {
      await prisma.file.deleteMany();
      console.log(`   🗑️ Deleted ${fileCount} File records`);
    }

    const sceneCount = await prisma.scene.count();
    if (sceneCount > 0) {
      await prisma.scene.deleteMany();
      console.log(`   🗑️ Deleted ${sceneCount} Scene records`);
    }

    const sceneGroupCount = await prisma.sceneGroup.count();
    if (sceneGroupCount > 0) {
      await prisma.sceneGroup.deleteMany();
      console.log(`   🗑️ Deleted ${sceneGroupCount} SceneGroup records`);
    }

    const stringTypeCount = await prisma.stringType.count();
    if (stringTypeCount > 0) {
      await prisma.stringType.deleteMany();
      console.log(`   🗑️ Deleted ${stringTypeCount} StringType records`);
    }

    // Note: We keep TextRegion and User records as they may be referenced elsewhere
    console.log('✅ Database cleanup completed');

  } catch (error) {
    console.warn('⚠️ Warning: Database cleanup failed:', error);
    throw error;
  }
}

/**
 * Create or get existing StringTypes
 */
async function ensureStringTypes() {
  const stringTypes = ['widestring', 'asciistring', 'spritestring'];
  const createdTypes = new Map<string, string>();

  for (const typeName of stringTypes) {
    const stringType = await prisma.stringType.upsert({
      where: { name: typeName },
      update: {},
      create: {
        name: typeName,
        description: typeName
      }
    });
    createdTypes.set(typeName, stringType.id);
  }

  return createdTypes;
}

/**
 * Create or get the default TextRegion
 */
async function ensureDefaultTextRegion(adminUserId: string) {
  const textRegion = await prisma.textRegion.upsert({
    where: { code: DEFAULT_REGION_CODE },
    update: {},
    create: {
      code: DEFAULT_REGION_CODE,
      name: DEFAULT_REGION_NAME,
      language: 'English',
      isCore: true,
      createdById: adminUserId
    }
  });

  return textRegion.id;
}

/**
 * Create SceneGroups from unique folder names (including a default group for root files)
 */
async function createSceneGroups(fileInfos: FileInfo[]): Promise<Map<string, string>> {
  const uniqueFolders = [...new Set(fileInfos.map(f => f.folderName).filter(name => name !== ''))];
  const sceneGroupMap = new Map<string, string>();

  console.log(`📁 Creating ${uniqueFolders.length + 1} scene groups (including default)...`);

  // Create default group for root directory files
  try {
    const defaultGroup = await prisma.sceneGroup.upsert({
      where: { name: 'Root' },
      update: {},
      create: {
        name: 'Root',
        description: 'Default group for files in root directory'
      }
    });
    sceneGroupMap.set('', defaultGroup.id); // Map empty folder name to default group
  } catch (error) {
    console.warn(`⚠️ Warning: Could not create default scene group:`, error);
  }

  for (const folderName of uniqueFolders) {
    try {
      const sceneGroup = await prisma.sceneGroup.upsert({
        where: { name: folderName },
        update: {},
        create: {
          name: folderName,
          description: folderName
        }
      });
      sceneGroupMap.set(folderName, sceneGroup.id);
    } catch (error) {
      console.warn(`⚠️ Warning: Could not create scene group ${folderName}:`, error);
    }
  }

  return sceneGroupMap;
}

/**
 * Create Scenes from unique scene codes (only for files with valid scene codes and parent folders)
 */
async function createScenes(
  fileInfos: FileInfo[],
  sceneGroupMap: Map<string, string>
): Promise<Map<string, string>> {
  // Group files by scene code
  const sceneMap = new Map<string, { code: string; name: string; groupId: string }>();

  for (const fileInfo of fileInfos) {
    if (fileInfo.sceneCode) {
      // Get groupId from sceneGroupMap (empty folder name maps to default "Root" group)
      const groupId = sceneGroupMap.get(fileInfo.folderName);
      
      if (groupId) {
        sceneMap.set(fileInfo.sceneCode, {
          code: fileInfo.sceneCode,
          name: fileInfo.sceneCode,
          groupId
        });
      } else {
        console.warn(`⚠️ Warning: No group found for scene ${fileInfo.sceneCode} in folder '${fileInfo.folderName}'`);
      }
    }
  }

  console.log(`🎬 Creating ${sceneMap.size} scenes...`);

  const sceneIdMap = new Map<string, string>();

  for (const [sceneCode, sceneData] of sceneMap) {
    try {
      const scene = await prisma.scene.upsert({
        where: { code: sceneCode },
        update: {},
        create: {
          code: sceneData.code,
          name: sceneData.name,
          groupId: sceneData.groupId
        }
      });
      sceneIdMap.set(sceneCode, scene.id);
    } catch (error) {
      console.warn(`⚠️ Warning: Could not create scene ${sceneCode}:`, error);
    }
  }

  return sceneIdMap;
}

/**
 * Create File records (only for files with valid scene codes)
 */
async function createFiles(
  fileInfos: FileInfo[],
  sceneIdMap: Map<string, string>,
  sceneGroupMap: Map<string, string>
): Promise<Map<string, string>> {

  console.log(`📄 Creating ${fileInfos.length} file records`);

  const fileIdMap = new Map<string, string>();

  for (const fileInfo of fileInfos) {
    try {
      const file = await prisma.file.upsert({
        where: { name: fileInfo.fileName },
        update: {},
        create: {
          name: fileInfo.fileName,
          description: fileInfo.fileName,
          sceneId: sceneIdMap.get(fileInfo.sceneCode!),
          groupId: fileInfo.folderName !== '' ? sceneGroupMap.get(fileInfo.folderName) : null
        }
      });

      fileIdMap.set(fileInfo.fileName, file.id);
    } catch (error) {
      console.warn(`⚠️ Warning: Could not create file ${fileInfo.fileName}:`, error);
    }
  }

  return fileIdMap;
}

/**
 * Create GameString and StringText records
 */
async function createGameStrings(
  fileInfos: FileInfo[],
  stringTypeMap: Map<string, string>,
  sceneIdMap: Map<string, string>,
  fileIdMap: Map<string, string>,
  textRegionId: string,
  adminUserId: string
): Promise<{ gameStringsCreated: number; stringTextsCreated: number }> {
  let gameStringsCreated = 0;
  let stringTextsCreated = 0;

  console.log(`🔤 Processing strings from files...`);

  // Only process files that have valid File records
  const validFiles = fileInfos.filter(f => fileIdMap.has(f.fileName));

  for (const fileInfo of validFiles) {
    if (fileInfo.strings.length === 0) continue;

    const sceneId = fileInfo.sceneCode ? sceneIdMap.get(fileInfo.sceneCode) : undefined;
    const fileId = fileIdMap.get(fileInfo.fileName);

    if (!fileId) {
      console.warn(`⚠️ Warning: Missing file ID for ${fileInfo.fileName}, skipping strings...`);
      continue;
    }

    for (const stringInfo of fileInfo.strings) {
      try {
        const stringTypeId = stringTypeMap.get(stringInfo.type);
        if (!stringTypeId) {
          console.warn(`⚠️ Warning: Unknown string type ${stringInfo.type}, skipping...`);
          continue;
        }

        // Create GameString
        const gameString = await prisma.gameString.create({
          data: {
            name: stringInfo.name,
            typeId: stringTypeId,
            sceneId,
            fileId
          }
        });

        gameStringsCreated++;

        // Create StringText
        await prisma.stringText.create({
          data: {
            stringId: gameString.id,
            regionId: textRegionId,
            text: stringInfo.text,
            createdById: adminUserId
          }
        });

        stringTextsCreated++;

      } catch (error) {
        console.warn(`⚠️ Warning: Could not create string ${stringInfo.name}:`, error);
      }
    }
  }

  return { gameStringsCreated, stringTextsCreated };
}

/**
 * Main seeding function
 */
async function main() {
  console.log('🌱 Starting comprehensive database seed...');

  const stats: SeedStats = {
    filesScanned: 0,
    filesProcessed: 0,
    sceneGroupsCreated: 0,
    scenesCreated: 0,
    filesCreated: 0,
    gameStringsCreated: 0,
    stringTextsCreated: 0,
    errors: []
  };

  try {
    // Step 1: Clean up existing database records
    await cleanupDatabase();

    // Step 2: Ensure admin user exists
    console.log('👤 Ensuring admin user exists...');
    const adminUser = await prisma.user.upsert({
      where: { email: 'azarem@gmail.com' },
      update: {},
      create: {
        email: 'azarem@gmail.com',
        username: 'Azarem',
        fullName: 'GaiaLabs Admin',
        role: 'ADMIN'
      },
    });
    console.log(`✅ Admin user ready: ${adminUser.email}`);

    // Step 3: Create prerequisite records
    console.log('🔧 Setting up prerequisite records...');
    const stringTypeMap = await ensureStringTypes();
    const textRegionId = await ensureDefaultTextRegion(adminUser.id);
    console.log(`✅ Created string types and default text region`);

    // Step 4: Scan directory for .asm files
    console.log(`📂 Scanning directory: ${ASM_DIRECTORY}`);
    const asmFiles = await scanDirectory(ASM_DIRECTORY);
    stats.filesScanned = asmFiles.length;
    console.log(`✅ Found ${asmFiles.length} .asm files`);

    if (asmFiles.length === 0) {
      console.warn('⚠️ No .asm files found. Check the directory path.');
      return;
    }

    // Step 5: Process all files (only keep files with valid strings)
    console.log('📖 Processing files and extracting information...');
    const fileInfos: FileInfo[] = [];

    for (const filePath of asmFiles) {
      const fileInfo = await processFile(filePath);
      if (fileInfo) {
        fileInfos.push(fileInfo);
        stats.filesProcessed++;
      }
    }

    console.log(`✅ Successfully processed ${fileInfos.length} files with valid strings (${asmFiles.length - fileInfos.length} files skipped)`);

    // Step 6: Create SceneGroups
    const sceneGroupMap = await createSceneGroups(fileInfos);
    stats.sceneGroupsCreated = sceneGroupMap.size;
    console.log(`✅ Created ${sceneGroupMap.size} scene groups`);

    // Step 7: Create Scenes
    const sceneIdMap = await createScenes(fileInfos, sceneGroupMap);
    stats.scenesCreated = sceneIdMap.size;
    console.log(`✅ Created ${sceneIdMap.size} scenes`);

    // Step 8: Create Files
    const fileIdMap = await createFiles(fileInfos, sceneIdMap, sceneGroupMap);
    stats.filesCreated = fileIdMap.size;
    console.log(`✅ Created ${fileIdMap.size} file records`);

    // Step 9: Create GameStrings and StringTexts
    const stringResults = await createGameStrings(
      fileInfos,
      stringTypeMap,
      sceneIdMap,
      fileIdMap,
      textRegionId,
      adminUser.id
    );

    stats.gameStringsCreated = stringResults.gameStringsCreated;
    stats.stringTextsCreated = stringResults.stringTextsCreated;

    // Final summary
    console.log('\n🎉 Database seed completed successfully!');
    console.log('📊 Summary:');
    console.log(`   📁 Files scanned: ${stats.filesScanned}`);
    console.log(`   📖 Files processed: ${stats.filesProcessed}`);
    console.log(`   🏢 Scene groups created: ${stats.sceneGroupsCreated}`);
    console.log(`   🎬 Scenes created: ${stats.scenesCreated}`);
    console.log(`   📄 Files created: ${stats.filesCreated}`);
    console.log(`   🔤 Game strings created: ${stats.gameStringsCreated}`);
    console.log(`   📝 String texts created: ${stats.stringTextsCreated}`);

    if (stats.errors.length > 0) {
      console.log(`\n⚠️ Encountered ${stats.errors.length} errors during processing`);
    }

  } catch (error) {
    console.error('❌ Seed failed with error:', error);
    throw error;
  }
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error('❌ Seed failed:', e);
    await prisma.$disconnect();
    process.exit(1);
  });
