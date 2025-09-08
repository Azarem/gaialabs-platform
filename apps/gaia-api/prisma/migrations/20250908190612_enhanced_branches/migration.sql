/*
  Warnings:

  - You are about to drop the column `isPublic` on the `BaseRomBranch` table. All the data in the column will be lost.
  - You are about to drop the column `isPublic` on the `GameRomBranch` table. All the data in the column will be lost.
  - You are about to drop the column `isPublic` on the `PlatformBranch` table. All the data in the column will be lost.
  - You are about to drop the column `meta` on the `PlatformBranch` table. All the data in the column will be lost.
  - You are about to drop the column `isPublic` on the `ProjectBranch` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[baseRomId,name]` on the table `BaseRomBranch` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[baseRomId,version]` on the table `BaseRomBranch` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[baseRomId,isActive]` on the table `BaseRomBranch` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[gameRomId,name]` on the table `GameRomBranch` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[gameRomId,version]` on the table `GameRomBranch` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[gameRomId,isActive]` on the table `GameRomBranch` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[platformId,name]` on the table `PlatformBranch` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[platformId,version]` on the table `PlatformBranch` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[platformId,isActive]` on the table `PlatformBranch` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[projectId,name]` on the table `ProjectBranch` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[projectId,isActive]` on the table `ProjectBranch` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "BaseRomBranch_baseRomId_name_version_key";

-- DropIndex
DROP INDEX "GameRomBranch_gameRomId_name_version_key";

-- DropIndex
DROP INDEX "PlatformBranch_platformId_name_version_key";

-- AlterTable
ALTER TABLE "BaseRomBranch" DROP COLUMN "isPublic",
ADD COLUMN     "isActive" BOOLEAN,
ADD COLUMN     "notes" TEXT[];

-- AlterTable
ALTER TABLE "GameRomBranch" DROP COLUMN "isPublic",
ADD COLUMN     "isActive" BOOLEAN,
ADD COLUMN     "notes" TEXT[];

-- AlterTable
ALTER TABLE "PlatformBranch" DROP COLUMN "isPublic",
DROP COLUMN "meta",
ADD COLUMN     "isActive" BOOLEAN,
ADD COLUMN     "notes" TEXT[];

-- AlterTable
ALTER TABLE "ProjectBranch" DROP COLUMN "isPublic",
ADD COLUMN     "isActive" BOOLEAN;

-- CreateIndex
CREATE INDEX "BaseRom_gameId_name_idx" ON "BaseRom"("gameId", "name");

-- CreateIndex
CREATE INDEX "BaseRomBranch_baseRomId_name_idx" ON "BaseRomBranch"("baseRomId", "name");

-- CreateIndex
CREATE INDEX "BaseRomBranch_baseRomId_version_idx" ON "BaseRomBranch"("baseRomId", "version");

-- CreateIndex
CREATE INDEX "BaseRomBranch_baseRomId_isActive_idx" ON "BaseRomBranch"("baseRomId", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "BaseRomBranch_baseRomId_name_key" ON "BaseRomBranch"("baseRomId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "BaseRomBranch_baseRomId_version_key" ON "BaseRomBranch"("baseRomId", "version");

-- CreateIndex
CREATE UNIQUE INDEX "BaseRomBranch_baseRomId_isActive_key" ON "BaseRomBranch"("baseRomId", "isActive");

-- CreateIndex
CREATE INDEX "GameRomBranch_gameRomId_name_idx" ON "GameRomBranch"("gameRomId", "name");

-- CreateIndex
CREATE INDEX "GameRomBranch_gameRomId_version_idx" ON "GameRomBranch"("gameRomId", "version");

-- CreateIndex
CREATE INDEX "GameRomBranch_gameRomId_isActive_idx" ON "GameRomBranch"("gameRomId", "isActive");

-- CreateIndex
CREATE INDEX "GameRomBranch_platformBranchId_idx" ON "GameRomBranch"("platformBranchId");

-- CreateIndex
CREATE UNIQUE INDEX "GameRomBranch_gameRomId_name_key" ON "GameRomBranch"("gameRomId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "GameRomBranch_gameRomId_version_key" ON "GameRomBranch"("gameRomId", "version");

-- CreateIndex
CREATE UNIQUE INDEX "GameRomBranch_gameRomId_isActive_key" ON "GameRomBranch"("gameRomId", "isActive");

-- CreateIndex
CREATE INDEX "PlatformBranch_platformId_name_idx" ON "PlatformBranch"("platformId", "name");

-- CreateIndex
CREATE INDEX "PlatformBranch_platformId_version_idx" ON "PlatformBranch"("platformId", "version");

-- CreateIndex
CREATE INDEX "PlatformBranch_platformId_isActive_idx" ON "PlatformBranch"("platformId", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "PlatformBranch_platformId_name_key" ON "PlatformBranch"("platformId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "PlatformBranch_platformId_version_key" ON "PlatformBranch"("platformId", "version");

-- CreateIndex
CREATE UNIQUE INDEX "PlatformBranch_platformId_isActive_key" ON "PlatformBranch"("platformId", "isActive");

-- CreateIndex
CREATE INDEX "ProjectBranch_projectId_name_idx" ON "ProjectBranch"("projectId", "name");

-- CreateIndex
CREATE INDEX "ProjectBranch_projectId_version_idx" ON "ProjectBranch"("projectId", "version");

-- CreateIndex
CREATE INDEX "ProjectBranch_projectId_isActive_idx" ON "ProjectBranch"("projectId", "isActive");

-- CreateIndex
CREATE UNIQUE INDEX "ProjectBranch_projectId_name_key" ON "ProjectBranch"("projectId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "ProjectBranch_projectId_isActive_key" ON "ProjectBranch"("projectId", "isActive");
