-- CreateTable
CREATE TABLE "Platform" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "meta" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Platform_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PlatformBranch" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "version" INTEGER,
    "isPublic" BOOLEAN NOT NULL DEFAULT false,
    "meta" JSONB,
    "platformId" TEXT NOT NULL,
    "addressingModes" JSONB,
    "instructionSet" JSONB,
    "vectors" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PlatformBranch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Developer" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "meta" JSONB,
    "platformId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Developer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Region" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "meta" JSONB,
    "platformId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Region_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Game" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "meta" JSONB,
    "platformId" TEXT NOT NULL,
    "developerId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Game_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameRom" (
    "id" TEXT NOT NULL,
    "crc" INTEGER NOT NULL,
    "meta" JSONB,
    "gameId" TEXT NOT NULL,
    "regionId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GameRom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameRomBranch" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "version" INTEGER,
    "isPublic" BOOLEAN NOT NULL DEFAULT false,
    "gameRomId" TEXT NOT NULL,
    "platformBranchId" TEXT NOT NULL,
    "coplib" JSONB,
    "config" JSONB,
    "files" JSONB,
    "blocks" JSONB,
    "fixups" JSONB,
    "types" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GameRomBranch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BaseRom" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "gameId" TEXT NOT NULL,
    "gameRomId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BaseRom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BaseRomBranch" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "version" INTEGER,
    "isPublic" BOOLEAN NOT NULL DEFAULT false,
    "baseRomId" TEXT NOT NULL,
    "gameRomBranchId" TEXT NOT NULL,
    "fileCrcs" INTEGER[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BaseRomBranch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BaseRomFile" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "version" INTEGER,
    "crc" INTEGER,
    "meta" JSONB,
    "baseRomId" TEXT NOT NULL,
    "data" BYTEA NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BaseRomFile_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Platform_name_key" ON "Platform"("name");

-- CreateIndex
CREATE INDEX "PlatformBranch_platformId_idx" ON "PlatformBranch"("platformId");

-- CreateIndex
CREATE UNIQUE INDEX "PlatformBranch_platformId_name_version_key" ON "PlatformBranch"("platformId", "name", "version");

-- CreateIndex
CREATE INDEX "Developer_platformId_idx" ON "Developer"("platformId");

-- CreateIndex
CREATE UNIQUE INDEX "Developer_platformId_name_key" ON "Developer"("platformId", "name");

-- CreateIndex
CREATE INDEX "Region_platformId_idx" ON "Region"("platformId");

-- CreateIndex
CREATE UNIQUE INDEX "Region_platformId_name_key" ON "Region"("platformId", "name");

-- CreateIndex
CREATE INDEX "Game_platformId_idx" ON "Game"("platformId");

-- CreateIndex
CREATE INDEX "Game_developerId_idx" ON "Game"("developerId");

-- CreateIndex
CREATE UNIQUE INDEX "Game_platformId_name_key" ON "Game"("platformId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "GameRom_crc_key" ON "GameRom"("crc");

-- CreateIndex
CREATE INDEX "GameRom_gameId_idx" ON "GameRom"("gameId");

-- CreateIndex
CREATE INDEX "GameRom_regionId_idx" ON "GameRom"("regionId");

-- CreateIndex
CREATE INDEX "GameRomBranch_gameRomId_idx" ON "GameRomBranch"("gameRomId");

-- CreateIndex
CREATE UNIQUE INDEX "GameRomBranch_gameRomId_name_version_key" ON "GameRomBranch"("gameRomId", "name", "version");

-- CreateIndex
CREATE UNIQUE INDEX "BaseRom_name_key" ON "BaseRom"("name");

-- CreateIndex
CREATE INDEX "BaseRom_gameId_idx" ON "BaseRom"("gameId");

-- CreateIndex
CREATE INDEX "BaseRom_gameRomId_idx" ON "BaseRom"("gameRomId");

-- CreateIndex
CREATE UNIQUE INDEX "BaseRom_gameId_name_key" ON "BaseRom"("gameId", "name");

-- CreateIndex
CREATE INDEX "BaseRomBranch_gameRomBranchId_idx" ON "BaseRomBranch"("gameRomBranchId");

-- CreateIndex
CREATE INDEX "BaseRomBranch_baseRomId_idx" ON "BaseRomBranch"("baseRomId");

-- CreateIndex
CREATE UNIQUE INDEX "BaseRomBranch_baseRomId_name_version_key" ON "BaseRomBranch"("baseRomId", "name", "version");

-- CreateIndex
CREATE INDEX "BaseRomFile_baseRomId_crc_idx" ON "BaseRomFile"("baseRomId", "crc");

-- CreateIndex
CREATE INDEX "BaseRomFile_baseRomId_idx" ON "BaseRomFile"("baseRomId");

-- CreateIndex
CREATE INDEX "BaseRomFile_crc_idx" ON "BaseRomFile"("crc");

-- CreateIndex
CREATE UNIQUE INDEX "BaseRomFile_baseRomId_name_version_key" ON "BaseRomFile"("baseRomId", "name", "version");

-- AddForeignKey
ALTER TABLE "PlatformBranch" ADD CONSTRAINT "PlatformBranch_platformId_fkey" FOREIGN KEY ("platformId") REFERENCES "Platform"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Developer" ADD CONSTRAINT "Developer_platformId_fkey" FOREIGN KEY ("platformId") REFERENCES "Platform"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Region" ADD CONSTRAINT "Region_platformId_fkey" FOREIGN KEY ("platformId") REFERENCES "Platform"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Game" ADD CONSTRAINT "Game_platformId_fkey" FOREIGN KEY ("platformId") REFERENCES "Platform"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Game" ADD CONSTRAINT "Game_developerId_fkey" FOREIGN KEY ("developerId") REFERENCES "Developer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameRom" ADD CONSTRAINT "GameRom_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameRom" ADD CONSTRAINT "GameRom_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES "Region"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameRomBranch" ADD CONSTRAINT "GameRomBranch_gameRomId_fkey" FOREIGN KEY ("gameRomId") REFERENCES "GameRom"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameRomBranch" ADD CONSTRAINT "GameRomBranch_platformBranchId_fkey" FOREIGN KEY ("platformBranchId") REFERENCES "PlatformBranch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BaseRom" ADD CONSTRAINT "BaseRom_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BaseRom" ADD CONSTRAINT "BaseRom_gameRomId_fkey" FOREIGN KEY ("gameRomId") REFERENCES "GameRom"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BaseRomBranch" ADD CONSTRAINT "BaseRomBranch_baseRomId_fkey" FOREIGN KEY ("baseRomId") REFERENCES "BaseRom"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BaseRomBranch" ADD CONSTRAINT "BaseRomBranch_gameRomBranchId_fkey" FOREIGN KEY ("gameRomBranchId") REFERENCES "GameRomBranch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BaseRomFile" ADD CONSTRAINT "BaseRomFile_baseRomId_fkey" FOREIGN KEY ("baseRomId") REFERENCES "BaseRom"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

DO $$
BEGIN
  -- Check if we're in a Supabase/production environment by looking for specific extensions
  IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'supabase_vault') OR
     EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'supabase_auth_admin') THEN
    
    GRANT USAGE ON SCHEMA public TO anon;

    -- Grant SELECT permissions on all tables to anonymous role
    GRANT SELECT ON TABLE public."Game" TO anon;
    GRANT SELECT ON TABLE public."GameRom" TO anon;
    GRANT SELECT ON TABLE public."Platform" TO anon;
    GRANT SELECT ON TABLE public."PlatformBranch" TO anon;
    GRANT SELECT ON TABLE public."Developer" TO anon;
    GRANT SELECT ON TABLE public."Region" TO anon;
    GRANT SELECT ON TABLE public."GameRomBranch" TO anon;
    GRANT SELECT ON TABLE public."BaseRom" TO anon;
    GRANT SELECT ON TABLE public."BaseRomBranch" TO anon;
    GRANT SELECT ON TABLE public."BaseRomFile" TO anon;

    -- Enable Row Level Security on all tables
    ALTER TABLE "Game" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "GameRom" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "Platform" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "PlatformBranch" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "Developer" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "Region" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "GameRomBranch" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "BaseRom" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "BaseRomBranch" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "BaseRomFile" ENABLE ROW LEVEL SECURITY;

    -- Create anonymous SELECT policies for all tables
    CREATE POLICY "Anonymous can read games" ON "Game" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read game r" ON "GameRom" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read game blocks" ON "GameRomBranch" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read game parts" ON "BaseRom" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read release files" ON "BaseRomBranch" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read release blocks" ON "BaseRomFile" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read instruction sets" ON "Platform" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read instruction groups" ON "PlatformBranch" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read developers" ON "Developer" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read instruction variants" ON "Region" FOR SELECT TO anon USING (true);

    RAISE NOTICE 'Applied RLS policies and grants for production environment';
  ELSE
    RAISE NOTICE 'Skipped RLS setup - not in production environment';
  END IF;
END
$$;