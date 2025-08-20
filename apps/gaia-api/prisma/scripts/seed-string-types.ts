import { PrismaClient } from '@prisma/client';
import { readFileSync } from 'fs';
import { join } from 'path';
import type { DbStringType, DbStringCommand, DbStringLayer } from '@gaialabs/shared';

const prisma = new PrismaClient();

async function loadJsonData<T>(filePath: string): Promise<T> {
  try {
    const fullPath = join(process.cwd(), '../../ext/GaiaLib/db/us', filePath);
    const data = readFileSync(fullPath, 'utf-8')
      .replace(/^\uFEFF/, '') // Remove BOM if present
      .trim();
    return JSON.parse(data);
  } catch (error) {
    console.error(`Failed to load ${filePath}:`, error);
    return [] as T;
  }
}

async function seedStringTypes(gameId: string, releaseId: string) {
  console.log('🌱 Seeding string types...');

  try {
    // Load JSON data
    const stringTypes = await loadJsonData<DbStringType[]>('stringTypes.json');
    const stringCommands = await loadJsonData<DbStringCommand[]>('stringCommands.json');
    const stringLayers = await loadJsonData<DbStringLayer[]>('stringLayers.json');

    // Clear existing data
    console.log('🧹 Cleaning existing string type data...');
    await prisma.releaseStringLayer.deleteMany({});
    await prisma.releaseStringCommand.deleteMany({});
    await prisma.releaseString.deleteMany({});
    await prisma.gameStringCommand.deleteMany({});
    await prisma.gameString.deleteMany({});

    // Seed GameString (base string type definitions)
    console.log('📝 Creating game string types...');
    for (const stringType of stringTypes) {
      const createdGameString = await prisma.gameString.create({
        data: {
          gameId,
          name: stringType.name,
          delimiter: stringType.delimiter,
          shiftType: stringType.shiftType,
          terminator: stringType.terminator,
          greedyTerminator: stringType.greedyTerminator || false,
          description: `String type for ${stringType.name}`,
        },
      });

      console.log(`  ✅ Created game string type: ${createdGameString.name}`);

      // Add commands for this game string type
      const typeCommands = stringCommands.filter(cmd => cmd.set === stringType.name);
      for (const command of typeCommands) {
        await prisma.gameStringCommand.create({
          data: {
            gameStringId: createdGameString.id,
            key: command.key,
            value: command.value,
            types: command.types,
            delimiter: command.delimiter,
            halt: command.halt || false,
          },
        });
        console.log(`    📋 Added command: ${command.value} (${command.key})`);
      }

      // Create ReleaseString with the actual character map and data
      const createdReleaseString = await prisma.releaseString.create({
        data: {
          releaseId,
          gameStringId: createdGameString.id,
          characterMap: stringType.characterMap, // THIS IS WHERE THE ACTUAL DATA LIVES
          // Override fields can be left null if same as GameString
        },
      });

      console.log(`    🎯 Created release string with character map`);

      // Add layers for this release string
      const typeLayers = stringLayers.filter(layer => layer.type === stringType.name);
      for (const layer of typeLayers) {
        await prisma.releaseStringLayer.create({
          data: {
            releaseStringId: createdReleaseString.id,
            base: layer.base,
            map: layer.map,
          },
        });
        console.log(`    🎨 Added layer with base: ${layer.base}`);
      }
    }

    console.log('✅ String types seeded successfully!');
  } catch (error) {
    console.error('❌ Error seeding string types:', error);
    throw error;
  }
}

// Export the function for use in main seed script
export { seedStringTypes };

// Only run directly if this file is executed directly (requires gameId and releaseId parameters)
// Check if this module is the main module being executed
if (process.argv[1]?.includes('seed-string-types.ts')) {
  console.error('❌ This script requires gameId and releaseId parameters. Run the main seed script instead.');
  process.exit(1);
}
