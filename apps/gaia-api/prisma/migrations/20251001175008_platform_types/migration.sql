-- AlterTable
ALTER TABLE "GameRomBranch" ADD COLUMN     "strings" JSONB,
ADD COLUMN     "structs" JSONB;

-- AlterTable
ALTER TABLE "PlatformBranch" ADD COLUMN     "types" JSONB;
