# AGENTS Guide

This repository contains the **GaiaLabs Platform** monorepo. Use this guide to understand the high level layout.

## Repository Overview

- **apps/** – deployable applications
  - **gaia-studio/** – Vite powered React 19 + PixiJS editor. Source lives in `src/` with `App.tsx` as the main entry.
  - **gaia-api/** – Fastify backend with Prisma. Database schema and migrations are under `prisma/`.
  - **gaia-community/** – Next.js 14 community site using the `app/` directory.
- **packages/** – shared TypeScript libraries
  - **gaia-core/** – ROM processing engine. Modules include `assembly/`, `compression/`, `rom/`, `sprites/` and more.
  - **gaia-shared/** – Common data definitions and helpers found in `database/`, `project/`, `types/`, etc.
  - **gaia-ui/** – React components and design tokens.
  - **gaia-auth/** – Authentication service wrappers.
  - **gaia-git/** – Git and GitHub helpers.
- **docs/** – Technical references like `Primer.md` and roadmap documents.
- **ext/** – External references including the original C# project `GaiaLib`.
- **truth/** – Reference assembly output for regression checking.

## Getting Started

Install Node.js 20+ and pnpm. Run `pnpm install` and then `pnpm dev` from the repo root to start all apps. See each package's AGENTS guide for additional commands.

## Next Steps

1. Explore `packages/gaia-core/src` for the main ROM engine implementation.
2. Review documentation under `docs/` for SNES technical context and project planning.
3. Compare features with the C# code in `ext/GaiaLib` when porting functionality.
