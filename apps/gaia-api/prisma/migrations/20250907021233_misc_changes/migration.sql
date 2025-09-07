/*
  Warnings:

  - You are about to drop the column `gameRomBranchId` on the `ProjectBranch` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[projectId,version]` on the table `ProjectBranch` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "ProjectBranch" DROP CONSTRAINT "ProjectBranch_gameRomBranchId_fkey";

-- DropIndex
DROP INDEX "ProjectBranch_projectId_name_version_key";

-- AlterTable
ALTER TABLE "ProjectBranch" DROP COLUMN "gameRomBranchId",
ADD COLUMN     "notes" TEXT[];

-- CreateIndex
CREATE UNIQUE INDEX "ProjectBranch_projectId_version_key" ON "ProjectBranch"("projectId", "version");
