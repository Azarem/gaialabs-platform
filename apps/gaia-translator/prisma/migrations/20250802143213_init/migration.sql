-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('ADMIN', 'MODERATOR', 'TRANSLATOR', 'REVIEWER', 'VIEWER');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT,
    "fullName" TEXT,
    "avatarUrl" TEXT,
    "githubId" TEXT,
    "role" "UserRole" NOT NULL DEFAULT 'TRANSLATOR',
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SceneGroup" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "SceneGroup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Scene" (
    "id" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "groupId" TEXT NOT NULL,
    "chapterId" TEXT,

    CONSTRAINT "Scene_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Chapter" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "description" TEXT,

    CONSTRAINT "Chapter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "File" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "sceneId" TEXT NOT NULL,

    CONSTRAINT "File_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameString" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "sceneId" TEXT NOT NULL,
    "chapterId" TEXT NOT NULL,
    "fileId" TEXT NOT NULL,

    CONSTRAINT "GameString_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TextRegion" (
    "id" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "language" TEXT NOT NULL,
    "description" TEXT,
    "website" TEXT,
    "isCore" BOOLEAN NOT NULL DEFAULT false,
    "createdOn" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdById" TEXT NOT NULL,
    "updatedOn" TIMESTAMP(3),
    "updatedById" TEXT,
    "deletedOn" TIMESTAMP(3),
    "deletedById" TEXT,

    CONSTRAINT "TextRegion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StringText" (
    "id" TEXT NOT NULL,
    "stringId" TEXT NOT NULL,
    "regionId" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "createdOn" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdById" TEXT NOT NULL,
    "updatedOn" TIMESTAMP(3),
    "updatedById" TEXT,
    "deletedOn" TIMESTAMP(3),
    "deletedById" TEXT,

    CONSTRAINT "StringText_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TextFeedback" (
    "id" TEXT NOT NULL,
    "textId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "feedback" TEXT NOT NULL,
    "isPositive" BOOLEAN NOT NULL,
    "createdOn" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdById" TEXT NOT NULL,
    "updatedOn" TIMESTAMP(3),
    "updatedById" TEXT,
    "deletedOn" TIMESTAMP(3),
    "deletedById" TEXT,

    CONSTRAINT "TextFeedback_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "users_githubId_key" ON "users"("githubId");

-- CreateIndex
CREATE UNIQUE INDEX "SceneGroup_name_key" ON "SceneGroup"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Scene_code_key" ON "Scene"("code");

-- CreateIndex
CREATE UNIQUE INDEX "Scene_name_key" ON "Scene"("name");

-- CreateIndex
CREATE INDEX "Scene_groupId_idx" ON "Scene"("groupId");

-- CreateIndex
CREATE INDEX "Scene_chapterId_idx" ON "Scene"("chapterId");

-- CreateIndex
CREATE UNIQUE INDEX "Chapter_name_key" ON "Chapter"("name");

-- CreateIndex
CREATE UNIQUE INDEX "File_name_key" ON "File"("name");

-- CreateIndex
CREATE INDEX "File_sceneId_idx" ON "File"("sceneId");

-- CreateIndex
CREATE INDEX "GameString_sceneId_idx" ON "GameString"("sceneId");

-- CreateIndex
CREATE INDEX "GameString_chapterId_idx" ON "GameString"("chapterId");

-- CreateIndex
CREATE INDEX "GameString_fileId_idx" ON "GameString"("fileId");

-- CreateIndex
CREATE UNIQUE INDEX "TextRegion_code_key" ON "TextRegion"("code");

-- CreateIndex
CREATE UNIQUE INDEX "TextRegion_name_key" ON "TextRegion"("name");

-- CreateIndex
CREATE INDEX "StringText_stringId_idx" ON "StringText"("stringId");

-- CreateIndex
CREATE INDEX "StringText_regionId_idx" ON "StringText"("regionId");

-- CreateIndex
CREATE UNIQUE INDEX "StringText_stringId_regionId_key" ON "StringText"("stringId", "regionId");

-- CreateIndex
CREATE INDEX "TextFeedback_textId_idx" ON "TextFeedback"("textId");

-- CreateIndex
CREATE INDEX "TextFeedback_userId_idx" ON "TextFeedback"("userId");

-- AddForeignKey
ALTER TABLE "Scene" ADD CONSTRAINT "Scene_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "SceneGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Scene" ADD CONSTRAINT "Scene_chapterId_fkey" FOREIGN KEY ("chapterId") REFERENCES "Chapter"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_sceneId_fkey" FOREIGN KEY ("sceneId") REFERENCES "Scene"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameString" ADD CONSTRAINT "GameString_sceneId_fkey" FOREIGN KEY ("sceneId") REFERENCES "Scene"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameString" ADD CONSTRAINT "GameString_chapterId_fkey" FOREIGN KEY ("chapterId") REFERENCES "Chapter"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameString" ADD CONSTRAINT "GameString_fileId_fkey" FOREIGN KEY ("fileId") REFERENCES "File"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TextRegion" ADD CONSTRAINT "TextRegion_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TextRegion" ADD CONSTRAINT "TextRegion_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TextRegion" ADD CONSTRAINT "TextRegion_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StringText" ADD CONSTRAINT "StringText_stringId_fkey" FOREIGN KEY ("stringId") REFERENCES "GameString"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StringText" ADD CONSTRAINT "StringText_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES "TextRegion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StringText" ADD CONSTRAINT "StringText_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StringText" ADD CONSTRAINT "StringText_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StringText" ADD CONSTRAINT "StringText_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TextFeedback" ADD CONSTRAINT "TextFeedback_textId_fkey" FOREIGN KEY ("textId") REFERENCES "StringText"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TextFeedback" ADD CONSTRAINT "TextFeedback_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TextFeedback" ADD CONSTRAINT "TextFeedback_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TextFeedback" ADD CONSTRAINT "TextFeedback_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TextFeedback" ADD CONSTRAINT "TextFeedback_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;
