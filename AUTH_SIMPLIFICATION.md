# Authentication Simplification: Supabase Auth Only

## Overview

GaiaLabs has been updated to use **Supabase Auth exclusively**, eliminating the need for NextAuth.js. This significantly simplifies the authentication architecture while providing better integration with our real-time collaboration features.

## Key Changes

### ❌ Removed: NextAuth.js
- No more `next-auth` dependency
- No more `[...nextauth].ts` API routes
- No more `NextAuthProvider` components
- No more custom session management
- No more token synchronization between systems

### ✅ Added: Supabase Auth Only
- Single authentication system across all apps
- Built-in OAuth providers (GitHub, Discord)
- Automatic JWT token management
- Unified user sessions
- Real-time user presence
- Row Level Security integration

## Benefits of Simplified Authentication

### 1. Reduced Complexity
- **50% fewer authentication-related files**
- **Single source of truth** for user sessions
- **No token synchronization** between systems
- **Unified user object** across all applications

### 2. Better Integration
- **Native database integration** with Row Level Security
- **Real-time user presence** and session management
- **Automatic API security** with built-in JWT validation
- **Seamless collaboration features** with user context

### 3. Enhanced Developer Experience
- **Simpler setup** - configure OAuth once in Supabase dashboard
- **Consistent API** across all applications
- **Better TypeScript support** with Supabase's generated types
- **Automatic session management** with React hooks

## Implementation Examples

### Login Component
```typescript
// apps/gaia-community/components/Auth/LoginForm.tsx
import { Auth } from '@supabase/auth-ui-react'
import { ThemeSupa } from '@supabase/auth-ui-shared'
import { supabase } from '../../lib/supabase'

export function LoginForm() {
  return (
    <Auth
      supabaseClient={supabase}
      providers={['github', 'discord']}
      appearance={{
        theme: ThemeSupa,
        variables: {
          default: {
            colors: {
              brand: '#404040',
              brandAccent: '#52525b'
            }
          }
        }
      }}
      redirectTo={`${window.location.origin}/dashboard`}
    />
  )
}
```

### Protected Route Hook
```typescript
// packages/gaia-shared/hooks/useAuth.ts
import { useUser, useSupabaseClient } from '@supabase/auth-helpers-react'
import { useRouter } from 'next/router'
import { useEffect } from 'react'

export function useRequireAuth() {
  const user = useUser()
  const router = useRouter()
  
  useEffect(() => {
    if (!user) {
      router.push('/login')
    }
  }, [user, router])
  
  return user
}
```

### User Context
```typescript
// apps/gaia-studio/contexts/UserContext.tsx
import { createContext, useContext } from 'react'
import { useUser } from '@supabase/auth-helpers-react'

const UserContext = createContext<{
  user: any
  isLoading: boolean
}>({
  user: null,
  isLoading: true
})

export function UserProvider({ children }: { children: React.ReactNode }) {
  const user = useUser()
  const isLoading = !user
  
  return (
    <UserContext.Provider value={{ user, isLoading }}>
      {children}
    </UserContext.Provider>
  )
}

export const useAuthUser = () => useContext(UserContext)
```

### API Route Protection
```typescript
// apps/gaia-api/middleware/auth.ts
import { createClient } from '@supabase/supabase-js'

export async function verifyAuth(request: FastifyRequest) {
  const token = request.headers.authorization?.replace('Bearer ', '')
  
  if (!token) {
    throw new Error('No authentication token provided')
  }
  
  const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
  )
  
  const { data: { user }, error } = await supabase.auth.getUser(token)
  
  if (error || !user) {
    throw new Error('Invalid authentication token')
  }
  
  return user
}
```

## Environment Variables Changes

### Removed Variables
```env
# DELETE THESE - No longer needed
NEXTAUTH_SECRET=...
NEXTAUTH_URL=...
GITHUB_CLIENT_ID=...  # Now configured in Supabase dashboard
GITHUB_CLIENT_SECRET=...  # Now configured in Supabase dashboard
DISCORD_CLIENT_ID=...  # Now configured in Supabase dashboard
DISCORD_CLIENT_SECRET=...  # Now configured in Supabase dashboard
```

### Required Variables
```env
# KEEP THESE - Required for Supabase Auth
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

## OAuth Configuration

### Before (NextAuth.js)
OAuth providers were configured in code with environment variables:

```typescript
// pages/api/auth/[...nextauth].ts
export default NextAuth({
  providers: [
    GitHubProvider({
      clientId: process.env.GITHUB_CLIENT_ID!,
      clientSecret: process.env.GITHUB_CLIENT_SECRET!,
    }),
    DiscordProvider({
      clientId: process.env.DISCORD_CLIENT_ID!,
      clientSecret: process.env.DISCORD_CLIENT_SECRET!,
    }),
  ],
  // ... complex configuration
})
```

### After (Supabase Auth)
OAuth providers are configured once in Supabase dashboard:

1. **Go to Supabase Dashboard** → Authentication → Providers
2. **Enable GitHub**: Add Client ID and Secret
3. **Enable Discord**: Add Client ID and Secret
4. **Set Redirect URL**: `https://your-project.supabase.co/auth/v1/callback`

That's it! No code changes needed.

## Migration Checklist

### 1. Remove NextAuth Dependencies
- [ ] Remove `next-auth` from package.json
- [ ] Delete `pages/api/auth/[...nextauth].ts`
- [ ] Remove `NextAuthProvider` components
- [ ] Delete NextAuth environment variables

### 2. Add Supabase Auth Dependencies
- [ ] Add `@supabase/supabase-js` to all apps
- [ ] Add `@supabase/auth-ui-react` for login components
- [ ] Add `@supabase/auth-helpers-nextjs` for Next.js apps
- [ ] Add `@supabase/auth-helpers-react` for React apps

### 3. Configure OAuth Providers
- [ ] Set up GitHub OAuth in Supabase dashboard
- [ ] Set up Discord OAuth in Supabase dashboard
- [ ] Update redirect URLs to use Supabase endpoints

### 4. Update Application Code
- [ ] Replace NextAuth components with Supabase Auth components
- [ ] Update protected routes to use Supabase user hooks
- [ ] Update API routes to use Supabase JWT verification
- [ ] Update user context providers

### 5. Test Authentication Flow
- [ ] Test GitHub OAuth login
- [ ] Test Discord OAuth login
- [ ] Test protected routes
- [ ] Test API authentication
- [ ] Test user sessions across apps

## Real-time Integration Benefits

With Supabase Auth, real-time features become much simpler:

### User Presence
```typescript
// Automatically track online users
const channel = supabase.channel('online-users')
  .on('presence', { event: 'sync' }, () => {
    const state = channel.presenceState()
    console.log('Online users:', state)
  })
  .subscribe(async (status) => {
    if (status === 'SUBSCRIBED') {
      await channel.track({ user_id: user.id, online_at: new Date() })
    }
  })
```

### Collaborative Editing
```typescript
// Real-time collaboration with user context
const { data, error } = await supabase.rpc('broadcast_tilemap_change', {
  project_uuid: projectId,
  tilemap_data: changes,
  edit_type: 'tile_update'
})
// User context automatically included via RLS
```

## Security Improvements

### Row Level Security
```sql
-- Automatic user context in all queries
CREATE POLICY "Users can only access their projects" ON projects
  FOR ALL USING (
    owner_id = auth.uid() OR 
    EXISTS (
      SELECT 1 FROM project_collaborators 
      WHERE project_id = projects.id AND user_id = auth.uid()
    )
  );
```

### JWT Validation
```typescript
// Automatic JWT validation in API routes
const user = await verifyAuth(request)
// User is guaranteed to be authenticated
```

## Performance Benefits

1. **Fewer Network Requests**: No token synchronization between systems
2. **Faster Authentication**: Direct integration with database
3. **Reduced Bundle Size**: Eliminate NextAuth.js dependencies
4. **Better Caching**: Supabase handles session caching automatically

## Troubleshooting

### Common Issues

1. **OAuth Redirect Errors**
   - Ensure redirect URLs in OAuth apps point to Supabase
   - Format: `https://your-project.supabase.co/auth/v1/callback`

2. **Session Not Persisting**
   - Check that `@supabase/auth-helpers-nextjs` is properly configured
   - Verify cookies are enabled in browser

3. **API Authentication Failing**
   - Ensure `Authorization: Bearer <token>` header is sent
   - Verify SUPABASE_SERVICE_ROLE_KEY is set correctly

### Debug Commands
```bash
# Check Supabase project status
npx supabase status

# View auth logs
npx supabase logs --type auth

# Test authentication
curl -H "Authorization: Bearer <token>" https://your-project.supabase.co/rest/v1/projects
```

This authentication simplification makes GaiaLabs more maintainable, secure, and perfectly integrated with our real-time collaboration features. 
