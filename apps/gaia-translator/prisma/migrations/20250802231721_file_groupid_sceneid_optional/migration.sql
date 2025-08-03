-- AlterTable
ALTER TABLE "File" ADD COLUMN     "groupId" TEXT,
ALTER COLUMN "sceneId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "SceneGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;
