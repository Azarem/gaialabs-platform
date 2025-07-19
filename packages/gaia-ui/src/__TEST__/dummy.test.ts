import { describe, expect, it } from 'vitest';
import { defaultTheme } from '../index';


describe('Testing Gaia UI', () => {

  describe('Types', () => {
    it('should create a block reader with correct properties', () => {
        expect(defaultTheme).toBeDefined();
    });

  });

}); 