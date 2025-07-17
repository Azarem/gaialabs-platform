# Development Guide

## Prerequisites

- Node.js 20+ (recommended: use [fnm](https://github.com/Schniz/fnm) or [nvm](https://github.com/nvm-sh/nvm))
- pnpm 10+ (package manager)
- Git

## Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/gaialabs/gaialabs-platform.git
   cd gaialabs-platform
   ```

2. **Install dependencies**
   ```bash
   pnpm install
   ```

3. **Build all packages**
   ```bash
   pnpm run build
   ```

4. **Start development**
   ```bash
   # Start all development servers
   pnpm run dev:full
   
   # Or start specific components
   pnpm run studio:dev    # Gaia Studio (main editor)
   pnpm run api:dev       # Backend API
   pnpm run core:dev      # Core library
   ```

## Development Commands

### Building
```bash
# Build everything
pnpm run build

# Build specific components
pnpm run packages:build  # All packages
pnpm run apps:build      # All applications
pnpm run core:build      # Core library only
pnpm run studio:build    # Studio app only
```

### Development Servers
```bash
# Start all development servers in parallel
pnpm run dev:full

# Start specific development servers
pnpm run studio:dev      # Gaia Studio
pnpm run community:dev   # Community site
pnpm run api:dev         # Backend API
pnpm run packages:dev    # All packages
```

### Code Quality
```bash
# Run all quality checks
pnpm run check-all       # Type check + lint + format check

# Fix all auto-fixable issues
pnpm run fix-all         # Format + lint fix

# Individual checks
pnpm run lint            # Lint all code
pnpm run lint:fix        # Fix linting issues
pnpm run type-check      # TypeScript type checking
pnpm run format          # Format all code
pnpm run format:check    # Check formatting
```

### Testing
```bash
# Run all tests
pnpm run test

# Run tests in watch mode
pnpm run test:watch
```

### Database (API)
```bash
# Generate Prisma client
pnpm run db:generate

# Push schema changes to database
pnpm run db:push

# Run migrations
pnpm run db:migrate
```

## Project Structure

```
gaialabs-platform/
├── apps/                    # Applications
│   ├── gaia-studio/        # Main ROM editor (Vite + React)
│   ├── gaia-community/     # Community site (Next.js)
│   └── gaia-api/           # Backend API (Fastify + Prisma)
├── packages/               # Shared packages
│   ├── gaia-core/          # Core ROM processing library
│   ├── gaia-shared/        # Shared types and utilities
│   ├── gaia-auth/          # Authentication utilities
│   ├── gaia-git/           # Git integration
│   └── gaia-ui/            # UI components
├── ext/                    # External dependencies
│   └── GaiaLib/            # Original C# library (reference)
└── docs/                   # Documentation
```

## Architecture

### Core Philosophy
- **Universal TypeScript**: Core logic runs in browser, Node.js, and Web Workers
- **React 19**: Modern React with concurrent features
- **Monorepo**: Turborepo for efficient builds and caching
- **Type Safety**: Strict TypeScript with Zod validation

### Key Technologies
- **Frontend**: React 19, Vite, TailwindCSS
- **Backend**: Fastify, Prisma, PostgreSQL
- **Build**: Turborepo, tsup, TypeScript
- **Testing**: Vitest, React Testing Library
- **Linting**: ESLint, Prettier

## Development Workflow

### 1. Working on Core Library
```bash
# Start core development
pnpm run core:dev

# Test changes in studio
pnpm run studio:dev
```

### 2. Working on UI Components
```bash
# Start UI package development
cd packages/gaia-ui
pnpm run dev

# Start Storybook (if available)
pnpm run storybook
```

### 3. Working on Studio
```bash
# Start studio with hot reload
pnpm run studio:dev

# Build for production
pnpm run studio:build
```

### 4. Working on API
```bash
# Start API development
pnpm run api:dev

# Database operations
pnpm run db:generate
pnpm run db:push
```

## Code Style

### ESLint Configuration
- Strict TypeScript rules
- React 19 compatibility
- Unused variable detection (prefix with `_` to ignore)
- Console warnings allowed for `warn` and `error`

### Prettier Configuration
- Single quotes
- Trailing commas (ES5)
- 2-space indentation
- 80 character line width
- LF line endings

### TypeScript
- Strict mode enabled
- ES2022 target
- Path mapping for clean imports
- Composite project structure

## Troubleshooting

### Common Issues

1. **Build failures**: Run `pnpm run clean` then `pnpm run build`
2. **Type errors**: Run `pnpm run type-check` to see detailed errors
3. **Lint issues**: Run `pnpm run lint:fix` to auto-fix
4. **Package resolution**: Delete `node_modules` and run `pnpm install`

### Performance Tips

1. Use `pnpm run dev:full` for parallel development
2. Turborepo caching speeds up repeated builds
3. Use `--filter` to build specific packages only
4. Hot reload is enabled for all development servers

## Contributing

1. Create a feature branch
2. Make your changes
3. Run `pnpm run check-all` to ensure quality
4. Submit a pull request

## Environment Variables

### Studio (.env.local)
```
VITE_API_URL=http://localhost:3001
```

### API (.env.local)
```
DATABASE_URL=postgresql://...
SUPABASE_URL=https://...
SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_ROLE_KEY=...
```

### Community (.env.local)
```
NEXT_PUBLIC_API_URL=http://localhost:3001
``` 