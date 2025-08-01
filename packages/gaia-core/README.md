# gaia-core

Core ROM processing engine for the GaiaLabs platform.

This package exposes TypeScript libraries for reading, writing and rebuilding ROMs. It runs in both Node.js and the browser and is referenced by the studio and API applications.

See the [project root README](../../README.md) for an overview of the monorepo.

## Directory overview

- `assembly/` – CPU opcode helpers and stack/register utilities.
- `compression/` – compression providers such as `QuintetLZ` with tests.
- `rom/` – project parsing, extraction and rebuild pipeline.
- `sprites/` – sprite map and frame helpers.
- `api/` – high-level `ProjectManager` and `RomProcessor` classes.
- `__tests__/` – vitest unit tests.

## Common commands

```bash
pnpm dev          # build in watch mode with tsup
pnpm build        # output ESM/CJS bundles
pnpm test         # run unit tests with vitest
pnpm type-check   # run the TypeScript compiler
```

The original C# implementation lives under `ext/GaiaLib` and serves as a reference.
