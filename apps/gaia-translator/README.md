# Gaia Translator

Community platform for collaborative translation of Illusion of Gaia and other game scripts.

## Overview

Gaia Translator is a Next.js 15 application built with React 19 that provides a collaborative platform for translating game scripts. It features real-time collaboration, AI-powered translation assistance, and comprehensive community features.

## Features

- **Collaborative Editing**: Real-time collaborative translation editing
- **Script Management**: Browse and organize game scripts by location, character, or scene
- **Community Discussion**: Integrated comments and discussion system
- **AI Translation Assistance**: Intelligent translation suggestions and context analysis
- **Version History**: Comprehensive version tracking and change management
- **Quality Assurance**: Role-based review system with permissions
- **GitHub OAuth**: Seamless authentication via GitHub
- **Responsive Design**: Mobile-friendly interface

## Tech Stack

- **Framework**: Next.js 15 with App Router
- **Frontend**: React 19, TypeScript, Tailwind CSS
- **Database**: PostgreSQL with Prisma ORM
- **Authentication**: Supabase Auth with GitHub OAuth
- **AI Integration**: OpenAI API for translation assistance
- **Styling**: Tailwind CSS with custom design system
- **Icons**: Heroicons
- **State Management**: Zustand
- **Forms**: React Hook Form with Zod validation

## Getting Started

### Prerequisites

- Node.js 20+
- pnpm 8+
- PostgreSQL database
- Supabase project
- GitHub OAuth app

### Installation

1. Install dependencies from the root of the monorepo:
   ```bash
   pnpm install
   ```

2. Set up environment variables:
   ```bash
   cp .env.example .env.local
   ```
   
   Fill in the required environment variables:
   - Database connection string
   - Supabase configuration
   - GitHub OAuth credentials
   - OpenAI API key

3. Set up the database:
   ```bash
   pnpm translator:db:migrate
   pnpm translator:db:seed
   ```

4. Start the development server:
   ```bash
   pnpm translator:dev
   ```

The application will be available at `http://localhost:3003`.

### Development Commands

```bash
# Start development server
pnpm translator:dev

# Build for production
pnpm translator:build

# Run linting
pnpm lint

# Type checking
pnpm type-check

# Database operations
pnpm translator:db:generate  # Generate Prisma client
pnpm translator:db:push      # Push schema changes
pnpm translator:db:migrate   # Run migrations
pnpm translator:db:seed      # Seed database
pnpm translator:db:studio    # Open Prisma Studio
```

## Project Structure

```
src/
├── app/                    # Next.js App Router pages
│   ├── auth/              # Authentication pages
│   ├── scripts/           # Script browsing and editing
│   ├── community/         # Community features
│   └── layout.tsx         # Root layout
├── components/            # React components
│   ├── home/             # Homepage components
│   ├── layout/           # Layout components
│   ├── ui/               # Reusable UI components
│   └── providers.tsx     # Context providers
├── lib/                  # Utility libraries
│   ├── supabase/         # Supabase client configuration
│   └── utils.ts          # General utilities
├── types/                # TypeScript type definitions
└── styles/               # Global styles
```

## Database Schema

The application uses PostgreSQL with the following main entities:

- **Users**: User accounts and profiles
- **Scripts**: Game script segments and metadata
- **Translations**: Translation content and versions
- **Comments**: Community discussions and feedback
- **Reviews**: Quality assurance and approval workflow

## Authentication

Authentication is handled through Supabase Auth with GitHub OAuth:

1. Users sign in with their GitHub account
2. User profiles are automatically created
3. Role-based permissions control access to features
4. Session management is handled by Supabase

## AI Integration

The platform integrates with OpenAI's API to provide:

- Translation suggestions based on context
- Quality analysis and feedback
- Consistency checking across translations
- Cultural adaptation recommendations

## Contributing

1. Follow the existing code style and patterns
2. Write tests for new features
3. Update documentation as needed
4. Submit pull requests for review

## Deployment

The application is designed to be deployed on platforms that support Next.js:

- **Recommended**: Railway, Vercel, or Netlify
- **Database**: Supabase PostgreSQL
- **Storage**: Supabase Storage
- **CDN**: Automatic via hosting platform

## License

MIT - See the root LICENSE file for details.

## Support

For questions or issues:

1. Check the documentation in `/docs`
2. Search existing GitHub issues
3. Create a new issue with detailed information
4. Join the community Discord for real-time help
