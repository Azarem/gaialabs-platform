-- AlterTable
ALTER TABLE "GameFile" ADD COLUMN     "compressed" BOOLEAN,
ADD COLUMN     "upper" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "ReleaseFile" ADD COLUMN     "compressed" BOOLEAN,
ADD COLUMN     "upper" BOOLEAN;
