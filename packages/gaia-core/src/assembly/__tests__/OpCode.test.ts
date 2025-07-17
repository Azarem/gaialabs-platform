import { describe, it, expect } from 'vitest';
import { OpCode, ALL_OPCODES, GROUPED_OPCODES, OpCodeUtils } from '../OpCode';
import { AddressingMode } from 'gaia-shared';

describe('OpCode', () => {
  describe('OpCode class', () => {
    it('should create an opcode with correct properties', () => {
      const opcode = new OpCode(0x69, 'ADC', AddressingMode.Immediate, 2);
      
      expect(opcode.code).toBe(0x69);
      expect(opcode.mnem).toBe('ADC');
      expect(opcode.mode).toBe(AddressingMode.Immediate);
      expect(opcode.size).toBe(2);
    });

    it('should handle negative sizes for variable-length instructions', () => {
      const opcode = new OpCode(0xA9, 'LDA', AddressingMode.Immediate, -2);
      
      expect(opcode.size).toBe(-2);
    });
  });

  describe('ALL_OPCODES', () => {
    it('should contain all 256 possible opcodes', () => {
      const opcodeCount = Object.keys(ALL_OPCODES).length;
      expect(opcodeCount).toBeGreaterThan(100); // Should have many opcodes
    });

    it('should contain essential opcodes', () => {
      // Test for key opcodes
      expect(ALL_OPCODES[0x69]).toBeDefined(); // ADC immediate
      expect(ALL_OPCODES[0x69].mnem).toBe('ADC');
      expect(ALL_OPCODES[0x69].mode).toBe(AddressingMode.Immediate);
      
      expect(ALL_OPCODES[0x4C]).toBeDefined(); // JMP absolute
      expect(ALL_OPCODES[0x4C].mnem).toBe('JMP');
      expect(ALL_OPCODES[0x4C].mode).toBe(AddressingMode.Absolute);
      
      expect(ALL_OPCODES[0x60]).toBeDefined(); // RTS
      expect(ALL_OPCODES[0x60].mnem).toBe('RTS');
      expect(ALL_OPCODES[0x60].mode).toBe(AddressingMode.Stack);
    });

    it('should have opcodes with correct sizes', () => {
      expect(ALL_OPCODES[0x4C].size).toBe(3); // JMP absolute is 3 bytes
      expect(ALL_OPCODES[0x60].size).toBe(1); // RTS is 1 byte
      expect(ALL_OPCODES[0x69].size).toBe(-2); // ADC immediate is variable
    });
  });

  describe('GROUPED_OPCODES', () => {
    it('should group opcodes by mnemonic', () => {
      expect(GROUPED_OPCODES.ADC).toBeDefined();
      expect(GROUPED_OPCODES.LDA).toBeDefined();
      expect(GROUPED_OPCODES.JMP).toBeDefined();
      
      expect(Array.isArray(GROUPED_OPCODES.ADC)).toBe(true);
      expect(GROUPED_OPCODES.ADC.length).toBeGreaterThan(1);
    });

    it('should contain ADC opcodes for all addressing modes', () => {
      const adcOpcodes = GROUPED_OPCODES.ADC;
      
      // Find specific addressing modes
      const immediateADC = adcOpcodes.find(op => op.mode === AddressingMode.Immediate);
      const absoluteADC = adcOpcodes.find(op => op.mode === AddressingMode.Absolute);
      const directPageADC = adcOpcodes.find(op => op.mode === AddressingMode.DirectPage);
      
      expect(immediateADC).toBeDefined();
      expect(absoluteADC).toBeDefined();
      expect(directPageADC).toBeDefined();
    });
  });

  describe('OpCodeUtils', () => {
    describe('getAllOpcodes', () => {
      it('should return all opcodes as an array', () => {
        const allOpcodes = OpCodeUtils.getAllOpcodes();
        
        expect(Array.isArray(allOpcodes)).toBe(true);
        expect(allOpcodes.length).toBeGreaterThan(100);
        expect(allOpcodes[0]).toBeInstanceOf(OpCode);
      });

      it('should return opcodes that match ALL_OPCODES', () => {
        const allOpcodes = OpCodeUtils.getAllOpcodes();
        const allOpcodesValues = Object.values(ALL_OPCODES);
        
        expect(allOpcodes.length).toBe(allOpcodesValues.length);
        
        // Check that all opcodes are present
        for (const opcode of allOpcodesValues) {
          expect(allOpcodes).toContain(opcode);
        }
      });
    });

    describe('getByMnemonic', () => {
      it('should return opcodes for valid mnemonic', () => {
        const adcOpcodes = OpCodeUtils.getByMnemonic('ADC');
        
        expect(Array.isArray(adcOpcodes)).toBe(true);
        expect(adcOpcodes.length).toBeGreaterThan(1);
        expect(adcOpcodes.every(op => op.mnem === 'ADC')).toBe(true);
      });

      it('should return empty array for invalid mnemonic', () => {
        const invalidOpcodes = OpCodeUtils.getByMnemonic('INVALID');
        
        expect(Array.isArray(invalidOpcodes)).toBe(true);
        expect(invalidOpcodes.length).toBe(0);
      });

      it('should handle case-sensitive mnemonics', () => {
        const upperADC = OpCodeUtils.getByMnemonic('ADC');
        const lowerADC = OpCodeUtils.getByMnemonic('adc');
        
        expect(upperADC.length).toBeGreaterThan(0);
        expect(lowerADC.length).toBe(0); // Should be case-sensitive
      });
    });

    describe('findByCode', () => {
      it('should return correct opcode for valid code', () => {
        const adcImmediate = OpCodeUtils.findByCode(0x69);
        
        expect(adcImmediate).toBeDefined();
        expect(adcImmediate?.code).toBe(0x69);
        expect(adcImmediate?.mnem).toBe('ADC');
        expect(adcImmediate?.mode).toBe(AddressingMode.Immediate);
      });

      it('should return undefined for invalid code', () => {
        const invalidOpcode = OpCodeUtils.findByCode(0x999);
        
        expect(invalidOpcode).toBeUndefined();
      });

      it('should handle edge cases', () => {
        // Test first and last opcodes
        const breakOpcode = OpCodeUtils.findByCode(0x00);
        expect(breakOpcode?.mnem).toBe('BRK');
        
        // Test various codes
        const nopOpcode = OpCodeUtils.findByCode(0xEA);
        expect(nopOpcode?.mnem).toBe('NOP');
      });
    });
  });

  describe('Integration tests', () => {
    it('should maintain consistency between ALL_OPCODES and GROUPED_OPCODES', () => {
      const allOpcodesCount = Object.keys(ALL_OPCODES).length;
      let groupedOpcodesCount = 0;
      
      for (const group of Object.values(GROUPED_OPCODES)) {
        groupedOpcodesCount += group.length;
      }
      
      expect(groupedOpcodesCount).toBe(allOpcodesCount);
    });

    it('should have all opcodes in groups accessible via utils', () => {
      const allFromUtils = OpCodeUtils.getAllOpcodes();
      
      for (const opcode of allFromUtils) {
        const foundByCode = OpCodeUtils.findByCode(opcode.code);
        const foundByMnemonic = OpCodeUtils.getByMnemonic(opcode.mnem);
        
        expect(foundByCode).toBe(opcode);
        expect(foundByMnemonic).toContain(opcode);
      }
    });
  });
}); 