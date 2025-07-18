# AGENTS Guide - apps/gaia-api

Backend service built with Fastify and Prisma. Application logic is still being migrated from the original C# implementation.

## Folder Structure
- `prisma/` – database schema, migrations and seed scripts.
  - `scripts/seed.ts` populates initial game data from `ext/GaiaLib`.
- `Dockerfile` – container image definition used by Railway.
- `railway.json` – deployment settings.

## Commands
- `pnpm api:dev` – start the API in development mode.
- `pnpm api:build` – compile for production.
- `pnpm api:test` – run vitest tests.

The service exposes endpoints consumed by the Studio and Community apps.
