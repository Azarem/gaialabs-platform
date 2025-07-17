import { describe, it, expect, beforeAll } from 'vitest';
import { OpCode, ALL_OPCODES, GROUPED_OPCODES, OpCodeUtils } from '../OpCode';
import { AddressingMode, DbRootUtils } from 'gaia-shared';
import { BlockReader } from '../blocks';


describe('BlockReader', () => {
  let reader: BlockReader;

  beforeAll(async () => {
    const data = new Uint8Array();
    const dbRoot = await DbRootUtils.fromFolder(
      '../../ext/GaiaLib/db/us',
      '../../ext/GaiaLib/db/snes'
    );
    reader = new BlockReader(data, dbRoot);
  });

  describe('BlockReader class', () => {
    it('should create a block reader with correct properties', () => {
    });

  });

  describe('BlockReader.analyzeAndResolve', () => {
    it('should analyze and resolve the blocks', () => {
      reader.analyzeAndResolve();
    });
  });

}); 