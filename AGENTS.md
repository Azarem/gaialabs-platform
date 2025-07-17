# AGENTS Guide

This repository hosts the **GaiaLabs Platform**, a monorepo for a web-based ROM editing suite.

## Repository Structure
- **Apps** (`apps/`)
  - `gaia-studio` – React 19 + PixiJS ROM editor
  - `gaia-api` – Fastify backend API
  - `gaia-community` – Next.js community platform
- **Packages** (`packages/`)
  - `gaia-core` – Core ROM processing engine
  - `gaia-shared` – Shared TypeScript types/utilities
  - `gaia-ui` – React components & themes
  - `gaia-auth` – Auth helpers
  - `gaia-git` – Git integration utilities
- Additional resources include `ext/GaiaLib` (original C# code), `GAIALIB_TYPESCRIPT_MAPPING.md`, and environment examples in `env.example`.

## Key Documentation (docs/)
- **Primer.md** – SNES development primer covering memory mapping, ROM header structure, DMA, CPU features, graphics modes, debugging tips, and best practices.
- **GaiaLabs-MVP-Roadmap.md** and **GaiaLabs-MVP-Roadmap-v2.md** – Roadmaps describing the vision for a universal ROM editor platform with phased development plans and role-based permissions.
- **AssemblyComparison.md** – Notes on discrepancies between C# disassembly and current TypeScript output (missing COP parameters, rewritten literals, missing include directives) with suggestions for investigation.

## Getting Started
- Install Node.js 20+ and pnpm.
- Run `pnpm install` then `pnpm dev` to start local development.
- See `DEVELOPMENT.md` and package READMEs for per-package commands.

## Next Steps
1. Explore `packages/gaia-core` and its submodules (`assembly/`, `compression/`, `rom/`, etc.).
2. Review the migration mapping in `GAIALIB_TYPESCRIPT_MAPPING.md` to correlate with the C# reference.
3. Run tests located under `__tests__` directories to see usage examples.
4. Consult the docs listed above for SNES technical context and overall project roadmap.

