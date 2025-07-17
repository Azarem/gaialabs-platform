# GaiaLabs Platform Deployment Guide

This guide covers the deployment of the GaiaLabs platform to Railway using GitHub Actions CI/CD.

## Prerequisites

1. **Railway Account**: Sign up at [railway.app](https://railway.app)
2. **GitHub Repository**: Fork/clone this repository
3. **Railway CLI** (optional): `npm install -g @railway/cli`

## Environment Setup

### Required Secrets

Add these secrets to your GitHub repository (Settings → Secrets and variables → Actions):

#### Core Secrets
- `RAILWAY_TOKEN`: Your Railway API token
- `SUPABASE_DATABASE_URL`: Supabase PostgreSQL connection string
- `SUPABASE_SERVICE_ROLE_KEY`: Supabase service role key for admin operations

#### API Secrets
- `JWT_SECRET`: Random string for JWT token signing
- `BCRYPT_ROUNDS`: Number of bcrypt rounds (default: 12)
- `CORS_ORIGIN`: Allowed CORS origins (comma-separated)

#### OAuth Provider Secrets (configured in Supabase)
- `GITHUB_CLIENT_ID`: GitHub OAuth app client ID
- `GITHUB_CLIENT_SECRET`: GitHub OAuth app client secret
- `DISCORD_CLIENT_ID`: Discord OAuth app client ID
- `DISCORD_CLIENT_SECRET`: Discord OAuth app client secret

#### Sanity CMS Secrets
- `NEXT_PUBLIC_SANITY_PROJECT_ID`: Sanity project ID
- `NEXT_PUBLIC_SANITY_DATASET`: Sanity dataset name
- `SANITY_API_TOKEN`: Sanity API token

#### Supabase Secrets
- `NEXT_PUBLIC_SUPABASE_URL`: Supabase project URL
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`: Supabase anonymous key
- `SUPABASE_SERVICE_ROLE_KEY`: Supabase service role key

#### Optional Secrets
- `CLOUDFLARE_R2_ACCESS_KEY_ID`: Cloudflare R2 access key
- `CLOUDFLARE_R2_SECRET_ACCESS_KEY`: Cloudflare R2 secret key
- `CLOUDFLARE_R2_BUCKET_NAME`: Cloudflare R2 bucket name
- `CLOUDFLARE_R2_ENDPOINT`: Cloudflare R2 endpoint URL

## Railway Setup

### 1. Create Railway Project

```bash
# Install Railway CLI
npm install -g @railway/cli

# Login to Railway
railway login

# Create new project
railway create gaialabs-platform
```

### 2. Configure Services

The platform consists of 3 main Railway services + Supabase:

#### Supabase Setup (Database + Auth + Real-time)
```bash
# Create Supabase project at https://supabase.com
# Enable Real-time for collaborative features
# Configure OAuth providers in Authentication > Providers
# Copy your project URL and keys from Settings > API
```

#### GaiaAPI (Backend)
```bash
# Deploy API service
railway up --service gaia-api

# Set environment variables
railway variables set JWT_SECRET=your-jwt-secret
railway variables set BCRYPT_ROUNDS=12
railway variables set CORS_ORIGIN=https://studio.gaialabs.com,https://community.gaialabs.com
railway variables set SUPABASE_DATABASE_URL=your-supabase-db-url
railway variables set SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
railway variables set NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
railway variables set NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

#### GaiaStudio (Frontend)
```bash
# Deploy Studio service
railway up --service gaia-studio

# Set environment variables
railway variables set VITE_API_URL=https://api.gaialabs.com
railway variables set VITE_COMMUNITY_URL=https://community.gaialabs.com
railway variables set VITE_SUPABASE_URL=https://your-project.supabase.co
railway variables set VITE_SUPABASE_ANON_KEY=your-anon-key
```

#### GaiaCommunity (Community Platform)
```bash
# Deploy Community service
railway up --service gaia-community

# Set environment variables (OAuth configured in Supabase dashboard)
railway variables set NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
railway variables set NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
railway variables set SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

### 3. Configure Custom Domains

```bash
# Add custom domains
railway domain add studio.gaialabs.com --service gaia-studio
railway domain add api.gaialabs.com --service gaia-api
railway domain add community.gaialabs.com --service gaia-community
```

## GitHub Actions Configuration

### Workflow Triggers

The CI/CD pipeline triggers on:
- **Push to main**: Full deployment to production
- **Push to develop**: Deployment to staging environment
- **Pull Requests**: Build and test only

### Pipeline Stages

1. **Build and Test**: 
   - Install dependencies
   - Run type checking
   - Run linting
   - Run tests
   - Build all packages

2. **Security Checks**:
   - Dependency audit
   - Vulnerability scanning

3. **Database Migration**:
   - Run Prisma migrations
   - Seed database (if needed)

4. **Deploy to Railway**:
   - Deploy each service
   - Health checks
   - Rollback on failure

### Manual Deployment

To deploy manually:

```bash
# Build all packages
pnpm run build

# Deploy specific service
railway up --service gaia-studio
railway up --service gaia-api
railway up --service gaia-community
```

## Environment Variables Reference

### GaiaAPI Environment Variables

```env
# Supabase Database
SUPABASE_DATABASE_URL=postgresql://postgres:[password]@db.[project].supabase.co:5432/postgres
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key

# Authentication
JWT_SECRET=your-jwt-secret-here
BCRYPT_ROUNDS=12

# CORS
CORS_ORIGIN=https://studio.gaialabs.com,https://community.gaialabs.com

# Server
PORT=3000
NODE_ENV=production

# File Storage
CLOUDFLARE_R2_ACCESS_KEY_ID=your-r2-access-key
CLOUDFLARE_R2_SECRET_ACCESS_KEY=your-r2-secret-key
CLOUDFLARE_R2_BUCKET_NAME=gaialabs-assets
CLOUDFLARE_R2_ENDPOINT=https://your-account.r2.cloudflarestorage.com
```

### GaiaStudio Environment Variables

```env
# API Configuration
VITE_API_URL=https://api.gaialabs.com
VITE_COMMUNITY_URL=https://community.gaialabs.com

# Supabase Configuration
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key

# Build Configuration
NODE_ENV=production
```

### GaiaCommunity Environment Variables

```env
# Supabase Configuration (handles all authentication)
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key

# OAuth Providers (configured in Supabase dashboard, not as env vars)
# GitHub and Discord OAuth are set up in Supabase Authentication > Providers

# Sanity CMS
NEXT_PUBLIC_SANITY_PROJECT_ID=your-sanity-project-id
NEXT_PUBLIC_SANITY_DATASET=production
SANITY_API_TOKEN=your-sanity-api-token

# API Configuration
NEXT_PUBLIC_API_URL=https://api.gaialabs.com
```

## Monitoring and Logging

### Railway Monitoring

Railway provides built-in monitoring:
- CPU and memory usage
- Request metrics
- Error tracking
- Deployment logs

### Health Checks

Each service includes health check endpoints:
- **GaiaAPI**: `GET /health`
- **GaiaStudio**: Nginx health check
- **GaiaCommunity**: Next.js health check

### Log Aggregation

View logs for each service:

```bash
# View API logs
railway logs --service gaia-api

# View Studio logs
railway logs --service gaia-studio

# View Community logs
railway logs --service gaia-community
```

## Troubleshooting

### Common Issues

1. **Build Failures**:
   - Check pnpm version compatibility
   - Verify all dependencies are installed
   - Check TypeScript errors

2. **Database Connection Issues**:
   - Verify SUPABASE_DATABASE_URL is correct
   - Check Supabase project is active
   - Verify service role key has correct permissions
   - Run migrations manually if needed

3. **Authentication Issues**:
   - Verify OAuth providers are configured in Supabase dashboard
   - Check redirect URLs match Supabase project URL
   - Validate Supabase keys are correctly set

### Debugging Commands

```bash
# Check service status
railway status

# View environment variables
railway variables

# Connect to Supabase database
# Use Supabase dashboard or direct connection with DATABASE_URL

# View recent deployments
railway deployments

# Rollback to previous deployment
railway rollback
```

## Security Considerations

1. **Environment Variables**: Never commit secrets to version control
2. **CORS Configuration**: Restrict origins to your domains only
3. **Database Access**: Use connection pooling and read replicas
4. **File Uploads**: Validate file types and sizes
5. **Rate Limiting**: Implement API rate limiting
6. **HTTPS**: Always use HTTPS in production

## Performance Optimization

1. **CDN**: Use Railway's built-in CDN
2. **Caching**: Implement Redis caching for API responses
3. **Database**: Use indexes and query optimization
4. **Bundle Size**: Optimize JavaScript bundles
5. **Image Optimization**: Use Next.js image optimization

## Backup Strategy

1. **Database Backups**: Supabase provides automatic backups and point-in-time recovery
2. **File Storage**: Cloudflare R2 has built-in redundancy
3. **Code**: Version control with Git
4. **Configuration**: Document all environment variables

## Cost Optimization

1. **Resource Allocation**: Right-size your services
2. **Sleep Mode**: Enable for non-production environments
3. **Monitoring**: Track usage and optimize accordingly
4. **Caching**: Reduce database queries with caching

This deployment guide ensures a robust, scalable, and maintainable deployment of the GaiaLabs platform on Railway. 