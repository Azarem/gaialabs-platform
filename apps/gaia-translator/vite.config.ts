import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
  server: {
    port: 3003,
    host: true,
    open: true,
    watch: {
      usePolling: true
    }
  },
  build: {
    outDir: 'dist',
    sourcemap: true,
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom'],
          router: ['react-router-dom'],
          ui: ['@gaialabs/ui'],
          supabase: ['@supabase/supabase-js'],
          forms: ['react-hook-form', '@hookform/resolvers'],
          utils: ['date-fns', 'clsx', 'zod'],
        },
      },
    },
    // Ensure public files are copied
    copyPublicDir: true,
  },
  optimizeDeps: {
    include: [
      'react',
      'react-dom',
      'react-router-dom',
      '@supabase/supabase-js',
      '@gaialabs/ui',
      'react-hook-form',
      '@hookform/resolvers',
      'date-fns',
      'clsx',
      'zod',
      'zustand',
    ],
  },
  define: {
    // Define environment variables for the client
    __DEV__: JSON.stringify(process.env.NODE_ENV === 'development'),
  },
  css: {
    postcss: './postcss.config.js',
  },
  // Enable environment variables with VITE_ prefix
  envPrefix: ['VITE_', 'SUPABASE_', 'DATABASE_'],
})
