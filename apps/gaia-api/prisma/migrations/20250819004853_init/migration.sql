-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('USER', 'MODERATOR', 'ADMIN');

-- CreateEnum
CREATE TYPE "ProcessorFlag" AS ENUM ('N', 'V', 'M', 'X', 'D', 'I', 'Z', 'C', 'B', 'E', '*');

-- CreateEnum
CREATE TYPE "AddressingModeType" AS ENUM ('Immediate', 'Absolute', 'AbsoluteLong', 'DirectPage', 'DirectPageIndirect', 'DirectPageIndirectLong', 'AbsoluteIndexedX', 'AbsoluteLongIndexedX', 'AbsoluteIndexedY', 'DirectPageIndexedX', 'DirectPageIndexedY', 'DirectPageIndexedIndirectX', 'DirectPageIndirectIndexedY', 'DirectPageIndirectLongIndexedY', 'StackRelative', 'StackRelativeIndirectIndexedY', 'Accumulator', 'Implied', 'Stack', 'StackInterrupt', 'PCRelative', 'PCRelativeLong', 'AbsoluteIndirect', 'AbsoluteIndirectLong', 'AbsoluteIndexedIndirect', 'BlockMove');

-- CreateEnum
CREATE TYPE "InstructionCategory" AS ENUM ('LoadStore', 'Arithmetic', 'Logical', 'Shift', 'ControlFlow', 'Branch', 'System', 'Interrupt', 'Flags', 'Stack', 'Transfer', 'BlockMove', 'Special');

-- CreateEnum
CREATE TYPE "OperandType" AS ENUM ('Absolute', 'AbsoluteLong', 'Direct', 'Immediate', 'None', 'Label', 'Byte', 'BankPair', 'InterruptVector');

-- CreateTable
CREATE TABLE "Game" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "platform" TEXT NOT NULL,
    "meta" JSONB,
    "romDeveloper" INTEGER,
    "romMode" INTEGER,
    "romChipset" INTEGER,
    "romSize" INTEGER,
    "ramSize" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "updatedById" TEXT,
    "deletedById" TEXT,

    CONSTRAINT "Game_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameFile" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT,
    "group" TEXT,
    "scene" TEXT,
    "gameId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "updatedById" TEXT,
    "deletedById" TEXT,

    CONSTRAINT "GameFile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameBlock" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "group" TEXT,
    "scene" TEXT,
    "gameId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "updatedById" TEXT,
    "deletedById" TEXT,

    CONSTRAINT "GameBlock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GamePart" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "struct" TEXT,
    "order" INTEGER NOT NULL DEFAULT 0,
    "gameBlockId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "updatedById" TEXT,
    "deletedById" TEXT,

    CONSTRAINT "GamePart_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Release" (
    "id" TEXT NOT NULL,
    "romVersion" INTEGER NOT NULL,
    "romRegion" INTEGER NOT NULL,
    "romTitle" TEXT,
    "romCode" TEXT,
    "romCrc" INTEGER,
    "gameId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "updatedById" TEXT,
    "deletedById" TEXT,

    CONSTRAINT "Release_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleaseFile" (
    "id" TEXT NOT NULL,
    "releaseId" TEXT NOT NULL,
    "gameFileId" TEXT NOT NULL,
    "name" TEXT,
    "type" TEXT,
    "group" TEXT,
    "scene" TEXT,
    "romLocation" INTEGER,
    "romSize" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "updatedById" TEXT,
    "deletedById" TEXT,

    CONSTRAINT "ReleaseFile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleaseBlock" (
    "id" TEXT NOT NULL,
    "releaseId" TEXT NOT NULL,
    "gameBlockId" TEXT NOT NULL,
    "name" TEXT,
    "group" TEXT,
    "scene" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "updatedById" TEXT,
    "deletedById" TEXT,

    CONSTRAINT "ReleaseBlock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleasePart" (
    "id" TEXT NOT NULL,
    "releaseId" TEXT NOT NULL,
    "gamePartId" TEXT NOT NULL,
    "name" TEXT,
    "struct" TEXT,
    "order" INTEGER,
    "romLocation" INTEGER,
    "romSize" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "updatedById" TEXT,
    "deletedById" TEXT,

    CONSTRAINT "ReleasePart_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Account" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "sessionToken" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT,
    "emailVerified" TIMESTAMP(3),
    "image" TEXT,
    "role" "UserRole" NOT NULL DEFAULT 'USER',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VerificationToken" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "InstructionSet" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "description" TEXT,
    "baseProcessor" TEXT,
    "generatedFrom" TEXT,
    "totalInstructions" INTEGER NOT NULL,
    "totalVariants" INTEGER NOT NULL,
    "cycleNotation" JSONB NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InstructionSet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InstructionGroup" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" "InstructionCategory" NOT NULL,
    "description" TEXT,
    "instructionSetId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InstructionGroup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Instruction" (
    "id" TEXT NOT NULL,
    "mnemonic" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "affectedFlags" "ProcessorFlag"[],
    "instructionGroupId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Instruction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InstructionVariant" (
    "id" TEXT NOT NULL,
    "opcode" INTEGER NOT NULL,
    "size" INTEGER,
    "isFlagDependent" BOOLEAN NOT NULL DEFAULT false,
    "cycleTiming" JSONB NOT NULL,
    "instructionId" TEXT NOT NULL,
    "addressingModeId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InstructionVariant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AddressingMode" (
    "id" TEXT NOT NULL,
    "mode" "AddressingModeType" NOT NULL,
    "shorthand" TEXT NOT NULL,
    "operandType" "OperandType" NOT NULL,
    "description" TEXT NOT NULL,
    "officialName" TEXT,
    "length" INTEGER NOT NULL,
    "format" TEXT NOT NULL,
    "formatString" TEXT NOT NULL,
    "parseRegex" TEXT NOT NULL,
    "operandSize" INTEGER NOT NULL,
    "supportsSymbols" BOOLEAN NOT NULL DEFAULT false,
    "bankWrapping" BOOLEAN NOT NULL DEFAULT false,
    "pageWrapping" BOOLEAN NOT NULL DEFAULT false,
    "validationPatterns" JSONB NOT NULL,
    "examples" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AddressingMode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ValidationRule" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "rules" JSONB NOT NULL,
    "instructionSetId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ValidationRule_pkey" PRIMARY KEY ("id")
);

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

-- CreateTable
CREATE TABLE "GameString" (
    "id" TEXT NOT NULL,
    "gameId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "delimiter" TEXT NOT NULL,
    "shiftType" TEXT,
    "terminator" INTEGER NOT NULL,
    "greedyTerminator" BOOLEAN NOT NULL DEFAULT false,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "updatedById" TEXT,
    "deletedById" TEXT,

    CONSTRAINT "GameString_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GameStringCommand" (
    "id" TEXT NOT NULL,
    "key" INTEGER NOT NULL,
    "value" TEXT NOT NULL,
    "types" JSONB NOT NULL,
    "delimiter" INTEGER,
    "halt" BOOLEAN NOT NULL DEFAULT false,
    "gameStringId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GameStringCommand_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleaseString" (
    "id" TEXT NOT NULL,
    "releaseId" TEXT NOT NULL,
    "gameStringId" TEXT NOT NULL,
    "name" TEXT,
    "delimiter" TEXT,
    "shiftType" TEXT,
    "terminator" INTEGER,
    "greedyTerminator" BOOLEAN,
    "characterMap" JSONB NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "updatedById" TEXT,
    "deletedById" TEXT,

    CONSTRAINT "ReleaseString_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleaseStringCommand" (
    "id" TEXT NOT NULL,
    "releaseStringId" TEXT NOT NULL,
    "gameStringCommandId" TEXT NOT NULL,
    "key" INTEGER,
    "value" TEXT,
    "types" JSONB,
    "delimiter" INTEGER,
    "halt" BOOLEAN,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdById" TEXT,
    "updatedById" TEXT,
    "deletedById" TEXT,

    CONSTRAINT "ReleaseStringCommand_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleaseStringLayer" (
    "id" TEXT NOT NULL,
    "base" INTEGER NOT NULL,
    "map" JSONB NOT NULL,
    "releaseStringId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ReleaseStringLayer_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Game_title_key" ON "Game"("title");

-- CreateIndex
CREATE UNIQUE INDEX "GameFile_gameId_name_key" ON "GameFile"("gameId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "GameBlock_gameId_name_key" ON "GameBlock"("gameId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "GamePart_gameBlockId_name_key" ON "GamePart"("gameBlockId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Release_gameId_romVersion_romRegion_key" ON "Release"("gameId", "romVersion", "romRegion");

-- CreateIndex
CREATE UNIQUE INDEX "ReleaseFile_releaseId_gameFileId_key" ON "ReleaseFile"("releaseId", "gameFileId");

-- CreateIndex
CREATE UNIQUE INDEX "ReleaseBlock_releaseId_gameBlockId_key" ON "ReleaseBlock"("releaseId", "gameBlockId");

-- CreateIndex
CREATE UNIQUE INDEX "ReleasePart_releaseId_gamePartId_key" ON "ReleasePart"("releaseId", "gamePartId");

-- CreateIndex
CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON "Account"("provider", "providerAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "Session"("sessionToken");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_token_key" ON "VerificationToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON "VerificationToken"("identifier", "token");

-- CreateIndex
CREATE UNIQUE INDEX "InstructionSet_name_key" ON "InstructionSet"("name");

-- CreateIndex
CREATE UNIQUE INDEX "InstructionGroup_instructionSetId_name_key" ON "InstructionGroup"("instructionSetId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Instruction_instructionGroupId_mnemonic_key" ON "Instruction"("instructionGroupId", "mnemonic");

-- CreateIndex
CREATE UNIQUE INDEX "InstructionVariant_opcode_key" ON "InstructionVariant"("opcode");

-- CreateIndex
CREATE UNIQUE INDEX "AddressingMode_mode_key" ON "AddressingMode"("mode");

-- CreateIndex
CREATE UNIQUE INDEX "AddressingMode_shorthand_key" ON "AddressingMode"("shorthand");

-- CreateIndex
CREATE UNIQUE INDEX "ValidationRule_instructionSetId_name_category_key" ON "ValidationRule"("instructionSetId", "name", "category");

-- CreateIndex
CREATE UNIQUE INDEX "GameMnemonic_gameId_key_key" ON "GameMnemonic"("gameId", "key");

-- CreateIndex
CREATE UNIQUE INDEX "GameCop_gameId_code_key" ON "GameCop"("gameId", "code");

-- CreateIndex
CREATE UNIQUE INDEX "ReleaseTransform_releaseId_block_key" ON "ReleaseTransform"("releaseId", "block");

-- CreateIndex
CREATE UNIQUE INDEX "ReleaseLabel_releaseId_location_key" ON "ReleaseLabel"("releaseId", "location");

-- CreateIndex
CREATE UNIQUE INDEX "GameString_gameId_name_key" ON "GameString"("gameId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "GameStringCommand_gameStringId_key_key" ON "GameStringCommand"("gameStringId", "key");

-- CreateIndex
CREATE UNIQUE INDEX "ReleaseString_releaseId_gameStringId_key" ON "ReleaseString"("releaseId", "gameStringId");

-- CreateIndex
CREATE UNIQUE INDEX "ReleaseStringCommand_releaseStringId_gameStringCommandId_key" ON "ReleaseStringCommand"("releaseStringId", "gameStringCommandId");

-- AddForeignKey
ALTER TABLE "Game" ADD CONSTRAINT "Game_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Game" ADD CONSTRAINT "Game_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Game" ADD CONSTRAINT "Game_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameFile" ADD CONSTRAINT "GameFile_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameFile" ADD CONSTRAINT "GameFile_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameFile" ADD CONSTRAINT "GameFile_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameFile" ADD CONSTRAINT "GameFile_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameBlock" ADD CONSTRAINT "GameBlock_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameBlock" ADD CONSTRAINT "GameBlock_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameBlock" ADD CONSTRAINT "GameBlock_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameBlock" ADD CONSTRAINT "GameBlock_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GamePart" ADD CONSTRAINT "GamePart_gameBlockId_fkey" FOREIGN KEY ("gameBlockId") REFERENCES "GameBlock"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GamePart" ADD CONSTRAINT "GamePart_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GamePart" ADD CONSTRAINT "GamePart_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GamePart" ADD CONSTRAINT "GamePart_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Release" ADD CONSTRAINT "Release_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Release" ADD CONSTRAINT "Release_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Release" ADD CONSTRAINT "Release_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Release" ADD CONSTRAINT "Release_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseFile" ADD CONSTRAINT "ReleaseFile_releaseId_fkey" FOREIGN KEY ("releaseId") REFERENCES "Release"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseFile" ADD CONSTRAINT "ReleaseFile_gameFileId_fkey" FOREIGN KEY ("gameFileId") REFERENCES "GameFile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseFile" ADD CONSTRAINT "ReleaseFile_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseFile" ADD CONSTRAINT "ReleaseFile_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseFile" ADD CONSTRAINT "ReleaseFile_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseBlock" ADD CONSTRAINT "ReleaseBlock_releaseId_fkey" FOREIGN KEY ("releaseId") REFERENCES "Release"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseBlock" ADD CONSTRAINT "ReleaseBlock_gameBlockId_fkey" FOREIGN KEY ("gameBlockId") REFERENCES "GameBlock"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseBlock" ADD CONSTRAINT "ReleaseBlock_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseBlock" ADD CONSTRAINT "ReleaseBlock_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseBlock" ADD CONSTRAINT "ReleaseBlock_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleasePart" ADD CONSTRAINT "ReleasePart_releaseId_fkey" FOREIGN KEY ("releaseId") REFERENCES "Release"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleasePart" ADD CONSTRAINT "ReleasePart_gamePartId_fkey" FOREIGN KEY ("gamePartId") REFERENCES "GamePart"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleasePart" ADD CONSTRAINT "ReleasePart_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleasePart" ADD CONSTRAINT "ReleasePart_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleasePart" ADD CONSTRAINT "ReleasePart_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InstructionGroup" ADD CONSTRAINT "InstructionGroup_instructionSetId_fkey" FOREIGN KEY ("instructionSetId") REFERENCES "InstructionSet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Instruction" ADD CONSTRAINT "Instruction_instructionGroupId_fkey" FOREIGN KEY ("instructionGroupId") REFERENCES "InstructionGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InstructionVariant" ADD CONSTRAINT "InstructionVariant_instructionId_fkey" FOREIGN KEY ("instructionId") REFERENCES "Instruction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InstructionVariant" ADD CONSTRAINT "InstructionVariant_addressingModeId_fkey" FOREIGN KEY ("addressingModeId") REFERENCES "AddressingMode"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ValidationRule" ADD CONSTRAINT "ValidationRule_instructionSetId_fkey" FOREIGN KEY ("instructionSetId") REFERENCES "InstructionSet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

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

-- AddForeignKey
ALTER TABLE "GameString" ADD CONSTRAINT "GameString_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameString" ADD CONSTRAINT "GameString_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameString" ADD CONSTRAINT "GameString_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameString" ADD CONSTRAINT "GameString_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameStringCommand" ADD CONSTRAINT "GameStringCommand_gameStringId_fkey" FOREIGN KEY ("gameStringId") REFERENCES "GameString"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseString" ADD CONSTRAINT "ReleaseString_releaseId_fkey" FOREIGN KEY ("releaseId") REFERENCES "Release"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseString" ADD CONSTRAINT "ReleaseString_gameStringId_fkey" FOREIGN KEY ("gameStringId") REFERENCES "GameString"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseString" ADD CONSTRAINT "ReleaseString_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseString" ADD CONSTRAINT "ReleaseString_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseString" ADD CONSTRAINT "ReleaseString_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseStringCommand" ADD CONSTRAINT "ReleaseStringCommand_releaseStringId_fkey" FOREIGN KEY ("releaseStringId") REFERENCES "ReleaseString"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseStringCommand" ADD CONSTRAINT "ReleaseStringCommand_gameStringCommandId_fkey" FOREIGN KEY ("gameStringCommandId") REFERENCES "GameStringCommand"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseStringCommand" ADD CONSTRAINT "ReleaseStringCommand_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseStringCommand" ADD CONSTRAINT "ReleaseStringCommand_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseStringCommand" ADD CONSTRAINT "ReleaseStringCommand_deletedById_fkey" FOREIGN KEY ("deletedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseStringLayer" ADD CONSTRAINT "ReleaseStringLayer_releaseStringId_fkey" FOREIGN KEY ("releaseStringId") REFERENCES "ReleaseString"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- =============================================================================
-- ROW LEVEL SECURITY (RLS) POLICIES
-- =============================================================================
-- Enable anonymous usage on the schema and anonymous select on all tables
-- Note: This enables public read-only access to game data and instruction sets.
-- Authentication tables (User, Account, Session, VerificationToken) are excluded
-- from anonymous access for security.
-- Only apply RLS and policies in production (Supabase) environments
DO $$
BEGIN
  -- Check if we're in a Supabase/production environment by looking for specific extensions
  IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'supabase_vault') OR
     EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'supabase_auth_admin') THEN
    
    GRANT USAGE ON SCHEMA public TO anon;

    -- Grant SELECT permissions on all tables to anonymous role
    GRANT SELECT ON TABLE public."Game" TO anon;
    GRANT SELECT ON TABLE public."GameFile" TO anon;
    GRANT SELECT ON TABLE public."GameBlock" TO anon;
    GRANT SELECT ON TABLE public."GamePart" TO anon;
    GRANT SELECT ON TABLE public."Release" TO anon;
    GRANT SELECT ON TABLE public."ReleaseFile" TO anon;
    GRANT SELECT ON TABLE public."ReleaseBlock" TO anon;
    GRANT SELECT ON TABLE public."ReleasePart" TO anon;
    GRANT SELECT ON TABLE public."InstructionSet" TO anon;
    GRANT SELECT ON TABLE public."InstructionGroup" TO anon;
    GRANT SELECT ON TABLE public."Instruction" TO anon;
    GRANT SELECT ON TABLE public."InstructionVariant" TO anon;
    GRANT SELECT ON TABLE public."AddressingMode" TO anon;
    GRANT SELECT ON TABLE public."ValidationRule" TO anon;
    GRANT SELECT ON TABLE public."GameMnemonic" TO anon;
    GRANT SELECT ON TABLE public."GameCop" TO anon;
    GRANT SELECT ON TABLE public."ReleaseOverride" TO anon;
    GRANT SELECT ON TABLE public."ReleaseRewrite" TO anon;
    GRANT SELECT ON TABLE public."ReleaseTransform" TO anon;
    GRANT SELECT ON TABLE public."ReleaseLabel" TO anon;
    GRANT SELECT ON TABLE public."GameString" TO anon;
    GRANT SELECT ON TABLE public."GameStringCommand" TO anon;
    GRANT SELECT ON TABLE public."ReleaseString" TO anon;
    GRANT SELECT ON TABLE public."ReleaseStringCommand" TO anon;
    GRANT SELECT ON TABLE public."ReleaseStringLayer" TO anon;

    -- Enable Row Level Security on all tables
    ALTER TABLE "Game" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "GameFile" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "GameBlock" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "GamePart" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "Release" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "ReleaseFile" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "ReleaseBlock" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "ReleasePart" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "Account" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "Session" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "User" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "VerificationToken" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "InstructionSet" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "InstructionGroup" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "Instruction" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "InstructionVariant" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "AddressingMode" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "ValidationRule" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "GameMnemonic" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "GameCop" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "ReleaseOverride" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "ReleaseRewrite" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "ReleaseTransform" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "ReleaseLabel" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "GameString" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "GameStringCommand" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "ReleaseString" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "ReleaseStringCommand" ENABLE ROW LEVEL SECURITY;
    ALTER TABLE "ReleaseStringLayer" ENABLE ROW LEVEL SECURITY;

    -- Create anonymous SELECT policies for all tables
    CREATE POLICY "Anonymous can read games" ON "Game" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read game files" ON "GameFile" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read game blocks" ON "GameBlock" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read game parts" ON "GamePart" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read releases" ON "Release" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read release files" ON "ReleaseFile" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read release blocks" ON "ReleaseBlock" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read release parts" ON "ReleasePart" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read instruction sets" ON "InstructionSet" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read instruction groups" ON "InstructionGroup" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read instructions" ON "Instruction" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read instruction variants" ON "InstructionVariant" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read addressing modes" ON "AddressingMode" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read validation rules" ON "ValidationRule" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read game mnemonics" ON "GameMnemonic" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read game cops" ON "GameCop" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read release overrides" ON "ReleaseOverride" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read release rewrites" ON "ReleaseRewrite" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read release transforms" ON "ReleaseTransform" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read release labels" ON "ReleaseLabel" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read game strings" ON "GameString" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read game string commands" ON "GameStringCommand" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read release strings" ON "ReleaseString" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read release string commands" ON "ReleaseStringCommand" FOR SELECT TO anon USING (true);
    CREATE POLICY "Anonymous can read release string layers" ON "ReleaseStringLayer" FOR SELECT TO anon USING (true);

    RAISE NOTICE 'Applied RLS policies and grants for production environment';
  ELSE
    RAISE NOTICE 'Skipped RLS setup - not in production environment';
  END IF;
END
$$;