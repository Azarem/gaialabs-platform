-- CreateTable
CREATE TABLE "GameMnemonic" (
    "id" TEXT NOT NULL,
    "key" INTEGER NOT NULL,
    "value" TEXT NOT NULL,
    "gameId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GameMnemonic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameCop" (
    "id" TEXT NOT NULL,
    "code" INTEGER NOT NULL,
    "mnem" TEXT NOT NULL,
    "size" INTEGER NOT NULL,
    "halt" BOOLEAN NOT NULL,
    "parts" JSONB NOT NULL,
    "gameId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GameCop_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleaseOverride" (
    "id" TEXT NOT NULL,
    "data" JSONB NOT NULL,
    "releaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ReleaseOverride_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleaseRewrite" (
    "id" TEXT NOT NULL,
    "data" JSONB NOT NULL,
    "releaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ReleaseRewrite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleaseTransform" (
    "id" TEXT NOT NULL,
    "block" TEXT NOT NULL,
    "transforms" JSONB NOT NULL,
    "releaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ReleaseTransform_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleaseLabel" (
    "id" TEXT NOT NULL,
    "location" INTEGER NOT NULL,
    "label" TEXT NOT NULL,
    "releaseId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ReleaseLabel_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "GameMnemonic_gameId_key_key" ON "GameMnemonic"("gameId", "key");

-- CreateIndex
CREATE UNIQUE INDEX "GameCop_gameId_code_key" ON "GameCop"("gameId", "code");

-- CreateIndex
CREATE UNIQUE INDEX "ReleaseTransform_releaseId_block_key" ON "ReleaseTransform"("releaseId", "block");

-- CreateIndex
CREATE UNIQUE INDEX "ReleaseLabel_releaseId_location_key" ON "ReleaseLabel"("releaseId", "location");

-- AddForeignKey
ALTER TABLE "GameMnemonic" ADD CONSTRAINT "GameMnemonic_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameCop" ADD CONSTRAINT "GameCop_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseOverride" ADD CONSTRAINT "ReleaseOverride_releaseId_fkey" FOREIGN KEY ("releaseId") REFERENCES "Release"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseRewrite" ADD CONSTRAINT "ReleaseRewrite_releaseId_fkey" FOREIGN KEY ("releaseId") REFERENCES "Release"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseTransform" ADD CONSTRAINT "ReleaseTransform_releaseId_fkey" FOREIGN KEY ("releaseId") REFERENCES "Release"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseLabel" ADD CONSTRAINT "ReleaseLabel_releaseId_fkey" FOREIGN KEY ("releaseId") REFERENCES "Release"("id") ON DELETE CASCADE ON UPDATE CASCADE;
