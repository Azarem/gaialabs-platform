# Supabase Setup Guide for GaiaLabs Platform

This guide covers setting up Supabase as the database and real-time backend for the GaiaLabs platform.

## Why Supabase?

According to the GaiaLabs MVP Roadmap v2, Supabase was chosen for its **"Postgres with superpowers"** capabilities:

- **Real-time Features**: Built-in real-time engine for collaborative editing
- **Row Level Security**: Advanced security for multi-tenant applications
- **Auto-generated APIs**: RESTful and GraphQL APIs out of the box
- **Authentication**: Built-in auth with multiple providers
- **Database Functions**: PostgreSQL functions for complex operations
- **Edge Functions**: Server-side logic close to users

## Prerequisites

1. **Supabase Account**: Sign up at [supabase.com](https://supabase.com)
2. **Database Schema**: Understanding of the GaiaLabs data model
3. **Environment Variables**: Access to configure secrets

## Project Setup

### 1. Create Supabase Project

```bash
# Visit https://supabase.com/dashboard
# Click "New Project"
# Choose organization and project details

Project Name: gaialabs-platform
Database Password: [generate-secure-password]
Region: [closest-to-your-users]
```

### 2. Get Project Credentials

Navigate to **Settings > API** in your Supabase dashboard:

```env
# Project URL
NEXT_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co

# Anonymous Key (safe for client-side)
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...

# Service Role Key (server-side only, full access)
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...

# Database URL (for Prisma)
SUPABASE_DATABASE_URL=postgresql://postgres:[password]@db.[project].supabase.co:5432/postgres
```

### 3. Configure Database Schema

The GaiaLabs platform uses a unified database schema for all games and users:

```sql
-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Enable Row Level Security
ALTER DATABASE postgres SET "app.jwt_secret" TO 'your-jwt-secret';
```

### 4. Set up Real-time Features

Enable real-time for collaborative editing:

```sql
-- Enable real-time for specific tables
ALTER PUBLICATION supabase_realtime ADD TABLE projects;
ALTER PUBLICATION supabase_realtime ADD TABLE project_collaborators;
ALTER PUBLICATION supabase_realtime ADD TABLE tilemap_edits;
ALTER PUBLICATION supabase_realtime ADD TABLE sprite_edits;
```

## Database Schema Design

### Core Tables

```sql
-- Users table (managed by Supabase Auth)
CREATE TABLE public.users (
  id UUID REFERENCES auth.users(id) PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  username TEXT UNIQUE,
  full_name TEXT,
  avatar_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Games table (multi-game support)
CREATE TABLE public.games (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  title TEXT NOT NULL,
  platform TEXT NOT NULL,
  description TEXT,
  metadata JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Game database versions
CREATE TABLE public.game_database_versions (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  game_id UUID REFERENCES games(id),
  version TEXT NOT NULL,
  database_definition JSONB NOT NULL,
  is_active BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Projects table
CREATE TABLE public.projects (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  game_id UUID REFERENCES games(id),
  owner_id UUID REFERENCES users(id),
  github_repo_url TEXT,
  is_public BOOLEAN DEFAULT false,
  metadata JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Project collaborators
CREATE TABLE public.project_collaborators (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  project_id UUID REFERENCES projects(id),
  user_id UUID REFERENCES users(id),
  role TEXT NOT NULL CHECK (role IN ('owner', 'maintainer', 'contributor', 'viewer')),
  permissions JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(project_id, user_id)
);

-- Real-time collaboration tables
CREATE TABLE public.tilemap_edits (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  project_id UUID REFERENCES projects(id),
  user_id UUID REFERENCES users(id),
  tilemap_data JSONB NOT NULL,
  edit_type TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE public.sprite_edits (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  project_id UUID REFERENCES projects(id),
  user_id UUID REFERENCES users(id),
  sprite_data JSONB NOT NULL,
  edit_type TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### Row Level Security (RLS)

```sql
-- Enable RLS on all tables
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.games ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.project_collaborators ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.tilemap_edits ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.sprite_edits ENABLE ROW LEVEL SECURITY;

-- Users can only see their own profile
CREATE POLICY "Users can view own profile" ON public.users
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Users can update own profile" ON public.users
  FOR UPDATE USING (auth.uid() = id);

-- Games are publicly readable
CREATE POLICY "Games are publicly readable" ON public.games
  FOR SELECT USING (true);

-- Projects access based on collaboration
CREATE POLICY "Project access based on collaboration" ON public.projects
  FOR SELECT USING (
    is_public = true OR 
    owner_id = auth.uid() OR 
    EXISTS (
      SELECT 1 FROM project_collaborators 
      WHERE project_id = projects.id AND user_id = auth.uid()
    )
  );

-- Collaborators can see project collaboration
CREATE POLICY "Collaborators can view project collaboration" ON public.project_collaborators
  FOR SELECT USING (
    user_id = auth.uid() OR 
    EXISTS (
      SELECT 1 FROM projects 
      WHERE id = project_id AND owner_id = auth.uid()
    )
  );

-- Real-time edits based on project access
CREATE POLICY "Real-time edits based on project access" ON public.tilemap_edits
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM projects 
      WHERE id = project_id AND (
        owner_id = auth.uid() OR 
        EXISTS (
          SELECT 1 FROM project_collaborators 
          WHERE project_id = projects.id AND user_id = auth.uid()
        )
      )
    )
  );
```

## Authentication Setup

**Important**: GaiaLabs uses **Supabase Auth exclusively** - no NextAuth.js required! This significantly simplifies the authentication architecture.

### 1. Configure Auth Providers

In Supabase Dashboard > Authentication > Providers:

#### GitHub OAuth
```
Client ID: your-github-client-id
Client Secret: your-github-client-secret
Redirect URL: https://your-project.supabase.co/auth/v1/callback
```

#### Discord OAuth
```
Client ID: your-discord-client-id
Client Secret: your-discord-client-secret
Redirect URL: https://your-project.supabase.co/auth/v1/callback
```

**Note**: OAuth secrets are configured in Supabase dashboard only - no environment variables needed in your applications!

### 2. Configure Email Templates

Customize email templates in Authentication > Email Templates:

- **Confirm signup**: Welcome to GaiaLabs!
- **Magic link**: Sign in to GaiaLabs
- **Change email**: Confirm your new email
- **Reset password**: Reset your GaiaLabs password

### 3. Set up JWT Secret

In Authentication > Settings:

```
JWT Secret: your-jwt-secret-here
JWT Expiry: 3600 (1 hour)
```

## Real-time Configuration

### 1. Enable Real-time for Tables

```sql
-- Enable real-time publications
ALTER PUBLICATION supabase_realtime ADD TABLE projects;
ALTER PUBLICATION supabase_realtime ADD TABLE project_collaborators;
ALTER PUBLICATION supabase_realtime ADD TABLE tilemap_edits;
ALTER PUBLICATION supabase_realtime ADD TABLE sprite_edits;
```

### 2. Configure Real-time Policies

```sql
-- Real-time access policies
CREATE POLICY "Real-time project updates" ON public.projects
  FOR SELECT USING (
    is_public = true OR 
    owner_id = auth.uid() OR 
    EXISTS (
      SELECT 1 FROM project_collaborators 
      WHERE project_id = projects.id AND user_id = auth.uid()
    )
  );
```

## Database Functions

### 1. Project Management Functions

```sql
-- Function to add collaborator
CREATE OR REPLACE FUNCTION add_project_collaborator(
  project_uuid UUID,
  user_email TEXT,
  collaborator_role TEXT
) RETURNS UUID AS $$
DECLARE
  user_uuid UUID;
  collaborator_uuid UUID;
BEGIN
  -- Find user by email
  SELECT id INTO user_uuid FROM public.users WHERE email = user_email;
  
  IF user_uuid IS NULL THEN
    RAISE EXCEPTION 'User not found';
  END IF;
  
  -- Insert collaborator
  INSERT INTO public.project_collaborators (project_id, user_id, role)
  VALUES (project_uuid, user_uuid, collaborator_role)
  RETURNING id INTO collaborator_uuid;
  
  RETURN collaborator_uuid;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to check project permissions
CREATE OR REPLACE FUNCTION check_project_permission(
  project_uuid UUID,
  required_permission TEXT
) RETURNS BOOLEAN AS $$
DECLARE
  user_role TEXT;
BEGIN
  -- Check if user is owner
  IF EXISTS (
    SELECT 1 FROM public.projects 
    WHERE id = project_uuid AND owner_id = auth.uid()
  ) THEN
    RETURN true;
  END IF;
  
  -- Check collaborator role
  SELECT role INTO user_role 
  FROM public.project_collaborators 
  WHERE project_id = project_uuid AND user_id = auth.uid();
  
  -- Permission logic based on role
  CASE required_permission
    WHEN 'read' THEN
      RETURN user_role IS NOT NULL;
    WHEN 'write' THEN
      RETURN user_role IN ('owner', 'maintainer', 'contributor');
    WHEN 'admin' THEN
      RETURN user_role IN ('owner', 'maintainer');
    ELSE
      RETURN false;
  END CASE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
```

### 2. Real-time Collaboration Functions

```sql
-- Function to broadcast tilemap changes
CREATE OR REPLACE FUNCTION broadcast_tilemap_change(
  project_uuid UUID,
  tilemap_data JSONB,
  edit_type TEXT
) RETURNS UUID AS $$
DECLARE
  edit_uuid UUID;
BEGIN
  -- Insert edit record
  INSERT INTO public.tilemap_edits (project_id, user_id, tilemap_data, edit_type)
  VALUES (project_uuid, auth.uid(), tilemap_data, edit_type)
  RETURNING id INTO edit_uuid;
  
  -- Broadcast to real-time subscribers
  PERFORM pg_notify('tilemap_changes', json_build_object(
    'project_id', project_uuid,
    'user_id', auth.uid(),
    'edit_id', edit_uuid,
    'edit_type', edit_type,
    'data', tilemap_data
  )::text);
  
  RETURN edit_uuid;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
```

## Edge Functions

### 1. ROM Processing Function

```typescript
// supabase/functions/process-rom/index.ts
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

serve(async (req) => {
  const { project_id, rom_data } = await req.json()
  
  const supabase = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
  )
  
  // Process ROM data using gaia-core logic
  // This runs server-side for security
  
  return new Response(
    JSON.stringify({ success: true, processed_data: "..." }),
    { headers: { "Content-Type": "application/json" } }
  )
})
```

### 2. Git Integration Function

```typescript
// supabase/functions/git-webhook/index.ts
import { serve } from "https://deno.land/std@0.168.0/http/server.ts"

serve(async (req) => {
  const payload = await req.json()
  
  // Handle GitHub webhook events
  // Update project status, trigger builds, etc.
  
  return new Response(JSON.stringify({ received: true }))
})
```

## Client Integration

### 1. React Hook for Real-time

```typescript
// hooks/useRealtimeProject.ts
import { useEffect, useState } from 'react'
import { supabase } from '../lib/supabase'

export function useRealtimeProject(projectId: string) {
  const [project, setProject] = useState(null)
  const [collaborators, setCollaborators] = useState([])
  
  useEffect(() => {
    // Subscribe to project changes
    const projectSubscription = supabase
      .channel(`project-${projectId}`)
      .on('postgres_changes', {
        event: '*',
        schema: 'public',
        table: 'projects',
        filter: `id=eq.${projectId}`
      }, (payload) => {
        setProject(payload.new)
      })
      .subscribe()
    
    // Subscribe to collaborator changes
    const collaboratorSubscription = supabase
      .channel(`collaborators-${projectId}`)
      .on('postgres_changes', {
        event: '*',
        schema: 'public',
        table: 'project_collaborators',
        filter: `project_id=eq.${projectId}`
      }, (payload) => {
        // Update collaborators list
      })
      .subscribe()
    
    return () => {
      projectSubscription.unsubscribe()
      collaboratorSubscription.unsubscribe()
    }
  }, [projectId])
  
  return { project, collaborators }
}
```

### 2. Tilemap Collaboration Hook

```typescript
// hooks/useTilemapCollaboration.ts
import { useEffect, useCallback } from 'react'
import { supabase } from '../lib/supabase'

export function useTilemapCollaboration(projectId: string) {
  const broadcastChange = useCallback(async (tilemapData: any, editType: string) => {
    const { data, error } = await supabase.rpc('broadcast_tilemap_change', {
      project_uuid: projectId,
      tilemap_data: tilemapData,
      edit_type: editType
    })
    
    if (error) console.error('Error broadcasting change:', error)
    return data
  }, [projectId])
  
  useEffect(() => {
    const subscription = supabase
      .channel(`tilemap-${projectId}`)
      .on('postgres_changes', {
        event: 'INSERT',
        schema: 'public',
        table: 'tilemap_edits',
        filter: `project_id=eq.${projectId}`
      }, (payload) => {
        // Handle real-time tilemap changes from other users
        console.log('Tilemap change received:', payload.new)
      })
      .subscribe()
    
    return () => subscription.unsubscribe()
  }, [projectId])
  
  return { broadcastChange }
}
```

## Security Best Practices

### 1. Environment Variables

```env
# Never expose service role key on client-side
SUPABASE_SERVICE_ROLE_KEY=server-side-only

# Use anon key for client-side
NEXT_PUBLIC_SUPABASE_ANON_KEY=safe-for-client-side
```

### 2. Row Level Security

- **Always enable RLS** on all tables
- **Test policies thoroughly** before production
- **Use auth.uid()** for user-specific access
- **Implement audit logging** for sensitive operations

### 3. API Security

```sql
-- Rate limiting function
CREATE OR REPLACE FUNCTION rate_limit_check(
  identifier TEXT,
  max_requests INTEGER,
  window_seconds INTEGER
) RETURNS BOOLEAN AS $$
-- Implementation for rate limiting
$$ LANGUAGE plpgsql;
```

## Monitoring and Maintenance

### 1. Database Monitoring

- **Query Performance**: Monitor slow queries
- **Connection Pooling**: Configure appropriate limits
- **Backup Strategy**: Verify automatic backups
- **Index Optimization**: Add indexes for frequent queries

### 2. Real-time Monitoring

- **Connection Counts**: Monitor active subscriptions
- **Message Volume**: Track real-time message frequency
- **Error Rates**: Monitor subscription errors

### 3. Cost Optimization

- **Database Size**: Monitor storage usage
- **Bandwidth**: Track API request volume
- **Real-time Usage**: Monitor subscription costs
- **Edge Functions**: Optimize function execution time

This Supabase setup provides a robust foundation for the GaiaLabs platform's collaborative features while maintaining security and performance. 
