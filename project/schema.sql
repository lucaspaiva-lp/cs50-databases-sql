-- FIVELIB DATABASE SCHEMA

-- Drop existing elements to ensure clean migrations during development
DROP VIEW IF EXISTS "active_contributors";
DROP INDEX IF EXISTS "idx_documents_title_search";
DROP INDEX IF EXISTS "idx_documents_language";
DROP INDEX IF EXISTS "idx_document_tags_tag";
DROP TABLE IF EXISTS "document_tags";
DROP TABLE IF EXISTS "tags";
DROP TABLE IF EXISTS "documents";
DROP TABLE IF EXISTS "languages";
DROP TABLE IF EXISTS "users";

-- TABLES

-- Stores platform users and creators of documentation
CREATE TABLE "users" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "username" TEXT NOT NULL UNIQUE,
    "email" TEXT NOT NULL UNIQUE,
    "created_at" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Stores programming languages or specific infrastructure ecosystems (e.g., Python, SQL, Docker)
CREATE TABLE "languages" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL UNIQUE,
    "slug" TEXT NOT NULL UNIQUE
);

-- Stores the technical documentation entries
CREATE TABLE "documents" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "slug" TEXT NOT NULL UNIQUE,
    "markdown_payload" TEXT NOT NULL,
    "version" TEXT NOT NULL DEFAULT '1.0.0',
    "user_id" INTEGER,
    "language_id" INTEGER,
    "created_at" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE SET NULL,
    FOREIGN KEY("language_id") REFERENCES "languages"("id") ON DELETE CASCADE
);

-- Stores categorization tags for finer filtering options
CREATE TABLE "tags" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL UNIQUE,
    "slug" TEXT NOT NULL UNIQUE
);

-- Join table implementing Many-to-Many relationship between Documents and Tags
CREATE TABLE "document_tags" (
    "document_id" INTEGER,
    "tag_id" INTEGER,
    PRIMARY KEY("document_id", "tag_id"),
    FOREIGN KEY("document_id") REFERENCES "documents"("id") ON DELETE CASCADE,
    FOREIGN KEY("tag_id") REFERENCES "tags"("id") ON DELETE CASCADE
);


-- INDEXES (Infrastructure & Performance Tuning)

-- Optimizes text searches on titles (frequent operation in search bars)
CREATE INDEX "idx_documents_title_search" ON "documents"("title");

-- Optimizes filtering documentation by specific programming languages/ecosystems
CREATE INDEX "idx_documents_language" ON "documents"("language_id");

-- Optimizes Many-to-Many lookups when querying documents attached to a specific tag
CREATE INDEX "idx_document_tags_tag" ON "document_tags"("tag_id");

-- VIEWS

-- Abstract view designed for dashboard metrics, tracking the most active authors
CREATE VIEW "active_contributors" AS
SELECT 
    u."id" AS "user_id",
    u."username",
    COUNT(d."id") AS "total_documents_published",
    MAX(d."updated_at") AS "last_contribution_at"
FROM "users" u
LEFT JOIN "documents" d ON u."id" = d."user_id"
GROUP BY u."id";