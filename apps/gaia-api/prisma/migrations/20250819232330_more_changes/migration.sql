/*
  Warnings:

  - You are about to drop the column `block` on the `ReleaseTransform` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[releaseId,releaseBlockId]` on the table `ReleaseTransform` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `releaseBlockId` to the `ReleaseTransform` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "ReleaseTransform_releaseId_block_key";

-- AlterTable
ALTER TABLE "GameBlock" ADD COLUMN     "movable" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "ReleaseBlock" ADD COLUMN     "movable" BOOLEAN;

-- AlterTable
ALTER TABLE "ReleaseTransform" DROP COLUMN "block",
ADD COLUMN     "releaseBlockId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "ReleaseTransform_releaseId_releaseBlockId_key" ON "ReleaseTransform"("releaseId", "releaseBlockId");

-- AddForeignKey
ALTER TABLE "ReleaseTransform" ADD CONSTRAINT "ReleaseTransform_releaseBlockId_fkey" FOREIGN KEY ("releaseBlockId") REFERENCES "ReleaseBlock"("id") ON DELETE CASCADE ON UPDATE CASCADE;
