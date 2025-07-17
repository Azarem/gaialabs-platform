import { describe, it, expect } from 'vitest';
import { OpCode, ALL_OPCODES, GROUPED_OPCODES, OpCodeUtils } from '../OpCode';
import { AddressingMode, DbRootUtils } from 'gaia-shared';
import { BlockReader } from '../blocks';

describe('BlockReader', () => {

    const data = [];
    const dbRoot = DbRootUtils.fromFolder("../../../../../../ext/GaiaLib/db", "../../../../../../ext/GaiaLib/db/snes");

    const reader = new BlockReader(data, dbRoot);

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