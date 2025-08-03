/*
  Warnings:

  - You are about to drop the column `type` on the `GameString` table. All the data in the column will be lost.
  - Added the required column `typeId` to the `GameString` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "GameString" DROP COLUMN "type",
ADD COLUMN     "typeId" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "StringType" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "StringType_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "StringType_name_key" ON "StringType"("name");

-- CreateIndex
CREATE INDEX "GameString_typeId_idx" ON "GameString"("typeId");

-- AddForeignKey
ALTER TABLE "GameString" ADD CONSTRAINT "GameString_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "StringType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
