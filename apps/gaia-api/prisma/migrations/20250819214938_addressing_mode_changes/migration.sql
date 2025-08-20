/*
  Warnings:

  - You are about to drop the column `officialName` on the `AddressingMode` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[instructionSetId,mode]` on the table `AddressingMode` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[instructionSetId,shorthand]` on the table `AddressingMode` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `instructionSetId` to the `AddressingMode` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `AddressingMode` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `mode` on the `AddressingMode` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropIndex
DROP INDEX "AddressingMode_mode_key";

-- DropIndex
DROP INDEX "AddressingMode_shorthand_key";

-- AlterTable
ALTER TABLE "AddressingMode" DROP COLUMN "officialName",
ADD COLUMN     "instructionSetId" TEXT NOT NULL,
ADD COLUMN     "name" TEXT NOT NULL,
DROP COLUMN "mode",
ADD COLUMN     "mode" TEXT NOT NULL;

-- DropEnum
DROP TYPE "AddressingModeType";

-- CreateIndex
CREATE UNIQUE INDEX "AddressingMode_instructionSetId_mode_key" ON "AddressingMode"("instructionSetId", "mode");

-- CreateIndex
CREATE UNIQUE INDEX "AddressingMode_instructionSetId_shorthand_key" ON "AddressingMode"("instructionSetId", "shorthand");

-- AddForeignKey
ALTER TABLE "AddressingMode" ADD CONSTRAINT "AddressingMode_instructionSetId_fkey" FOREIGN KEY ("instructionSetId") REFERENCES "InstructionSet"("id") ON DELETE CASCADE ON UPDATE CASCADE;
