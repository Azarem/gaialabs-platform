# AGENTS Guide - apps/

This directory holds the runnable applications that make up the GaiaLabs platform. Each project can be started from the repo root using `pnpm <app>:dev`.

## Projects

### gaia-studio
React 19 + PixiJS editor built with Vite.
- Source code in `src/` (`main.tsx`, `App.tsx`).
- Production container uses `nginx.conf` and the provided `Dockerfile`.

### gaia-api
Fastify backend service.
- Database schema and migrations live under `prisma/`.
- Seed script at `prisma/scripts/seed.ts` imports ROM data from `ext/GaiaLib`.
- Deployment configuration via `Dockerfile` and `railway.json`.

### gaia-community
Next.js 14 app router site for sharing projects.
- Pages reside in the `app/` directory (`layout.tsx`, `page.tsx`).
- Global styles in `app/globals.css`.

Run `pnpm <app>:build` to create a production build. See each app folder for more scripts and environment variables.
