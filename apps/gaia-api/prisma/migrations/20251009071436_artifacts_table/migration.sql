/*
  Warnings:

  - You are about to drop the `GameRomBranchAsset` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "GameRomBranchAsset" DROP CONSTRAINT "GameRomBranchAsset_gameRomBranchId_fkey";

-- AlterTable
ALTER TABLE "BaseRomFile" ADD COLUMN     "text" TEXT,
ALTER COLUMN "data" DROP NOT NULL;

-- AlterTable
ALTER TABLE "GameRomBranch" ADD COLUMN     "artifactCrcs" INTEGER[];

-- DropTable
DROP TABLE "GameRomBranchAsset";

-- CreateTable
CREATE TABLE "GameRomArtifact" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "version" INTEGER,
    "crc" INTEGER,
    "meta" JSONB,
    "text" TEXT,
    "data" BYTEA,
    "gameRomId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GameRomArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "GameRomArtifact_gameRomId_crc_idx" ON "GameRomArtifact"("gameRomId", "crc");

-- CreateIndex
CREATE INDEX "GameRomArtifact_gameRomId_idx" ON "GameRomArtifact"("gameRomId");

-- CreateIndex
CREATE INDEX "GameRomArtifact_crc_idx" ON "GameRomArtifact"("crc");

-- CreateIndex
CREATE UNIQUE INDEX "GameRomArtifact_gameRomId_name_version_key" ON "GameRomArtifact"("gameRomId", "name", "version");

-- AddForeignKey
ALTER TABLE "GameRomArtifact" ADD CONSTRAINT "GameRomArtifact_gameRomId_fkey" FOREIGN KEY ("gameRomId") REFERENCES "GameRom"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

DO $$
BEGIN
  -- Check if we're in a Supabase/production environment by looking for specific extensions
  IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'supabase_vault') OR
     EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'supabase_auth_admin') THEN
    
    -- Grant SELECT permissions on all tables to anonymous role
    GRANT SELECT ON TABLE public."GameRomArtifact" TO anon;

    -- Enable Row Level Security on all tables
    ALTER TABLE "GameRomArtifact" ENABLE ROW LEVEL SECURITY;

    -- Create anonymous SELECT policies for all tables
    CREATE POLICY "Anonymous can read game rom branch assets" ON "GameRomArtifact" FOR SELECT TO anon USING (true);

    RAISE NOTICE 'Applied RLS policies and grants for production environment';
  ELSE
    RAISE NOTICE 'Skipped RLS setup - not in production environment';
  END IF;
END
$$;
