-- CreateTable
CREATE TABLE "GameRomBranchAsset" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "text" TEXT,
    "data" BYTEA,
    "gameRomBranchId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GameRomBranchAsset_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "GameRomBranchAsset_gameRomBranchId_idx" ON "GameRomBranchAsset"("gameRomBranchId");

-- CreateIndex
CREATE UNIQUE INDEX "GameRomBranchAsset_gameRomBranchId_name_key" ON "GameRomBranchAsset"("gameRomBranchId", "name");

-- AddForeignKey
ALTER TABLE "GameRomBranchAsset" ADD CONSTRAINT "GameRomBranchAsset_gameRomBranchId_fkey" FOREIGN KEY ("gameRomBranchId") REFERENCES "GameRomBranch"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
