-- FIVELIB

-------------------------------------------------------------------------------

-- 1. INSERTION QUERIES (Seeding & Data Ingestion)

-- Create a new user profile upon registration.
INSERT INTO "users" ("username", "email") 
VALUES ('lucaspaiva-lp', 'lucas@fivelib.dev');

-- Insert core programming languages/ecosystems.
INSERT INTO "languages" ("name", "slug") 
VALUES ('Python', 'python'), ('Docker', 'docker'), ('SQL', 'sql');

-- Insert global categorization tags.
INSERT INTO "tags" ("name", "slug") 
VALUES ('Backend', 'backend'), ('DevOps', 'devops'), ('Database', 'database');

-- Publish a new technical document (Linked to user 'lucaspaiva-lp' and language 'Python').
-- Assuming user_id = 1 and language_id = 1 from previous inserts.
INSERT INTO "documents" ("title", "slug", "markdown_payload", "version", "user_id", "language_id")
VALUES (
    'FastAPI Production Architecture', 
    'fastapi-production-architecture', 
    '# FastAPI Setup\nSecure your backend using production-ready standards...', 
    '1.0.0', 
    1, 
    1
);

-- Associate the newly created document with specific tags (Many-to-Many join).
-- Linking Document 1 to Tag 1 (Backend) and Tag 2 (DevOps).
INSERT INTO "document_tags" ("document_id", "tag_id") 
VALUES (1, 1), (1, 2);


-- 2. SELECTION QUERIES (Complex JOINs & Views)
-- Fetch a complete document with its author, language, and aggregated tags.
SELECT 
    d."id",
    d."title",
    d."version",
    d."markdown_payload",
    u."username" AS "author",
    l."name" AS "language",
    GROUP_CONCAT(t."name", ', ') AS "associated_tags",
    d."updated_at"
FROM "documents" d
INNER JOIN "users" u ON d."user_id" = u."id"
INNER JOIN "languages" l ON d."language_id" = l."id"
LEFT JOIN "document_tags" dt ON d."id" = dt."document_id"
LEFT JOIN "tags" t ON dt."tag_id" = t."id"
WHERE d."slug" = 'fastapi-production-architecture'
GROUP BY d."id";

-- Query the abstract View to build the "Top Contributors" application dashboard.
SELECT "username", "total_documents_published", "last_contribution_at"
FROM "active_contributors"
WHERE "total_documents_published" > 0
ORDER BY "total_documents_published" DESC
LIMIT 5;

-- 3. UPDATE QUERIES (Version Control & Modification)

-- Simulate document version bumping and payload updates from a PUT/PATCH route.
UPDATE "documents"
SET 
    "title" = 'FastAPI Production Architecture v1.1',
    "markdown_payload" = '# FastAPI Setup v1.1\nUpdated dependencies and Pydantic V2 schemas...',
    "version" = '1.1.0',
    "updated_at" = CURRENT_TIMESTAMP
WHERE "id" = 1;


-- 4. DELETE QUERIES (Data Cleanup & Testing Maintenance)

-- Safely isolate and wipe automated testing records or spam accounts.
DELETE FROM "documents" 
WHERE "slug" LIKE 'test-%' OR "title" = 'Spam Entry';

-- Clean up a specific test user profile.
DELETE FROM "users" 
WHERE "username" = 'testuser123';