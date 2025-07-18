# AGENTS Guide - packages/

Reusable TypeScript libraries shared between the applications. Each package is built with `tsup` and can be developed independently.

- **gaia-core/** – main ROM processing engine.
- **gaia-shared/** – common data definitions and utilities.
- **gaia-ui/** – React components and design tokens.
- **gaia-auth/** – authentication helpers.
- **gaia-git/** – Git integration utilities.

Run `pnpm build` from the repo root to compile all packages or `pnpm <package>:dev` within a package directory to watch for changes.
