
DO $$
BEGIN
  -- Check if we're in a Supabase/production environment by looking for specific extensions
  IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'supabase_vault') OR
     EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'supabase_auth_admin') THEN
    
    -- Grant SELECT permissions on all tables to anonymous role
    GRANT SELECT ON TABLE public."GameRomBranchAsset" TO anon;

    -- Enable Row Level Security on all tables
    ALTER TABLE "GameRomBranchAsset" ENABLE ROW LEVEL SECURITY;

    -- Create anonymous SELECT policies for all tables
    CREATE POLICY "Anonymous can read game rom branch assets" ON "GameRomBranchAsset" FOR SELECT TO anon USING (true);

    RAISE NOTICE 'Applied RLS policies and grants for production environment';
  ELSE
    RAISE NOTICE 'Skipped RLS setup - not in production environment';
  END IF;
END
$$;
