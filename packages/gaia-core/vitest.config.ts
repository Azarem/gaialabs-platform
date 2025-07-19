import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    chaiConfig: {
      truncateThreshold: 0,
    },
    env: {
      VITE_ROM_URL: process.env.VITE_ROM_URL,
      VITE_ROM_TOKEN: process.env.VITE_ROM_TOKEN,
    },
    setupFiles: ['dotenv/config'],
  },
}); 