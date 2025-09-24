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
  console.log('Starting seed_142 migration process...');

  try {
    // Step 1: Query for the current active version
    console.log('🔍 Finding current active project version...');
    const currentProject = await prisma.projectBranch.findFirst({
      where: {
        project: {
          name: "Illusion of Gaia: Retranslated"
        },
        name: '1.41'
        //isActive: true
      },
      include: {
        project: true
      }
    });

    if (!currentProject) {
      throw new Error('Could not find active project branch for "Illusion of Gaia: Retranslated"');
    }

    console.log(`✅ Found current active version: ${currentProject.name} (version ${currentProject.version})`);

    // Step 2: Deactivate the current branch
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

    // Step 3: Adjust modules configuration
    console.log('🔄 Adjusting modules configuration...');
    const jpModule = currentProject.modules[1];
    jpModule!['groups'].push({
      name: 'Diamond Mines',
      options: [
        { name: 'NA (Brown)', module: null, default: true },
        { name: 'JP (Purple)', module: 'jp-mines' }
      ]
    });

    // Step 3: Retrieve the current file CRC list
    console.log('📋 Retrieving current fileCrcs list...');
    const fileCrcs = [...currentProject.fileCrcs]; // Create a copy of the array
    console.log(`✅ Retrieved ${fileCrcs.length} existing file CRCs`);

    // Step 4: Add new project file to CRC list
    console.log('➕ Adding new jp-mines palette file...');
    const newFileCrc = await createProjectFile(currentProject.projectId, "Palette", "palettes", "pal", "pal_dm3D_tiles", "jp-mines");
    fileCrcs.push(newFileCrc);
    console.log(`✅ Added new file CRC: ${newFileCrc}`);

    // Step 5: Create new release branch
    console.log('🚀 Creating new release branch...');
    const newProjectBranch = await prisma.projectBranch.create({
      data: {
        projectId: currentProject.projectId,
        baseRomBranchId: currentProject.baseRomBranchId,
        name: '1.42',
        version: 2,
        isActive: true,
        fileCrcs,
        notes: [
          'Added: JP Mines (purple) palette option'
        ],
        modules: currentProject.modules // Copy the modules configuration
      }
    });

    // Update project meta to reflect new current version
    await prisma.project.update({
      where: {
        id: currentProject.projectId
      },
      data: {
        meta: {
          ...currentProject.project.meta,
          currentVersion: "1.42"
        }
      }
    });

    console.log(`✅ Created new project branch: ${newProjectBranch.name} (version ${newProjectBranch.version})`);
    console.log(`📊 New branch contains ${newProjectBranch.fileCrcs.length} files`);
    console.log('🎉 Migration to version 1.42 completed successfully!');

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
