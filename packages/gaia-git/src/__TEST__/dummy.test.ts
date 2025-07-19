import { describe, expect, it } from 'vitest';
import { GitService } from '../index';


describe('Testing Gaia Git', () => {

  describe('Types', () => {
    it('Something should be defined', () => {
        expect(GitService).toBeDefined();
    });

  });

}); 