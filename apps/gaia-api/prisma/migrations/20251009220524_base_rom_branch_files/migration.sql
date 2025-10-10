/*
  Warnings:

  - You are about to drop the column `fileCrcs` on the `BaseRomBranch` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "BaseRomBranch" DROP COLUMN "fileCrcs";

-- AlterTable
ALTER TABLE "BaseRomFile" ADD COLUMN     "isText" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "GameRomArtifact" ADD COLUMN     "isText" BOOLEAN NOT NULL DEFAULT false;

-- CreateTable
CREATE TABLE "BaseRomBranchFile" (
    "id" TEXT NOT NULL,
    "branchId" TEXT NOT NULL,
    "fileId" TEXT NOT NULL,

    CONSTRAINT "BaseRomBranchFile_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "BaseRomBranchFile_branchId_idx" ON "BaseRomBranchFile"("branchId");

-- CreateIndex
CREATE INDEX "BaseRomBranchFile_fileId_idx" ON "BaseRomBranchFile"("fileId");

-- CreateIndex
CREATE UNIQUE INDEX "BaseRomBranchFile_branchId_fileId_key" ON "BaseRomBranchFile"("branchId", "fileId");

-- AddForeignKey
ALTER TABLE "BaseRomBranchFile" ADD CONSTRAINT "BaseRomBranchFile_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "BaseRomBranch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BaseRomBranchFile" ADD CONSTRAINT "BaseRomBranchFile_fileId_fkey" FOREIGN KEY ("fileId") REFERENCES "BaseRomFile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

DO $$
BEGIN
  -- Check if we're in a Supabase/production environment by looking for specific extensions
  IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'supabase_vault') OR
     EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'supabase_auth_admin') THEN
    
    -- Grant SELECT permissions on all tables to anonymous role
    GRANT SELECT ON TABLE public."BaseRomBranchFile" TO anon;

    -- Enable Row Level Security on all tables
    ALTER TABLE "BaseRomBranchFile" ENABLE ROW LEVEL SECURITY;

    -- Create anonymous SELECT policies for all tables
    CREATE POLICY "Anonymous can read base rom branch files" ON "BaseRomBranchFile" FOR SELECT TO anon USING (true);

    RAISE NOTICE 'Applied RLS policies and grants for production environment';
  ELSE
    RAISE NOTICE 'Skipped RLS setup - not in production environment';
  END IF;
END
$$;