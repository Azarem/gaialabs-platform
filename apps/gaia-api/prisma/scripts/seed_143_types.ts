import pkg from '@prisma/client';
const { PrismaClient } = pkg;
import * as path from 'path';
import { crc32_buffer, readFileAsBinary } from '@gaialabs/shared';

const prisma = new PrismaClient();

// --- Database Path Configuration ---
const RXLT_PATH = 'C:/Work/IOGRXLT/IOGRetranslation/modules';

async function loadBinaryData(rootPath: string, filePath: string): Promise<Uint8Array> {
  const fullPath = path.resolve(path.join(rootPath, filePath));
  const data = await readFileAsBinary(fullPath);
  return data;
}

async function createProjectFile(projectId: string, type: string, folder: string, extension: string, name: string, module?: string): Promise<number> {
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

    console.log(`✅ Found current active version: ${currentBranch.name} (version ${currentBranch.version})`);

    // Step 2: Deactivate the current branch
    console.log('🔄 Updating current branch...');
    await prisma.gameRomBranch.update({
      where: {
        id: currentBranch.id
      },
      data: {
        strings: (currentBranch.types as any)?.strings ?? undefined,
        structs: (currentBranch.types as any)?.structs ?? undefined,
      }
    });

    await prisma.platformBranch.update({
      where: {
        id: currentBranch.platformBranchId
      },
      data: {
        types: {
            'Byte': {
                'size': 1,
                'description': 'An 8-bit unsigned integer.'
            },
            'Word': {
                'size': 2,
                'description': 'A 16-bit unsigned integer.'
            },
            'Offset': {
                'size': 2,
                'isPointer': true,
                'ptrChar': '&',
                'description': 'A 16-bit unsigned integer used to represent an offset in memory. Bank is implied'
            },
            'Address': {
                'size': 3,
                'isPointer': true,
                'ptrChar': '@',
                'description': 'A 24-bit unsigned integer used to represent an address in memory or a file.'
            },
            'Bank': {
                'size': 1,
                'isPointer': true,
                'isBank': true,
                'ptrChar': '^',
                'description': 'A 8-bit unsigned integer used to represent a bank in memory.'
            },
            'WBank': {
                'size': 2,
                'isPointer': true,
                'isBank': true,
                'ptrChar': '*',
                'description': 'A 16-bit unsigned integer used to represent a bank in memory.'
            },
            'Binary': {
                'isData': true,
                'description': 'A binary string.'
            },
            'Code': {
                'isCode': true,
                'description': 'Assembly code'
            },
            'Relative': {
                'size': 1,
                'isPointer': true,
                'isRelative': true,
                'isSigned': true,
                'ptrChar': '%',
                'description': 'A 8-bit signed integer used to represent a relative offset in memory.'
            }
        },
      }
    });

    // Step 3: Adjust modules configuration
    //console.log('🔄 Adjusting modules configuration...');
    // const jpModule = currentProject.modules[1];
    // jpModule!['groups'].push({
    //   name: 'Diamond Mines',
    //   options: [
    //     { name: 'NA (Brown)', module: null, default: true },
    //     { name: 'JP (Purple)', module: 'jp-mines' }
    //   ]
    // });

    // Step 3: Retrieve the current file CRC list
    //console.log('📋 Retrieving current fileCrcs list...');
    //const fileCrcs = [...currentBranch.fileCrcs]; // Create a copy of the array
    //console.log(`✅ Retrieved ${fileCrcs.length} existing file CRCs`);

    // Step 4: Add new project file to CRC list
    //console.log('➕ Adding new jp-mines palette file...');
    //const newFileCrc = await createProjectFile(currentProject.projectId, "Palette", "palettes", "pal", "pal_dm3D_tiles", "jp-mines");
    //fileCrcs.push(newFileCrc);
    //console.log(`✅ Added new file CRC: ${newFileCrc}`);


    // // Update project meta to reflect new current version
    // await prisma.project.update({
    //   where: {
    //     id: currentBranch.projectId
    //   },
    //   data: {
    //     meta: {
    //       ...currentBranch.project.meta,
    //       currentVersion: "1.43"
    //     }
    //   }
    // });

    // console.log(`✅ Created new project branch: ${newGameRomBranch.name} (version ${newGameRomBranch.version})`);
    // console.log(`📊 New branch contains ${newGameRomBranch.fileCrcs.length} files`);
    console.log('🎉 Updating types for version 1.43 completed successfully!');

  } catch (error) {
    console.error('❌ Migration failed:', error);
    throw error;
  }
}

main()
  .catch((e) => {
    console.error('An error occurred during the migration process:');
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
