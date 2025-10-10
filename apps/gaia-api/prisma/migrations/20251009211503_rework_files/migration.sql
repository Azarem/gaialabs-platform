/*
  Warnings:

  - You are about to drop the column `artifactCrcs` on the `GameRomBranch` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "GameRomBranch" DROP COLUMN "artifactCrcs";

-- CreateTable
CREATE TABLE "GameRomBranchArtifact" (
    "id" TEXT NOT NULL,
    "branchId" TEXT NOT NULL,
    "artifactId" TEXT NOT NULL,

    CONSTRAINT "GameRomBranchArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "GameRomBranchArtifact_branchId_idx" ON "GameRomBranchArtifact"("branchId");

-- CreateIndex
CREATE INDEX "GameRomBranchArtifact_artifactId_idx" ON "GameRomBranchArtifact"("artifactId");

-- CreateIndex
CREATE UNIQUE INDEX "GameRomBranchArtifact_branchId_artifactId_key" ON "GameRomBranchArtifact"("branchId", "artifactId");

-- AddForeignKey
ALTER TABLE "GameRomBranchArtifact" ADD CONSTRAINT "GameRomBranchArtifact_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "GameRomBranch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameRomBranchArtifact" ADD CONSTRAINT "GameRomBranchArtifact_artifactId_fkey" FOREIGN KEY ("artifactId") REFERENCES "GameRomArtifact"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

DO $$
BEGIN
  -- Check if we're in a Supabase/production environment by looking for specific extensions
  IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'supabase_vault') OR
     EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'supabase_auth_admin') THEN
    
    -- Grant SELECT permissions on all tables to anonymous role
    GRANT SELECT ON TABLE public."GameRomBranchArtifact" TO anon;

    -- Enable Row Level Security on all tables
    ALTER TABLE "GameRomBranchArtifact" ENABLE ROW LEVEL SECURITY;

    -- Create anonymous SELECT policies for all tables
    CREATE POLICY "Anonymous can read game rom branch artifacts" ON "GameRomBranchArtifact" FOR SELECT TO anon USING (true);

    RAISE NOTICE 'Applied RLS policies and grants for production environment';
  ELSE
    RAISE NOTICE 'Skipped RLS setup - not in production environment';
  END IF;
END
$$;