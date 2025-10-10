/*
  Warnings:

  - You are about to drop the column `fileCrcs` on the `ProjectBranch` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "ProjectBranch" DROP COLUMN "fileCrcs";

-- AlterTable
ALTER TABLE "ProjectFile" ADD COLUMN     "isText" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "text" TEXT,
ALTER COLUMN "data" DROP NOT NULL;

-- CreateTable
CREATE TABLE "ProjectBranchFile" (
    "id" TEXT NOT NULL,
    "branchId" TEXT NOT NULL,
    "fileId" TEXT NOT NULL,

    CONSTRAINT "ProjectBranchFile_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "ProjectBranchFile_branchId_idx" ON "ProjectBranchFile"("branchId");

-- CreateIndex
CREATE INDEX "ProjectBranchFile_fileId_idx" ON "ProjectBranchFile"("fileId");

-- CreateIndex
CREATE UNIQUE INDEX "ProjectBranchFile_branchId_fileId_key" ON "ProjectBranchFile"("branchId", "fileId");

-- AddForeignKey
ALTER TABLE "ProjectBranchFile" ADD CONSTRAINT "ProjectBranchFile_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "ProjectBranch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectBranchFile" ADD CONSTRAINT "ProjectBranchFile_fileId_fkey" FOREIGN KEY ("fileId") REFERENCES "ProjectFile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

DO $$
BEGIN
  -- Check if we're in a Supabase/production environment by looking for specific extensions
  IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'supabase_vault') OR
     EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'supabase_auth_admin') THEN
    
    -- Grant SELECT permissions on all tables to anonymous role
    GRANT SELECT ON TABLE public."ProjectBranchFile" TO anon;

    -- Enable Row Level Security on all tables
    ALTER TABLE "ProjectBranchFile" ENABLE ROW LEVEL SECURITY;

    -- Create anonymous SELECT policies for all tables
    CREATE POLICY "Anonymous can read project branch files" ON "ProjectBranchFile" FOR SELECT TO anon USING (true);

    RAISE NOTICE 'Applied RLS policies and grants for production environment';
  ELSE
    RAISE NOTICE 'Skipped RLS setup - not in production environment';
  END IF;
END
$$;