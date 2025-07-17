import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  plugins: [
    react()
  ],
  resolve: {
    alias: {
      '@': resolve(__dirname, './src'),
      '@gaia/shared': resolve(__dirname, '../../packages/gaia-shared/src'),
      '@gaia/ui': resolve(__dirname, '../../packages/gaia-ui/src'),
      '@gaia/core': resolve(__dirname, '../../packages/gaia-core/src')
    }
  },
  define: {
    global: 'globalThis'
  },
  server: {
    port: 3000,
    host: true
  },
  build: {
    outDir: 'dist',
    sourcemap: true,
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom'],
          pixi: ['pixi.js', '@pixi/react'],
          core: ['gaia-core']
        }
      }
    }
  },
  optimizeDeps: {
    exclude: ['gaia-core']
  },
  worker: {
    format: 'es'
  }
}) 