import { defineConfig } from 'vitest/config';
import { resolve } from 'path';

export default defineConfig({
  resolve: {
    alias: {
      '@gaialabs/shared': resolve(__dirname, '../gaia-shared/src'),
    },
  },
  test: {
    chaiConfig: {
      truncateThreshold: 500,
    },
    env: {
      VITE_ROM_URL: process.env.VITE_ROM_URL,
      VITE_ROM_TOKEN: process.env.VITE_ROM_TOKEN,
    },
    setupFiles: ['dotenv/config'],
  },
});