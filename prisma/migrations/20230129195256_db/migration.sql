/*
  Warnings:

  - You are about to alter the column `datesGoal` on the `Event` table. The data in that column could be lost. The data in that column will be cast from `Int` to `DateTime`.
  - You are about to alter the column `datesStart` on the `Event` table. The data in that column could be lost. The data in that column will be cast from `Int` to `DateTime`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Event" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "where" TEXT NOT NULL,
    "reward" INTEGER NOT NULL,
    "eventPhoto" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "peopleJoined" INTEGER NOT NULL,
    "peopleTarget" INTEGER NOT NULL,
    "datesStart" DATETIME NOT NULL,
    "datesGoal" DATETIME NOT NULL,
    "sponsorId" INTEGER NOT NULL,
    "requirements" TEXT NOT NULL,
    CONSTRAINT "Event_sponsorId_fkey" FOREIGN KEY ("sponsorId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Event" ("datesGoal", "datesStart", "description", "eventPhoto", "id", "peopleJoined", "peopleTarget", "requirements", "reward", "sponsorId", "title", "where") SELECT "datesGoal", "datesStart", "description", "eventPhoto", "id", "peopleJoined", "peopleTarget", "requirements", "reward", "sponsorId", "title", "where" FROM "Event";
DROP TABLE "Event";
ALTER TABLE "new_Event" RENAME TO "Event";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
