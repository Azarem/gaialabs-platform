# GaiaLabs MVP Roadmap v2

**Project Vision**: Transform GaiaLabs into a modern, web-based ROM editing suite using WebAssembly and React, starting with **SNES-only support** and expanding to a universal platform that can support multiple retro games through database-driven ROM definitions.

---

## 🎯 Executive Summary

### Current State
- **GaiaLib**: C# .NET 8.0 core library (✅ Keep as reference)
- **GaiaPacker**: C# front-end tool (❌ Replace)
- **GaiaCompressor**: Standalone utility (❌ Replace)
- **GaiaApi**: Web API (❌ Replace)
- **GaiaLabs**: Godot C# visual editor (❌ Replace)

### Target State
- **GaiaBuild**: A unified TypeScript build engine for all ROM processing, running in-browser (via Web Worker) and on the server via Node.js.
- **GaiaStudio**: React + PixiJS ROM editor application.
- **GaiaCommunity**: Next.js community platform for project sharing.
- **GaiaAPI**: Node.js + TypeScript backend for orchestration.
- **Database-Driven Architecture**: Support for multiple games through JSON ROM definitions stored in a relational database.
- **Cloud-Native Infrastructure**: Hosted on a modern cloud platform like Railway with unified storage and CDN via Supabase Storage.
- **Unified Ecosystem**: Complete web-based platform for retro ROM editing, sharing, and collaboration.

### Key Benefits
- **Cross-platform**: Works on any device with a modern browser.
- **Multi-game Support**: Extensible to any retro game with a ROM database definition.
- **Complete Ecosystem**: Editing, sharing, documentation, and collaboration in one place.
- **Performance**: A highly responsive "Live Preview" build system powered by modern JavaScript engines, with a clear path for future performance optimizations.
- **Maintainability**: A unified monorepo with a modern, single-language (TypeScript) stack, simplifying development and reducing complexity.
- **Accessibility**: No installation required, shareable via URL.
- **Community Driven**: Project sharing, collaboration, and database contributions.
- **Seamless Integration**: One-click workflow from community browsing to project editing.
- **Secure & Scalable**: Architecture designed for security, scalability, and cost-efficiency from day one.

---

## 🏗️ Technical Architecture

### Data & Content Storage Strategy

A successful platform requires a clear strategy for storing different types of data, balancing performance, cost, security, and version control. GaiaLabs will use a three-pillar approach:

#### 1. **GitHub Repositories**: For Project Source Code
- **What:** The user's actual modification work. Each "Project" on the platform corresponds to a Git repository.
- **Content:**
    - TSAL source code (`.ts`)
    - Custom patches (`.asm`)
    - Module configurations (`.json`)
    - Project-specific documentation
- **Why:** This is the industry standard for source code. It provides best-in-class version control, a powerful collaboration workflow (branches, pull requests, reviews), and is legally the safest approach. The stored content is transformative code, not copyrighted game assets.

#### 2. **Object Storage (Supabase Storage)**: For Binary Assets
- **What:** All binary assets associated with a project, and the base ROMs for production builds.
- **Content:**
    - User-uploaded screenshots (`.png`, `.jpg`)
    - Custom graphics (`.bin`), palettes (`.pal`), music (`.spc`)
    - Final distributable patch files (`.bps`) created by the build system.
    - Known clean base ROMs (stored privately and accessed only by the CI/CD system).
- **Why:** This approach is highly scalable, performant (via global CDN), and secure. Using **Supabase Storage** provides unified platform integration with auth and database, automatic cache invalidation, and built-in image optimization, making it ideal for a platform that will serve many assets.

#### 3. **PostgreSQL Database**: For Metadata and Relational Data
- **What:** The central "source of truth" that structures and connects all platform entities.
- **Content:**
    - User accounts, permissions, and roles.
    - Project metadata (name, description, owner, link to the GitHub repo).
    - The community-managed ROM **Databases** (the `blocks.json`, `structs.json`, etc., that define a game's structure).
    - Pointers/links to the binary assets stored in Cloudflare R2.
    - Real-time collaboration state (e.g., the current state of a tilemap being edited, which gets broadcast on change).
- **Why:** PostgreSQL is perfect for structured queries, enforcing data integrity, and its `jsonb` type is ideal for semi-structured database definitions. When combined with a provider like **Supabase**, it also becomes the engine for real-time collaboration.

##### **Database Tenancy Model: Unified Shared Database**
To support the platform's rich community features, GaiaLabs will use a **single, shared PostgreSQL database** for all games and users. A "database-per-game" or "silo" approach was rejected as it would make cross-game queries (e.g., "show all contributions by a specific user") prohibitively complex and would be an operational nightmare to maintain, back up, and scale.

Our unified model logically separates game-specific data using foreign keys. For example, a `game_database_versions` table will track specific releases of a game's structural definition (e.g., `Illusion of Gaia v1.1`), and all related data (in tables like `blocks`, `structs`, etc.) will link back to a specific version ID. This approach is highly scalable using standard PostgreSQL features like indexing and, if needed, table partitioning, while ensuring all platform data remains interconnected.

### Technology Stack
- **Core Logic (`gaia-core`)**: **TypeScript**. A new `gaia-core` package will contain a unified build engine for all ROM processing logic. This code will run directly in the browser (inside a Web Worker for responsiveness) and on the server via Node.js, ensuring 100% build parity between the "Live Preview" and "Production Build" environments. This decision prioritizes development velocity, simplicity, and maintainability for the MVP.
- **Backend API (`GaiaAPI`)**: **Node.js with TypeScript**, using a lightweight framework like Express.js or Fastify. This allows for type sharing with the frontend and is perfectly suited for its role as a fast orchestrator.
- **Frontend (`GaiaStudio`)**: **React 19 + PixiJS v8 with TypeScript**.
- **Community Platform (`GaiaCommunity`)**: **Next.js 14+**.
- **Database & Authentication**: **Supabase** for PostgreSQL with built-in real-time features and unified authentication (no NextAuth.js required).
- **Asset Storage**: **Supabase Storage**, for its global CDN, smart caching, and unified platform integration.
- **Monorepo Management**: **Turborepo**.
- **CI/CD**: **GitHub Actions**.
- **Hosting**: **Railway**, for its excellent developer experience, integrated services, and cost-effective scaling.
- **Unified Platform**: **Supabase** provides database, authentication, real-time features, and asset storage with global CDN - eliminating the need for multiple services.

#### Architectural Decision: Why Not Edge.js?
An alternative path for integrating the existing `GaiaLib` (C#) logic would be to use a bridge like `Edge.js`. This path is **strongly discouraged** for the following reasons:
- **Obsolete Technology**: The `Edge.js` project and its forks are largely unmaintained, creating a significant dependency risk.
- **Deployment Complexity**: It would require running both .NET and Node.js runtimes in the same environment, complicating deployment, breaking the simple container model, and increasing infrastructure fragility.
- **Contradicts the Vision**: It is a short-term hack that directly conflicts with the strategic goal of creating a portable, future-proof core with Rust and WebAssembly.

### ROM Build Strategy: A Dual Approach

To provide both a rapid development experience and reproducible, shareable builds, GaiaLabs will implement two distinct ROM building flows.

#### 1. The "Live Preview" Build (In-Browser)
This flow is designed for instantaneous feedback during development and occurs entirely on the user's machine.

- **Process:**
    1.  **Load Local ROM**: The user opens their project and selects their legally-owned base ROM file from their local disk. This file is loaded into the browser's memory and is **never uploaded**.
    2.  **Fetch Project Files**: The app fetches the project's source files (the "diff") from its GitHub repository.
    3.  **In-Browser Build**: The `gaia-core` library, running inside a **Web Worker** to avoid blocking the UI, takes the base ROM from memory and the project files, and "stitches" a new, patched ROM in memory. All logic, including asset processing and assembly, is handled in TypeScript.
    4.  **Instant Preview**: The resulting ROM buffer is passed directly to a browser-based SNES emulator for immediate testing.
- **Advantages**:
    - **Extremely Fast**: No network latency for builds.
    - **Secure**: Copyrighted ROM data never leaves the user's computer.
    - **Efficient**: Only the small project files are downloaded.

#### 2. The "Production" Build (via CI/CD)
This flow is used to create official, shareable patch files and is triggered by a Git push or release.

- **Process:**
    1.  **Trigger**: A user pushes to the `main` branch or creates a release tag in GitHub.
    2.  **CI/CD Pipeline**: A GitHub Actions workflow starts.
    3.  **Fetch Clean ROM**: The build environment fetches a known-clean version of the base ROM from a **private and secure Supabase Storage bucket**.
    4.  **Native Build**: The `gaia-core` library, running in a **Node.js** environment, applies the project's patches to the clean ROM.
    5.  **Generate Artifacts**: The primary output is a `.bps` patch file, not the full ROM.
    6.  **Create Release**: The `.bps` file is automatically attached to the GitHub Release, ready for public distribution.
- **Advantages**:
    - **Reproducible**: Builds are always consistent.
    - **Shareable**: Produces a legally safe patch file that anyone can use.
    - **Automated**: No manual steps required from the user.

### Asset Upload Workflow
To ensure the backend API remains fast and scalable, all binary asset uploads will use a pre-signed URL workflow, offloading the bandwidth-intensive work to the object storage service.

1.  **Request Upload**: The client informs the API it wants to upload a file.
2.  **Generate Secure URL**: The API requests a secure, temporary upload URL from Supabase Storage.
3.  **Direct Client Upload**: The client uploads the file **directly to Supabase Storage** using the provided URL. The large file never passes through the API server.
4.  **Confirm Upload**: The client notifies the API upon completion, and the API saves the file's location to the project's database record.

### Real-time Collaboration Architecture

Supabase's real-time engine enables powerful collaborative features that are essential for the GaiaLabs platform:

#### Live Editing Features
- **Tilemap Collaboration**: Multiple users can edit the same tilemap simultaneously with real-time cursor positions and change propagation
- **Sprite Editing**: Live updates when team members modify sprite frames, groups, or properties
- **Palette Synchronization**: Real-time color palette changes across all connected editors
- **Project Status Updates**: Live notifications when builds complete, errors occur, or collaborators join/leave

#### Technical Implementation
- **WebSocket Connections**: Supabase manages persistent connections for each client
- **Row Level Security**: Ensures users only see changes they're authorized to view
- **Conflict Resolution**: Operational transforms for handling simultaneous edits
- **Presence Indicators**: Show which users are currently editing specific assets

#### Collaboration Workflow
1. **User Joins Project**: Subscribe to real-time changes for project assets
2. **Edit Broadcast**: Changes are immediately sent to Supabase and propagated to other users
3. **Conflict Detection**: Automatic handling of simultaneous edits with merge strategies
4. **Change History**: All edits are logged for audit trails and rollback capabilities

---

*The rest of the document continues from the original, with "Hosting & Infrastructure Strategy" updated to reflect these decisions.*

---

## 🏗️ Hosting & Infrastructure Strategy

### Primary Hosting Recommendation: Railway

**Railway** is the recommended hosting platform for GaiaLabs. It provides the ideal balance of developer experience, integrated services, cost-effectiveness, and scalability for this project's needs, and natively supports the entire recommended technology stack.

#### Why Railway is Perfect for GaiaLabs

- **Full-Stack Platform Support**: Natively supports deploying Next.js frontends, Node.js backend services, PostgreSQL databases, and Docker containers for the Rust/WASM build service.
- **Developer Experience Excellence**: Git-based deployments, automatic builds, preview deployments for every pull request, and an intuitive dashboard simplify infrastructure management.
- **Cost-Effective Scaling**: A pay-per-use model that is significantly cheaper than alternatives at scale, with no surprise bandwidth charges.
- **Integrated Tooling**: Built-in monitoring, logging, and secret management.

### Asset Storage & CDN: Supabase Storage

**Supabase Storage** is the recommended solution for all binary asset storage, providing a unified platform with excellent CDN capabilities.

- **Global CDN**: Built-in CDN with over 285 cities globally for fast asset delivery worldwide
- **Smart CDN**: Automatically invalidates cache when assets are updated or deleted (Pro plan and above)
- **S3-Compatible API**: Allows for the use of mature, well-documented S3 client libraries for managing uploads and downloads
- **Image Transformations**: Built-in image optimizer for resizing and compressing media files on the fly
- **Unified Platform**: Seamless integration with Supabase Auth and database for consistent security policies
- **Cost Effective**: Competitive pricing with no surprise bandwidth charges

### Deployment Architecture on Railway

The platform will be deployed as a series of interconnected services within a single Railway project, managed by a monorepo.

- **Services**:
    - `gaia-community`: The Next.js application.
    - `gaia-studio`: The static React + PixiJS application.
    - `gaia-docs`: The static Docusaurus site.
    - `gaia-api`: The Node.js backend API.
    - `supabase`: External PostgreSQL database with real-time features.
    - *(Optional)* `redis`: For caching or queueing if needed.
- **Builds**: GitHub Actions will be used for CI/CD, triggering deployments to Railway on pushes to the main branch. The same system will handle the "Production Build" workflow for generating `.bps` patch files.

### Database Strategy: Supabase (PostgreSQL with Real-time Features)
- **Primary Choice (Supabase)**: For projects prioritizing real-time collaboration, Supabase offers an excellent "Postgres with superpowers" solution. Its built-in real-time engine allows clients to subscribe to database changes directly, which is a massive accelerator for building collaborative features like live editor updates.
- **Key Benefits**: 
  - **Real-time Subscriptions**: Live collaboration on tilemap/sprite editing
  - **Row Level Security**: Fine-grained access control for multi-tenant projects
  - **Auto-generated APIs**: RESTful and GraphQL endpoints out of the box
  - **Unified Authentication**: OAuth providers (GitHub, Discord) with JWT tokens - **no NextAuth.js required**
  - **Edge Functions**: Server-side logic for ROM processing and Git webhooks
  - **Automatic Backups**: Point-in-time recovery and data protection
  - **Simplified Architecture**: Single platform for database, auth, real-time, and APIs

---

*(The remainder of the original document, including Development Phases, Success Criteria, Risk Assessment, etc., follows. The plans within are compatible with this updated architectural strategy.)*

---

## 📅 Development Phases

### Phase 1: Foundation (Weeks 1-4)
**Goal**: Establish project structure and core WASM functionality

#### Week 1: Project Setup
- [ ] Initialize monorepo with Turborepo
- [ ] Create core logic project (`gaia-core`) for the TypeScript build engine
- [ ] Set up Node.js API project (`gaia-api`)
- [ ] Create React application (`gaia-studio`) with Vite + PixiJS
- [ ] Configure TypeScript and shared type definitions (`gaia-shared`)
- [ ] Set up CI/CD pipeline with GitHub Actions to deploy to Railway

#### Week 2: Core Data Structures
- [ ] Implement Address, Location, and ChunkFile types in TypeScript
- [ ] Implement BitStream class in TypeScript
- [ ] Write initial unit tests
- [ ] Design collaboration and permission type definitions

#### Week 3: Compression Engine
- [ ] Implement custom LZ compression algorithm in TypeScript
- [ ] Implement expand() and compact() methods
- [ ] Add comprehensive test suite with existing test data

#### Week 4: Database System
- [ ] Implement JSON database loading in TypeScript with multi-game support
- [ ] Implement game detection and database selection
- [ ] Create database validation and consistency checks
- [ ] Add schema validation for new game databases
- [ ] Implement database versioning and migration system
- [ ] Test with existing Illusion of Gaia database files
- [ ] Create documentation for database contribution process

**Deliverables**:
- Functional TypeScript build engine with core data structures
- React application shell with build engine integration
- Automated test suite with >90% coverage
- GitHub API integration framework

### Phase 2: ROM Processing (Weeks 5-8)
**Goal**: Implement complete ROM extraction and building pipeline

#### Week 5: ROM File Handling
- [ ] Port RomState and file I/O operations with multi-game support
- [ ] Implement universal ROM format validation
- [ ] Add automatic game detection from ROM headers/checksums
- [ ] Create ROM data streaming for large files
- [ ] Add progress reporting for long operations
- [ ] Implement game-specific ROM processing pipelines

#### Week 6: Asset Extraction
- [ ] Port FileReader functionality
- [ ] Implement SfxReader for sound effects
- [ ] Create BlockReader with dependency resolution
- [ ] Add asset categorization (BinType enum)
- [ ] Implement parallel extraction for performance

#### Week 7: ROM Building
- [ ] Port RomWriter and patching system
- [ ] Implement transform and override systems
- [ ] Add FLIPS patch generation
- [ ] Create ROM validation and integrity checks
- [ ] Add build progress tracking
- [ ] Implement module-based ROM building

#### Week 8: Assembly Processing
- [ ] Port 65816 assembly parser and analyzer
- [ ] Implement OpCode system with mnemonics
- [ ] Add assembly generation and formatting
- [ ] Create disassembly with symbol resolution
- [ ] Add assembly validation and error reporting

**Deliverables**:
- Complete ROM processing pipeline in TypeScript
- Asset extraction with progress reporting
- ROM building with patch generation
- Assembly processing with validation
- Module system for conditional ROM modifications

### Phase 3: Visual Editors (Weeks 9-12)
**Goal**: Create PixiJS-based visual editing interfaces

#### Week 9: Tilemap Editor
- [ ] Create PixiJS container system for tiles
- [ ] Implement pan, zoom, and selection tools
- [ ] Add tile painting with mouse/touch support
- [ ] Create tilemap resizing functionality  
- [ ] Add grid overlay and snapping

#### Week 10: Tileset Editor
- [ ] Build tile property editing interface
- [ ] Implement graphics selection from VRAM
- [ ] Add palette assignment controls
- [ ] Create tile transformation previews
- [ ] Add collision property editing

#### Week 11: Sprite Editor
- [ ] Create sprite set management interface
- [ ] Implement frame-based editing system
- [ ] Add sprite group and part editors
- [ ] Create animation preview system
- [ ] Add sprite property panels

#### Week 12: Palette Editor
- [ ] Build color picker interface
- [ ] Create palette animation controls
- [ ] Add color format conversion (15-bit ↔ 32-bit)
- [ ] Implement palette import/export
- [ ] Add color harmony tools

**Deliverables**:
- Four complete visual editors
- Mouse/touch interaction system
- Real-time preview capabilities
- Import/export functionality

### Phase 4: Integration & Polish (Weeks 13-16)
**Goal**: Integrate all components and prepare for release

#### Week 13: Data Flow Integration
- [ ] Integrate `gaia-core` build engine with React frontend
- [ ] Implement project save/load functionality
- [ ] Add undo/redo system
- [ ] Create auto-save functionality
- [ ] Add project validation
- [ ] Set up shared component library (gaia-ui)

#### Week 14: User Experience
- [ ] Design responsive UI layout with shared design system
- [ ] Add keyboard shortcuts and hotkeys
- [ ] Implement drag-and-drop functionality
- [ ] Create onboarding tutorial
- [ ] Add contextual help system
- [ ] Implement unified Supabase authentication across all apps

#### Week 15: Performance Optimization
- [ ] Profile and optimize build process performance
- [ ] Implement PixiJS render optimization
- [ ] Add progressive loading for large ROMs
- [ ] Optimize memory usage
- [ ] Add performance monitoring
- [ ] Optimize monorepo build system

#### Week 16: Testing & Documentation
- [ ] Complete end-to-end testing
- [ ] Write user documentation
- [ ] Create developer API documentation
- [ ] Add example projects
- [ ] Prepare release materials
- [ ] Set up unified domain deployment strategy

**Deliverables**:
- Complete, production-ready ROM editor
- Shared component library and design system
- Unified authentication system
- Performance benchmarks
- Release-ready deployment infrastructure

### Phase 5: Community Platform (Weeks 17-20)
**Goal**: Build community platform for project sharing and collaboration

A core part of the community platform is its integration with external services where communities already thrive. GaiaLabs will adopt a phased strategy, prioritizing deep Discord integration first, while keeping a dedicated forum solution like Discourse as a future option.

#### Week 17: Community Site Foundation
- [ ] Set up Next.js community platform structure
- [ ] Integrate Sanity CMS for content management
- [ ] Implement user authentication with Supabase Auth (GitHub & Discord SSO)
- [ ] Create game, database, and project schemas
- [ ] Set up unified domain routing strategy
- [ ] Implement game metadata import from IGDB/TheGamesDB

#### Week 18: Content Management System
- [ ] Build game creation and management interface
- [ ] Implement database creation and editing system
- [ ] Create project gallery with ROM previews
- [ ] Add project upload and Git repository creation
- [ ] Implement module system for projects
- [ ] Create content search and filtering

#### Week 19: Collaboration Features
- [ ] Add user profiles and project portfolios
- [ ] Implement revision request system
- [ ] Create project commenting and reviews
- [ ] Add project favoriting and following
- [ ] Build permission management interface
- [ ] Implement Git-based change tracking
- [ ] Implement embedded Discord widget for announcements

#### Week 20: Studio Integration
- [ ] Implement seamless studio launcher from community
- [ ] Add "Edit Project" functionality with authentication context
- [ ] Create project versioning and backup system
- [ ] Build real-time collaboration features
- [ ] Add project sharing and export options
- [ ] Integrate module toggle system

**Deliverables**:
- Complete community platform with content hierarchy
- Game metadata import system
- Project hosting and collaboration system
- User authentication and role management
- Git integration for version control
- Studio integration with seamless workflow

### Phase 6: Database Editor & Advanced Features (Weeks 21-24)
**Goal**: Create database editing system and advanced collaboration tools

#### Week 21: Database Editor
- [ ] Create form-based database editor interface
- [ ] Implement schema validation and error reporting
- [ ] Add database documentation integration
- [ ] Build specialized editors for each database file type
- [ ] Create database testing and validation tools
- [ ] Add database version management

#### Week 22: Advanced Collaboration
- [ ] Implement Git-based revision system
- [ ] Create pull request workflow for changes
- [ ] Build diff visualization for database changes
- [ ] Add merge conflict resolution interface
- [ ] Implement branch management for experimental changes
- [ ] Create collaborative editing features

#### Week 23: Documentation & Community Tools
- [ ] Set up Docusaurus documentation platform
- [ ] Create comprehensive user guides
- [ ] Build interactive tutorials with embedded components
- [ ] Add API documentation and examples
- [ ] Implement community blog system
- [ ] Create database contribution guidelines

#### Week 24: Launch Preparation
- [ ] Complete end-to-end ecosystem testing
- [ ] Prepare community guidelines and moderation tools
- [ ] Create launch marketing materials
- [ ] Set up community support channels
- [ ] Prepare open-source release
- [ ] Implement analytics and monitoring

**Deliverables**:
- Complete database editor with validation
- Advanced Git-based collaboration system
- Comprehensive documentation ecosystem
- Community guidelines and moderation tools
- Launch-ready platform with analytics

---

## 🎯 Success Criteria

### Technical Metrics
- **Performance**: Deliver a responsive user experience with a sub-5-second "Live Preview" build time for typical projects.
- **Game Support**: Full compatibility with Illusion of Gaia (US/JP/DM variants)
- **Extensibility**: Clear pathway for adding new games via database definitions
- **Reliability**: <1% failure rate on valid ROM files with proper databases
- **Bundle Size**: <10MB initial load, progressive loading for assets
- **Browser Support**: Chrome 90+, Firefox 88+, Safari 14+

### User Experience Metrics
- **Load Time**: <3 seconds to interactive state
- **Responsiveness**: <100ms UI response time
- **Accessibility**: WCAG 2.1 AA compliance
- **Mobile Support**: Functional on tablets, optimized for desktop

### Collaboration Metrics
- **Content Creation**: Support for 100+ concurrent projects
- **Revision Processing**: <5 second turnaround for change reviews
- **Git Integration**: Seamless repository creation and management
- **Permission System**: Role-based access control with <1% false positives

### Feature Completeness
- [ ] All GaiaLib core functionality ported with multi-game support
- [ ] Visual editing capabilities match/exceed Godot version
- [ ] ROM building produces identical output to current tools
- [ ] Assembly processing maintains full compatibility
- [ ] Database system supports all existing configurations
- [ ] Game detection and database loading system functional
- [ ] Four-tier content hierarchy (Games → Databases → Projects → Modules)
- [ ] Role-based permission system with revision workflow
- [ ] Git integration with automatic repository management
- [ ] Database editor with schema validation
- [ ] Community platform with project sharing and collaboration
- [ ] Documentation site with interactive tutorials and examples
- [ ] Unified authentication across all platform components
- [ ] Seamless workflow from community browsing to project editing
- [ ] Game metadata import from external APIs (IGDB, TheGamesDB)
- [ ] Module system for conditional ROM modifications
- [ ] Clear documentation for adding new game support
- [ ] Database contribution system for community-driven game support

---

## ⚠️ Risk Assessment & Mitigation

### High-Risk Items
1. **Git Integration Complexity**
   - *Risk*: GitHub API rate limits, repository management complexity
   - *Mitigation*: Implement caching, batch operations, fallback to local Git
   
2. **Large ROM File Handling**
   - *Risk*: Browser memory limitations for the in-browser build system.
   - *Mitigation*: Streaming processing where possible, Web Workers for builds, clear user communication on browser requirements.

3. **Complex UI State Management**
   - *Risk*: React state complexity with large datasets
   - *Mitigation*: State management library (Zustand), data normalization

4. **Permission System Complexity**
   - *Risk*: Complex role-based access control
   - *Mitigation*: Comprehensive testing, clear permission matrix documentation

### Medium-Risk Items
1. **Build System Complexity**
   - *Mitigation*: Docker containerization for CI/CD builds, well-documented setup for the Rust CLI tool.
2. **Asset Loading Performance**
   - *Mitigation*: Leverage Cloudflare R2's CDN, image optimization.
3. **User Onboarding**
   - *Mitigation*: Interactive tutorials, sample projects.
4. **Database Schema Evolution**
   - *Mitigation*: Versioning system, migration tools.

---

## 📦 Deployment Strategy

### Development Environment
- **Local Development**: Hot reload for both Rust and React
- **Testing**: Automated testing on commit/PR
- **Preview**: Deploy branches for stakeholder review via Railway's preview deployments.
- **Git Integration**: GitHub App for repository management

### Production Deployment
- **Hosting**: **Railway** for all services (frontend, backend).
- **Database & Storage**: **Supabase** for PostgreSQL, authentication, real-time features, and asset storage with global CDN.
- **Monitoring**: Error tracking (Sentry), performance monitoring, and logging via Railway's built-in tools.
- **Updates**: Seamless deployment with rollback capability via GitHub Actions and Railway.

---

## 🛣️ Post-MVP Roadmap

### Phase 7: Advanced Features (Weeks 25-28)
- Enhanced collaborative editing with WebRTC or Liveblocks for operational transforms.
- Plugin system for custom ROM hacking tools
- Advanced project management and version control
- Performance analytics and optimization tools
- Mobile companion app exploration
- Advanced module system with visual scripting

### Phase 8: Community Growth & Ecosystem (Weeks 29-32)
- Open-source release preparation  
- Community onboarding and growth initiatives
- Develop and deploy Discord bot for dynamic, bi-directional channel management
- Plugin marketplace and ecosystem expansion
- Advanced integration with existing ROM hacking tools
- Community governance and moderation systems
- Long-term sustainability planning
- Multi-game database marketplace

---

## 📊 Resource Requirements

### Development Team
- **Lead Developer**: Full-stack (Rust + React)
- **Frontend Developer**: React + PixiJS specialist
- **Backend Developer**: Git integration and collaboration systems
- **QA Engineer**: Testing and validation
- **Technical Writer**: Documentation

### Infrastructure
- **Development**: GitHub repositories, Actions CI/CD
- **Testing**: Cross-browser testing services
- **Deployment**: Railway, Cloudflare R2
- **Monitoring**: Error tracking, analytics
- **Git Integration**: GitHub App with repository management

### Timeline Summary
- **Core Platform Development**: 16 weeks (Phases 1-4)
- **Community Platform**: 4 weeks (Phase 5)
- **Database Editor & Advanced Features**: 4 weeks (Phase 6)
- **Beta Testing**: 4 weeks
- **Production Release**: Week 28
- **Total MVP Duration**: 7 months

---

## 🎉 Definition of Done

The MVP is considered complete when:

1. **Functional Parity**: All GaiaLib capabilities replicated in the `gaia-core` TypeScript library with multi-game support
2. **Visual Editing**: Four editors (tilemap, tileset, sprite, palette) fully functional
3. **Game Support**: Full compatibility with Illusion of Gaia and clear pathway for new games
4. **Content Hierarchy**: Three-pillar data strategy (Git, Object Storage, DB) is operational.
5. **Collaboration System**: Role-based permissions with revision workflow functional
6. **Git Integration**: Automatic repository creation and management working
7. **Database System**: Robust database loading, validation, and editing tools
8. **Build System**: Both in-browser "Live Preview" and CI/CD "Production Build" systems are functional.
9. **Community Platform**: Project sharing, user profiles, and collaboration tools functional
10. **Documentation Site**: Interactive tutorials, API docs, and community blog operational
11. **Unified Experience**: Seamless authentication and navigation across all platform components
12. **Performance**: Meets or exceeds current tool performance benchmarks
13. **Stability**: Passes comprehensive test suite with >95% coverage across all apps
14. **Deployment**: Unified domain deployment with all apps accessible via web browser
15. **Integration**: One-click workflow from community project browsing to editing
16. **Validation**: Successfully processes existing ROM projects without regression
17. **Extensibility**: Clear, documented process for community to add new game support
18. **Game Metadata**: Automatic import from IGDB/TheGamesDB APIs
19. **Module System**: Conditional ROM modifications with visual management
20. **Version Control**: Git-based change tracking with diff visualization
21. **Database Contribution**: Community system for submitting and validating new game databases

---
*(The final sections of the original document, such as "Community Management & Quality Assurance" and "MVP Milestone: Illusion of Gaia Retranslation," are still highly relevant and are included below without modification.)*

### Complete Ecosystem Vision

GaiaLabs will provide a **complete ROM hacking ecosystem** where users can:

- **Discover**: Browse games, databases, and community projects
- **Import**: Automatically import game metadata from external APIs
- **Learn**: Follow interactive tutorials and documentation
- **Contribute**: Add new game databases and contribute to existing ones
- **Create**: Use professional-grade visual editors with module system
- **Collaborate**: Work together on projects with Git-based version control
- **Manage**: Organize projects with role-based permissions and workflows
- **Share**: Publish projects and contribute to the community
- **Extend**: Add support for new games through database contributions
- **Track**: Monitor changes and collaborate through revision systems

This roadmap provides a comprehensive path from the current multi-project architecture to a modern, unified web-based ROM editing platform that will serve the community for years to come.

### Community Management & Quality Assurance

#### Critical Concerns & Proactive Solutions

The collaboration model addresses several potential issues that could undermine platform success:

#### **1. ROM Header to IGDB Matching Challenges**

**Problem**: ROM internal names may not match external database titles, leading to failed auto-detection.

```
ROM Header: "SECRET OF MANA    " (21-byte ASCII, truncated)
IGDB Title: "Secret of Mana"
Region Variants: "Secret of Mana (USA)", "Seiken Densetsu 2 (Japan)"
```

**Solution**: Multi-stage matching with user confirmation:

```typescript
interface ROMToIGDBMatching {
  // Stage 1: Exact checksum matching (highest confidence)
  checksumMatch: (romChecksum: string) => IGDBGame | null;
  
  // Stage 2: Fuzzy title matching with region context
  fuzzyMatch: (romTitle: string, region: string) => {
    candidates: IGDBGame[];
    confidence: number;
    requiresUserConfirmation: boolean;
  };
  
  // Stage 3: User selection from candidates
  userSelection: (candidates: IGDBGame[]) => {
    selectedGame: IGDBGame;
    userFeedback: "improve-future-matching";
  };
  
  // Stage 4: Manual entry for unknown ROMs
  manualCreation: () => {
    customGame: Game;
    submitToDatabase: "community-can-improve-later";
  };
}
```

**Implementation Strategy**:
- **Checksum Database**: Maintain community-contributed ROM checksums
- **Learning System**: Machine learning from user selections
- **Fallback Gracefully**: Never block user progress due to detection issues

#### **2. Database Moderation Transition Management**

**Problem**: When databases transition from unmoderated to moderated, the change might disrupt ongoing work.

**Solution**: Simple, clear transition with advance notice:

```typescript
interface ModerationTransition {
  // Clear notification process
  advance_notice: {
    notification_period: "14-days-before-change";
    clear_messaging: "database-will-require-pull-requests-only";
    help_available: "moderators-will-help-with-transitions";
  };
  
  // Simple transition
  transition_day: {
    everyone_same_rules: "all-users-now-use-pull-requests";
    no_special_cases: "clean-simple-consistent-permissions";
    help_during_transition: "moderators-prioritize-existing-work";
  };
  
  // Post-transition support
  ongoing_support: {
    fast_review: "existing-work-gets-priority-review";
    contributor_path: "clear-way-to-become-contributor";
    moderator_help: "available-to-assist-with-workflow";
  };
}
```

#### **3. Project Lifecycle & Abandonment Prevention**

**Problem**: Valuable projects might be abandoned in private repositories, losing community benefit.

**Solution**: Activity-based lifecycle management with community takeover options:

```typescript
interface ProjectLifecycleManagement {
  // Activity monitoring
  activityTracking: {
    lastCommit: Date;
    lastLogin: Date;
    communityInterest: number; // forks, stars, issues
  };
  
  // Progressive notifications
  inactivityWarnings: {
    sixMonths: "gentle-reminder-about-project";
    twelveMonths: "offer-help-or-co-maintainer";
    eighteenMonths: "final-notice-before-community-takeover";
  };
  
  // Community takeover process
  takeoverProcess: {
    communityRequest: "users-can-request-to-adopt-project";
    ownerNotification: "final-chance-to-respond";
    transferProcess: "structured-handover-with-history-preservation";
    originalOwnerRights: "can-reclaim-within-6-months";
  };
  
  // Archival options
  archivalChoices: {
    makePublic: "release-as-public-archive";
    transferOwnership: "hand-off-to-community-member";
    permanentArchive: "read-only-preservation";
  };
}
```

#### **4. Database Quality Control Framework**

**Problem**: Incorrect database definitions could break multiple projects, undermining platform reliability.

**Solution**: Multi-layered validation and review system:

```typescript
interface DatabaseQualityFramework {
  // Automatic validation
  schemaValidation: {
    jsonSchemaChecks: "ensure-proper-structure";
    consistencyValidation: "cross-reference-integrity";
    romCompatibilityTests: "verify-against-known-roms";
  };
  
  // Community review process
  peerReview: {
    requiredReviewers: 2; // minimum for database changes
    expertReviewers: "game-specific-specialists";
    reviewCriteria: "accuracy-completeness-documentation";
  };
  
  // Testing framework
  automatedTesting: {
    romBuildTests: "ensure-projects-still-build";
    regressionTesting: "detect-breaking-changes";
    integrationTests: "verify-cross-project-compatibility";
  };
  
  // Rollback capabilities
  versionControl: {
    semanticVersioning: "major.minor.patch-for-databases";
    rollbackProcedure: "revert-to-last-known-good";
    impactAssessment: "identify-affected-projects";
  };
  
  // Quality metrics
  healthScoring: {
    completeness: "percentage-of-rom-mapped";
    accuracy: "community-validation-score";
    documentation: "quality-of-explanations";
    stability: "frequency-of-breaking-changes";
  };
}
```

#### **5. Project Discovery & Community Engagement**

**Problem**: Great projects and modules might not be discovered, reducing community engagement and collaboration.

**Solution**: Comprehensive discovery and showcase system:

```typescript
interface ProjectDiscoverySystem {
  // Content curation
  featuredContent: {
    adminCurated: "staff-picks-and-highlights";
    communityVoted: "user-rated-top-projects";
    editorsPicks: "technical-excellence-awards";
  };
  
  // Algorithmic discovery
  trendingProjects: {
    activityBased: "recent-commits-and-engagement";
    popularityMetrics: "forks-stars-downloads";
    velocityTracking: "rapidly-growing-projects";
  };
  
  // Browsing and search
  organizationalTools: {
    gameSpecificBrowsing: "filter-by-game-and-console";
    tagSystem: "user-generated-tags-and-categories";
    difficultyLevels: "beginner-intermediate-advanced";
    moduleMarketplace: "searchable-modification-catalog";
  };
  
  // Social features
  communityFeatures: {
    userProfiles: "showcase-user-contributions";
    followSystem: "follow-favorite-creators";
    collaborationBoard: "find-contributors-and-projects";
    mentorshipProgram: "pair-experienced-with-newcomers";
  };
}
```

#### **6. Enhanced ROM Detection & Metadata Management**

**Problem**: Edge cases in ROM detection could frustrate users and create duplicate entries.

**Solution**: Robust detection with comprehensive fallback strategies:

```typescript
interface EnhancedROMDetection {
  // Multi-source detection
  detectionSources: {
    internalHeader: "parse-rom-internal-metadata";
    checksumDatabase: "community-maintained-signatures";
    fileNameHeuristics: "intelligent-filename-parsing";
    userProvided: "manual-metadata-entry";
  };
  
  // Conflict resolution
  conflictHandling: {
    multipleMatches: "present-candidates-with-confidence-scores";
    noMatches: "guided-manual-entry-with-suggestions";
    contradictoryData: "community-voting-on-correct-metadata";
  };
  
  // Continuous improvement
  learningSystem: {
    userFeedback: "collect-corrections-and-confirmations";
    communityContributions: "crowdsourced-rom-database";
    machinelearning: "improve-matching-algorithms-over-time";
  };
  
  // Quality assurance
  metadataValidation: {
    crossReference: "verify-against-multiple-sources";
    communityReview: "peer-validation-of-new-entries";
    expertCuration: "specialist-review-for-rare-games";
  };
}
```

#### **7. Onboarding & User Experience Optimization**

**Problem**: Complex workflows might deter new users from contributing to the community.

**Solution**: Progressive disclosure with comprehensive support:

```typescript
interface OnboardingOptimization {
  // Guided experience
  tutorialSystem: {
    interactiveTutorials: "hands-on-project-creation-walkthrough";
    videoGuides: "embedded-instructional-content";
    progressTracking: "achievement-based-learning-path";
  };
  
  // Template system
  projectTemplates: {
    popularGames: "pre-configured-starting-points";
    commonModifications: "sprite-swaps-music-hacks-etc";
    difficultyLevels: "beginner-friendly-to-advanced";
  };
  
  // Community support
  mentorshipProgram: {
    pairNewUsers: "experienced-contributors-as-mentors";
    helpChannels: "dedicated-support-forums";
    officeHours: "scheduled-expert-availability";
  };
  
  // Documentation
  comprehensiveGuides: {
    platformOverview: "understanding-games-databases-projects";
    technicalReference: "rom-hacking-fundamentals";
    bestPractices: "community-standards-and-conventions";
  };
}
```
---
## 🎯 MVP Milestone: Illusion of Gaia Retranslation

### Strategic First Use Case

The **Illusion of Gaia Retranslation Project** has been selected as GaiaLabs' inaugural milestone, serving as both a proof-of-concept and a real-world application that demonstrates the platform's core value proposition.

#### Why IoG Retranslation is the Perfect MVP

**Primary Focus: Crowdsourced Script Editing**
- **Community-driven translation** improvements and refinements
- **Collaborative editing workflow** for script dialogue and text
- **Version control** for translation changes and community feedback
- **Quality assurance** through peer review and approval processes

**Secondary Benefit: ROM Hacking Capabilities**
- **Direct ROM integration** for testing script changes in-game
- **Asset management** for graphics, audio, and other game elements
- **Module system** for optional enhancements and modifications
- **Build pipeline** for generating playable ROM files

**Strategic Advantages**
- **Established community** already interested in IoG improvements
- **Well-documented game structure** through existing GaiaLib database
- **Clear scope** focused on text/script editing with optional ROM features
- **Proven demand** for collaborative translation tools

### MVP Feature Set for IoG Retranslation

#### Core Crowdsourcing Features

**Script Database Management**
```typescript
interface ScriptDatabase {
  dialogueEntries: {
    id: string;
    originalText: string;
    currentTranslation: string;
    context: string;
    characterLimit: number;
    location: string; // Scene/area reference
  }[];
  
  translationMetadata: {
    language: "english" | "japanese" | "other";
    version: string;
    contributors: string[];
    lastModified: Date;
  };
  
  editingWorkflow: {
    submissionProcess: "pull-request";
    reviewRequirement: "peer-review";
    approvalThreshold: number;
  };
}
```

**Collaborative Editing Interface**
- **Side-by-side comparison** of original vs. proposed translation
- **Context viewer** showing in-game screenshots and scene information
- **Character count validation** to ensure text fits within ROM constraints
- **Suggestion system** for alternative translations
- **Comment threads** for discussion on specific dialogue entries

**Community Management**
- **Contributor roles**: Translator, Reviewer, Editor, Maintainer
- **Progress tracking** with completion percentages per scene/chapter
- **Quality metrics** tracking accuracy and community approval ratings
- **Recognition system** for top contributors

#### ROM Integration Features

**Live Preview System**
```typescript
interface LivePreview {
  textInsertion: {
    automaticROMPatching: boolean;
    instantPreview: boolean;
    characterLimitValidation: boolean;
  };
  
  gameplayTesting: {
    embeddedEmulator: boolean;
    saveStateSupport: boolean;
    quickSceneNavigation: boolean;
  };
  
  buildGeneration: {
    automaticROMBuilds: boolean;
    downloadablePatches: boolean;
    versionTagging: boolean;
  };
}
```

**Asset Management**
- **Graphics editing** for menu text and UI elements
- **Font management** for character sets and special symbols
- **Audio integration** for voice acting or sound effect modifications
- **Tilemap editing** for environmental text elements

### Technical Implementation Plan

#### Phase 1: Foundation (Months 1-2)
**Database Setup**
- Import existing IoG script database from GaiaLib
- Create web interface for script browsing and editing
- Implement basic user authentication and roles

**Core Editing Features**
- Text editor with character count validation
- Side-by-side original/translation comparison
- Basic submission and review workflow

**Estimated Development Time**: 6-8 weeks
**Team Size**: 2-3 developers

#### Phase 2: Collaboration (Months 2-3)
**Community Features**
- GitHub integration for pull request workflow
- Comment system for translation discussions
- Progress tracking and contributor recognition
- Email notifications for review requests

**Quality Assurance**
- Peer review system with approval thresholds
- Version history and change tracking
- Rollback capabilities for problematic edits

**Estimated Development Time**: 4-6 weeks
**Team Size**: 2-3 developers + 1 community manager

#### Phase 3: ROM Integration (Months 3-4)
**Live Preview System**
- ROM patching engine for real-time text insertion
- Embedded emulator for immediate gameplay testing
- Automated build generation for downloadable patches

**Advanced Features**
- Graphics editing for UI text elements
- Scene navigation for context-aware editing
- Save state management for testing specific scenarios

**Estimated Development Time**: 6-8 weeks
**Team Size**: 3-4 developers + 1 ROM hacking specialist

### Success Metrics & KPIs

#### Community Engagement
- **Active Contributors**: Target 50+ regular contributors within 6 months
- **Script Completion**: 100% of IoG dialogue reviewed and improved
- **Quality Score**: Average community rating of 4.5/5 for translation quality
- **Retention Rate**: 70% of contributors remain active after 3 months

#### Technical Performance
- **Response Time**: <2 seconds for script loading and editing
- **Uptime**: 99.5% platform availability
- **ROM Build Success**: 95% successful ROM generation rate
- **User Satisfaction**: 4.0/5 average user experience rating

#### Platform Growth
- **Project Templates**: IoG project becomes template for future games
- **Feature Adoption**: 80% of users utilize ROM preview features
- **Community Growth**: 500+ registered users within first year
- **External Recognition**: Coverage in ROM hacking and translation communities

### IoG-Specific Implementation Details

#### Game Database Integration
```json
{
  "game": {
    "title": "Illusion of Gaia",
    "platform": "SNES",
    "regions": ["US", "JP", "EU"],
    "versions": {
      "us_1.0": {
        "checksum": "CRC32_HASH",
        "textLocations": "database/iog/text_pointers.json",
        "graphicsAssets": "database/iog/gfx_definitions.json"
      }
    }
  },
  
  "scriptStructure": {
    "totalDialogueEntries": 2847,
    "chapters": 12,
    "averageTextLength": 45,
    "specialCharacters": ["é", "ñ", "heart_symbol"],
    "contextCategories": ["dialogue", "menu", "item_description", "location_name"]
  }
}
```

#### Workflow Configuration
```typescript
interface IoGWorkflow {
  translationProcess: {
    submissionRequirement: "github-account";
    reviewerAssignment: "automatic-by-expertise";
    approvalProcess: "two-reviewer-minimum";
    mergingCriteria: "consensus-based";
  };
  
  qualityStandards: {
    characterLimits: "strict-enforcement";
    contextAccuracy: "required";
    styleConsistency: "guided-by-style-guide";
    technicalTesting: "rom-validation-required";
  };
  
  communityGuidelines: {
    discussionEtiquette: "respectful-collaboration";
    conflictResolution: "moderator-mediated";
    contributionRecognition: "public-credit-system";
  };
}
```

### Launch Strategy

#### Soft Launch (Month 4)
- **Invite-only beta** with 20-30 experienced IoG community members
- **Core features testing** and feedback collection
- **Bug fixes and performance optimization**
- **Documentation and tutorial creation**

#### Public Launch (Month 5)
- **Open registration** for all interested contributors
- **Community outreach** to ROM hacking and translation forums
- **Social media campaign** highlighting collaborative features
- **Press coverage** in gaming and emulation communities

#### Post-Launch Growth (Months 6-12)
- **Feature expansion** based on community feedback
- **Additional game support** using IoG as a template
- **Advanced ROM hacking tools** for power users
- **Mobile companion app** for script review on-the-go

This milestone establishes GaiaLabs as the premier platform for collaborative ROM translation and editing, with IoG Retranslation serving as the flagship example of what's possible when community collaboration meets powerful ROM hacking tools. 