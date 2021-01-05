-- CreateTable
CREATE TABLE "Post" (
"id" SERIAL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "content" TEXT,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "authorId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Profile" (
"id" SERIAL,
    "bio" TEXT,
    "userId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
"id" SERIAL,
    "name" TEXT,
    "email" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Profile.userId_unique" ON "Profile"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "User.email_unique" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Post" ADD FOREIGN KEY("authorId")REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD FOREIGN KEY("userId")REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
