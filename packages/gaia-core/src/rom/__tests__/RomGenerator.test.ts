import { describe, expect, it } from 'vitest';
import { readFileAsBinary, saveFileAsBinary } from '@gaialabs/shared';
import { RomGenerator } from '../generator';

describe('RomGenerator', async () => {
  const data = await readFileAsBinary('C:/Games/SNES/Illusion of Gaia.smc');
  const modules = [
    "title-enhanced",
    "jp-edward-mountains",
    "jp-itory-mountains",
    "jp-wall-dunes",
    "red-fountain",
    "jp-church-cross",
    "enhanced-prologue-text",
    "enhanced-epilogue-text",
    "full-health-herb",
    "pyramid-elevator-speed",
    "pyramid-portal-exit",
    "freejia-shortcut",
    "blue-journal",
    "thankful-flower",
    "south-cape-return",
    "crystal-ring-palette"
];
  let romGenerator: RomGenerator;
  
  describe('Constructor', () => {
    it('should create a rom generator which downloads project summary', () => {
      romGenerator = new RomGenerator("Illusion of Gaia: Retranslated");
      expect(romGenerator).toBeDefined();
    });

    it('should be able to initialize', async () => {
      await romGenerator.initialize();
      expect(romGenerator.branchId).toBeDefined();
      expect(romGenerator.crc).toBeDefined();
    });
  });

  describe('ValidateAndDownload', () => {
    it('should validate and download the project database', async () => {
      const isValid = await romGenerator.validateAndDownload(data);
      expect(isValid).toBe(true);
      expect(romGenerator.dbRoot).toBeDefined();
      expect(romGenerator.dbRoot.baseRomFiles?.length).toBeGreaterThan(0);
      expect(romGenerator.dbRoot.projectFiles?.length).toBeGreaterThan(0);
      expect(romGenerator.dbRoot.entryPoints?.length).toBeGreaterThan(0);
      expect(Object.keys(romGenerator.dbRoot.opCodes ?? {}).length).toBeGreaterThan(0);
      expect(Object.keys(romGenerator.dbRoot.opLookup ?? {}).length).toBeGreaterThan(0);
      expect(Object.keys(romGenerator.dbRoot.addrLookup ?? {}).length).toBeGreaterThan(0);
      expect(Object.keys(romGenerator.dbRoot.stringTypes ?? {}).length).toBeGreaterThan(0);
    });
  });

  describe('GenerateProject', () => {
    it('should generate a rom from project parameters', async () => {
      const outRom = await romGenerator.generateProject(modules);
      await saveFileAsBinary('../../../GaiaLabs.smc', outRom);
    });
  }, 30000);
}); 