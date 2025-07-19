import { describe, it, expect, beforeAll } from 'vitest';
import fetch from 'node-fetch';
import { OpCode, ALL_OPCODES, GROUPED_OPCODES, OpCodeUtils } from '../../../assembly';
import { AddressingMode, DbRootUtils } from 'gaia-shared';
import { BlockReader } from '../blocks';
import { TableEntry } from 'gaia-shared';
import { BlockWriter } from '../writer';

describe('BlockReader', () => {
  let reader: BlockReader;
  let asmTruth: string;

  beforeAll(async () => {
    const romUrl = process.env.VITE_ROM_URL;
    const romToken = process.env.VITE_ROM_TOKEN;

    if (!romUrl) {
      throw new Error('ROM_URL environment variable not set.');
    }

    const headers: { [key:string]: string } = {};
    if (romToken) {
      headers['Auth-Token'] = romToken;
    }
    
    const asmResponse = await fetch(romUrl + '/asm/actors/sE6_gaia.asm', { headers });
    if (!asmResponse.ok) {
      throw new Error(`Failed to fetch truth file from ${asmResponse.url}: ${asmResponse.statusText}`);
    }
    asmTruth = await asmResponse.text();

    const response = await fetch(romUrl + '/iog.smc', { headers });
    if (!response.ok) {
      throw new Error(`Failed to fetch ROM from ${romUrl}: ${response.statusText}`);
    }
    const buffer = await response.arrayBuffer();
    const data = new Uint8Array(buffer);
    
    const dbRoot = await DbRootUtils.fromFolder(
      '../../ext/GaiaLib/db/us',
      '../../ext/GaiaLib/db/snes'
    );
    reader = new BlockReader(data, dbRoot);
  }, 30000);

  describe('BlockReader class', () => {
    it('should create a block reader with correct properties', () => {
      expect(reader).toBeInstanceOf(BlockReader);
    });

    it('should have a valid dbRoot', () => {
      expect(reader._root).toBeDefined();
    });

  });

  describe('BlockReader.analyzeAndResolve', () => {
    it('should analyze and resolve the blocks', () => {
      reader.analyzeAndResolve();
    });

    it('should have a valid blocks list', () => {
      expect(reader._root.blocks).toBeDefined();
      expect(reader._root.blocks.length).toBeGreaterThan(0);
    });

    it('should be filled with arrays that have at least one element', () => {
      expect(reader._root.blocks.filter(b => Array.isArray(b.parts) && b.parts.length > 0 &&
        b.parts.filter(p => Array.isArray(p.objectRoot) && p.objectRoot.length > 0
          && p.objectRoot.every(o => o.location > 0 && !!o.object)).length == b.parts.length
      ).length).toEqual(reader._root.blocks.length);
    });

    it('should pass a single source of truth', () => {
      const sE6_gaia = reader._root.blocks.find(b => b.name === 'sE6_gaia');
      if (!sE6_gaia) {
        throw new Error('sE6_gaia block not found');
      }
      const writer = new BlockWriter(reader);
      const asm = writer.generateAsm(sE6_gaia, null);
      expect(asm).toEqual(asmTruth);
    });
  });

}); 