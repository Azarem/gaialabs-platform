/*
  Warnings:

  - Made the column `romVersion` on table `Release` required. This step will fail if there are existing NULL values in that column.
  - Made the column `romRegion` on table `Release` required. This step will fail if there are existing NULL values in that column.

*/
-- CreateEnum
CREATE TYPE "ProcessorFlag" AS ENUM ('N', 'V', 'M', 'X', 'D', 'I', 'Z', 'C', 'B', 'E', '*');

-- CreateEnum
CREATE TYPE "AddressingModeType" AS ENUM ('Immediate', 'Absolute', 'AbsoluteLong', 'DirectPage', 'DirectPageIndirect', 'DirectPageIndirectLong', 'AbsoluteIndexedX', 'AbsoluteLongIndexedX', 'AbsoluteIndexedY', 'DirectPageIndexedX', 'DirectPageIndexedY', 'DirectPageIndexedIndirectX', 'DirectPageIndirectIndexedY', 'DirectPageIndirectLongIndexedY', 'StackRelative', 'StackRelativeIndirectIndexedY', 'Accumulator', 'Implied', 'Stack', 'StackInterrupt', 'PCRelative', 'PCRelativeLong', 'AbsoluteIndirect', 'AbsoluteIndirectLong', 'AbsoluteIndexedIndirect', 'BlockMove');

-- CreateEnum
CREATE TYPE "InstructionCategory" AS ENUM ('LoadStore', 'Arithmetic', 'Logical', 'Shift', 'ControlFlow', 'Branch', 'System', 'Interrupt', 'Flags', 'Stack', 'Transfer', 'BlockMove', 'Special');

-- CreateEnum
CREATE TYPE "OperandType" AS ENUM ('Absolute', 'AbsoluteLong', 'Direct', 'Immediate', 'None', 'Label', 'Byte', 'BankPair', 'InterruptVector');

-- AlterTable
ALTER TABLE "Release" ALTER COLUMN "romVersion" SET NOT NULL,
ALTER COLUMN "romRegion" SET NOT NULL,
ALTER COLUMN "romCrc" DROP NOT NULL;

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
