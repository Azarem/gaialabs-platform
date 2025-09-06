import { describe, it, expect } from 'vitest';
import { readFileAsBinary, saveFileAsBinary } from '@gaialabs/shared';
import { RomGenerator } from '../generator';

describe('RomGenerator', async () => {
  const data = await readFileAsBinary('C:/Games/SNES/Illusion of Gaia.smc');
  const modules = ['jp-viper', 'title-enhanced'];
  const romGenerator = new RomGenerator(modules, data);
  
  describe('GenerateProject', () => {
    it('should generate a rom from project parameters', async () => {
      const outRom = await romGenerator.generateProject('Illusion of Gaia: Retranslated');
      await saveFileAsBinary('../../../GaiaLabs.smc', outRom);
    });
  }, 30000);
}); 