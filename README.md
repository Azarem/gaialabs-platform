# GaiaLabs Platform

**Universal ROM Editor Platform** - A modern, web-based ROM editing suite using TypeScript and React 19, designed for collaborative retro game development.

## 🎯 Project Vision

Transform GaiaLabs into a modern, web-based ROM editing suite starting with **SNES-only support** and expanding to a universal platform that can support multiple retro games through database-driven ROM definitions.

## 🏗️ Architecture

### Apps
- **`gaia-studio`** - React 19 + PixiJS ROM editor application
- **`gaia-api`** - Node.js + TypeScript backend API
- **`gaia-community`** - Next.js community platform for project sharing

### Packages
- **`gaia-core`** - TypeScript build engine for ROM processing (browser + Node.js)
- **`gaia-shared`** - Shared types and utilities
- **`gaia-ui`** - Shared React components and design system
- **`gaia-auth`** - Authentication utilities
- **`gaia-git`** - Git integration utilities

### Technology Stack
- **Frontend**: React 19, PixiJS v8, TypeScript
- **Backend**: Node.js, Fastify, TypeScript
- **Database**: Supabase (PostgreSQL + real-time)
- **Storage**: Supabase Storage (with global CDN)
- **Build**: Turborepo, Vite, tsup
- **Hosting**: Railway (apps) + Supabase (data/storage)

## 🚀 Getting Started

### Prerequisites
- Node.js 20+ 
- pnpm 8+
- Git

### Installation

```bash
# Clone the repository
git clone https://github.com/gaialabs/gaialabs-platform.git
cd gaialabs-platform

# Install dependencies
pnpm install

# Build all packages
pnpm build

# Start development servers
pnpm dev
```

### Development Commands

```bash
# Build all packages and apps
pnpm build

# Start all development servers
pnpm dev

# Run tests
pnpm test
pnpm test:watch

# Lint and format
pnpm lint
pnpm format
pnpm format:check

# Type checking
pnpm type-check

# Clean all build outputs
pnpm clean
```

### Package-specific commands

```bash
# Core library
pnpm core:build
pnpm core:dev

# Studio app
pnpm studio:dev
pnpm studio:build

# API server
pnpm api:dev
pnpm api:build

# Community platform
pnpm community:dev
pnpm community:build

# Build only packages
pnpm packages:build

# Build only apps
pnpm apps:build
```

## 📦 Package Structure

```
gaialabs-platform/
├── apps/
│   ├── gaia-studio/          # React ROM editor
│   ├── gaia-api/             # Node.js API server
│   └── gaia-community/       # Next.js community platform
├── packages/
│   ├── gaia-core/            # Core ROM processing engine
│   ├── gaia-shared/          # Shared types and utilities
│   ├── gaia-ui/              # Shared React components
│   ├── gaia-auth/            # Authentication utilities
│   └── gaia-git/             # Git integration utilities
├── docs/                     # Documentation
├── ext/                      # External references (GaiaLib)
└── [config files]
```

## 🔧 Development Workflow

### 1. Package Development
- Packages are built with `tsup` for optimal bundling
- Use `pnpm dev` in package directories for watch mode
- Packages export multiple formats (ESM, CJS, types)

### 2. App Development
- Apps consume packages via workspace dependencies
- Use `pnpm dev` to start development servers
- Hot reload is enabled for rapid development

### 3. Testing
- Run `pnpm test` for all packages
- Use `pnpm test:watch` for continuous testing
- Coverage reports are generated automatically

### 4. Version Management
- Use changesets for version management
- Run `pnpm changeset` to create a changeset
- Run `pnpm version-packages` to bump versions

## 🌐 Deployment

### Development
- **Local**: Use `pnpm dev` for local development
- **Preview**: Railway provides preview deployments for PRs

### Production
- **Apps**: Deployed to Railway
- **Database**: Supabase PostgreSQL with real-time
- **Storage**: Supabase Storage with global CDN
- **CI/CD**: GitHub Actions

## 📚 Documentation

- [MVP Roadmap](./docs/GaiaLabs-MVP-Roadmap-v2.md)
- [Deployment Guide](./DEPLOYMENT.md)
- [Supabase Setup](./SUPABASE_SETUP.md)
- [API Documentation](./apps/gaia-api/README.md)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Run `pnpm lint` and `pnpm test`
6. Create a changeset with `pnpm changeset`
7. Submit a pull request

## 📝 Scripts Reference

| Command | Description |
|---------|-------------|
| `pnpm build` | Build all packages and apps |
| `pnpm dev` | Start all development servers |
| `pnpm test` | Run all tests |
| `pnpm lint` | Lint all code |
| `pnpm format` | Format all code |
| `pnpm type-check` | Type check all TypeScript |
| `pnpm clean` | Clean all build outputs |
| `pnpm changeset` | Create a changeset for version management |

## 🎮 Supported Games

Currently focusing on **SNES** games with initial support for:
- Illusion of Gaia / Illusion of Time
- *(More games to be added based on community database contributions)*

## 🔮 Future Plans

- Multi-game support through database-driven ROM definitions
- Advanced collaborative editing features
- Plugin system for custom ROM hacking tools
- Mobile companion app
- Community marketplace for ROM modifications

## 📄 License

MIT - See [LICENSE](./LICENSE) for details.

## 🙏 Acknowledgments

- Built upon the foundation of the original GaiaLib C# library
- Inspired by the ROM hacking community
- Powered by modern web technologies 
