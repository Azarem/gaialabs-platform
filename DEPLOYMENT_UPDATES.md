# Deployment Updates: Supabase Integration

## Overview

The GaiaLabs platform deployment has been updated to use **Supabase** as the primary database solution instead of Railway's PostgreSQL. This change enables powerful real-time collaboration features that are essential for the platform's multi-user editing capabilities.

## Key Changes Made

### 1. GitHub Actions Workflow Updates
- **File**: `.github/workflows/ci-cd.yml`
- **Changes**: 
  - Updated database migration job to use Supabase credentials
  - Added `SUPABASE_SERVICE_ROLE_KEY` for admin operations
  - Added database seeding step for initial data

### 2. Environment Variables Updated
- **Files**: `DEPLOYMENT.md`, `env.example`
- **New Variables**:
  - `SUPABASE_DATABASE_URL`: PostgreSQL connection string
  - `SUPABASE_SERVICE_ROLE_KEY`: Admin access key
  - `NEXT_PUBLIC_SUPABASE_URL`: Public project URL
  - `NEXT_PUBLIC_SUPABASE_ANON_KEY`: Client-side access key

### 3. Service Configuration Updates
- **Files**: Railway configuration files
- **Changes**: All services now include Supabase environment variables
- **Services Affected**: gaia-api, gaia-studio, gaia-community

### 4. Documentation Updates
- **Files**: `DEPLOYMENT.md`, `docs/GaiaLabs-MVP-Roadmap-v2.md`
- **Changes**: 
  - Updated setup instructions for Supabase
  - Removed Railway PostgreSQL references
  - Added real-time collaboration architecture details

### 5. New Documentation Added
- **File**: `SUPABASE_SETUP.md`
- **Content**: Comprehensive guide for Supabase setup including:
  - Database schema design
  - Row Level Security policies
  - Real-time configuration
  - Authentication setup
  - Edge functions
  - Client integration examples

## Benefits of Supabase Integration

### Real-time Collaboration
- **Live Editing**: Multiple users can edit tilemaps and sprites simultaneously
- **Presence Indicators**: See which users are currently editing specific assets
- **Change Propagation**: Instant updates across all connected clients
- **Conflict Resolution**: Automatic handling of simultaneous edits

### Enhanced Security
- **Row Level Security**: Fine-grained access control for multi-tenant projects
- **JWT Authentication**: Secure token-based authentication
- **OAuth Integration**: Built-in GitHub and Discord authentication
- **API Security**: Automatic rate limiting and request validation

### Developer Experience
- **Auto-generated APIs**: RESTful and GraphQL endpoints out of the box
- **Database Functions**: PostgreSQL functions for complex operations
- **Edge Functions**: Server-side logic for ROM processing
- **Real-time Subscriptions**: WebSocket connections managed automatically

### Operational Benefits
- **Automatic Backups**: Point-in-time recovery and data protection
- **Monitoring**: Built-in database and API monitoring
- **Scaling**: Automatic scaling based on usage
- **Cost Optimization**: Pay-per-use pricing model

## Migration Path

### For New Deployments
1. **Create Supabase Project**: Follow `SUPABASE_SETUP.md` guide
2. **Configure Environment Variables**: Set all required Supabase credentials
3. **Deploy Services**: Use updated Railway configurations
4. **Run Database Migrations**: Prisma migrations will create the schema
5. **Enable Real-time**: Configure real-time subscriptions for collaboration

### For Existing Deployments
1. **Create Supabase Project**: Set up new Supabase project
2. **Export Data**: Export existing data from Railway PostgreSQL
3. **Import Data**: Import data into Supabase
4. **Update Environment Variables**: Switch to Supabase credentials
5. **Redeploy Services**: Deploy with updated configurations
6. **Test Real-time Features**: Verify collaboration features work

## Technical Architecture

### Database Strategy
- **Primary Database**: Supabase PostgreSQL with real-time features
- **Asset Storage**: Cloudflare R2 for binary assets
- **Caching**: Optional Redis for API response caching
- **Search**: PostgreSQL full-text search with Supabase extensions

### Real-time Features
- **WebSocket Connections**: Managed by Supabase
- **Change Propagation**: Automatic broadcasting of database changes
- **Presence Management**: Track online users and their activities
- **Conflict Resolution**: Operational transforms for simultaneous edits

### Security Model
- **Authentication**: Supabase Auth with OAuth providers
- **Authorization**: Row Level Security policies
- **API Security**: JWT tokens and rate limiting
- **Data Protection**: Encrypted connections and automatic backups

## Next Steps

1. **Set up Supabase Project**: Follow the comprehensive setup guide
2. **Configure GitHub Secrets**: Add all required Supabase credentials
3. **Test Deployment**: Deploy to staging environment first
4. **Verify Real-time Features**: Test collaborative editing
5. **Monitor Performance**: Use Supabase dashboard for monitoring
6. **Optimize Queries**: Add indexes and optimize database performance

## Support and Resources

- **Supabase Documentation**: https://supabase.com/docs
- **Real-time Guide**: https://supabase.com/docs/guides/realtime
- **Row Level Security**: https://supabase.com/docs/guides/auth/row-level-security
- **Edge Functions**: https://supabase.com/docs/guides/functions

This update positions GaiaLabs to deliver a best-in-class collaborative ROM editing experience with real-time features that were not possible with traditional database solutions. 
