# AGENTS Guide - apps/gaia-community

Next.js 14 application used for sharing ROM projects and collaborating with other users.

## Structure
- `app/` – entry pages (`layout.tsx`, `page.tsx`) and global CSS.
- `Dockerfile` & `railway.json` – production deployment via Railway.

## Commands
- `pnpm community:dev` – start the dev server.
- `pnpm community:build` – create a production build.
- `pnpm lint` and `pnpm type-check` – quality checks.

The community site consumes workspace packages and calls the API for data.
