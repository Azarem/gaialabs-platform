# AGENTS Guide - apps/gaia-studio

Gaia Studio is the browser-based ROM editor built with React 19, Vite and PixiJS.

## Structure
- `src/` – entry files `main.tsx` and `App.tsx`.
- `vite.config.ts` – Vite configuration.
- `Dockerfile` and `nginx.conf` – production container setup.

## Commands
- `pnpm studio:dev` – start the Vite dev server.
- `pnpm studio:build` – create a production build.
- `pnpm lint`, `pnpm type-check` and `pnpm test` – run quality checks.

The studio relies on workspace packages like `gaia-core` and `gaia-ui`. Rebuild those packages if you change them before starting the studio.
