# AGENTS Guide - packages/gaia-core

The core TypeScript library implementing ROM extraction and rebuild logic.

## Key Directories
- `assembly/` – CPU opcodes and stack/ register utilities.
- `compression/` – compression providers such as `QuintetLZ` with tests.
- `rom/` – project parsing, extraction and rebuild pipeline.
- `sprites/` – sprite map and frame helpers.
- `api/` – high-level `ProjectManager` and `RomProcessor` classes.

## Commands
- `pnpm dev` – build with tsup in watch mode.
- `pnpm build` – produce ESM/CJS bundles.
- `pnpm test` – run vitest unit tests located under `__tests__/`.
- `pnpm type-check` – run the TypeScript compiler.

This package targets both browser and Node environments. See the original implementation in `ext/GaiaLib` for reference.
