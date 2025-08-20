-- CreateTable
CREATE TABLE "GameStruct" (
    "id" TEXT NOT NULL,
    "gameId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "types" JSONB,
    "delimiter" INTEGER,
    "descriminator" INTEGER,
    "parent" TEXT,
    "parts" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "updatedById" TEXT,
    "deletedById" TEXT,

    CONSTRAINT "GameStruct_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleaseStruct" (
    "id" TEXT NOT NULL,
    "releaseId" TEXT NOT NULL,
    "gameStructId" TEXT NOT NULL,
    "name" TEXT,
    "types" JSONB,
    "delimiter" INTEGER,
    "descriminator" INTEGER,
    "parent" TEXT,
    "parts" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "updatedById" TEXT,
    "deletedById" TEXT,

    CONSTRAINT "ReleaseStruct_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "GameStruct_gameId_name_key" ON "GameStruct"("gameId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "ReleaseStruct_releaseId_gameStructId_key" ON "ReleaseStruct"("releaseId", "gameStructId");

-- AddForeignKey
ALTER TABLE "GameStruct" ADD CONSTRAINT "GameStruct_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameStruct" ADD CONSTRAINT "GameStruct_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameStruct" ADD CONSTRAINT "GameStruct_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameStruct" ADD CONSTRAINT "GameStruct_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseStruct" ADD CONSTRAINT "ReleaseStruct_releaseId_fkey" FOREIGN KEY ("releaseId") REFERENCES "Release"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseStruct" ADD CONSTRAINT "ReleaseStruct_gameStructId_fkey" FOREIGN KEY ("gameStructId") REFERENCES "GameStruct"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseStruct" ADD CONSTRAINT "ReleaseStruct_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseStruct" ADD CONSTRAINT "ReleaseStruct_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseStruct" ADD CONSTRAINT "ReleaseStruct_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- Only apply RLS and policies in production (Supabase) environments
DO $$
BEGIN
  -- Check if we're in a Supabase/production environment by looking for specific extensions
  IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'supabase_vault') OR
     EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'supabase_auth_admin') THEN
    
    -- Grant permissions to anonymous role
    GRANT SELECT ON TABLE public."GameStruct" TO anon;
    GRANT SELECT ON TABLE public."ReleaseStruct" TO anon;
    
    -- Enable Row Level Security
    ALTER TABLE "GameStruct" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "ReleaseStruct" ENABLE ROW LEVEL SECURITY;
    
    -- Create policies for anonymous access
    EXECUTE 'CREATE POLICY "Anonymous can read game structs" ON "GameStruct" FOR SELECT TO anon USING (true)';
    EXECUTE 'CREATE POLICY "Anonymous can read release structs" ON "ReleaseStruct" FOR SELECT TO anon USING (true)';
    
    RAISE NOTICE 'Applied RLS policies and grants for production environment';
  ELSE
    RAISE NOTICE 'Skipped RLS setup - not in production environment';
  END IF;
END
$$;
