# DESIGN.md - FiveLib Database Architecture

## Video Overview

**Watch the project presentation:** [Click here](https://www.youtube.com/watch?v=55skn7c5Nfc)

## Design Decisions

### Purpose

The **FiveLib** platform was conceived as a centralized, high-performance repository designed to store, version, and catalog technical documentation for programming students and software developers. In the modern educational landscape, technical references are highly fragmented across disconnected blogs, non-standardized documentation sites, and volatile web sources. This fragmentation introduces friction into the learning process.

To solve this problem, FiveLib requires a robust relational database capable of linking core documentation assets (Markdown payloads) to authors, specific programming languages/ecosystems, and dynamic categorization tags. The primary goal of this database schema is to ensure data integrity, eliminate duplicate records, and provide exceptionally low read-latency for client applications (such as an asynchronous FastAPI backend). By modeling these entities relationally, the platform guarantees that students can query clean, cross-referenced documentation instantly.

### Scope

The initial scope of the FiveLib database is strictly focused on content management, discoverability, and authorship attribution.

* **In Scope:**
  * User profile identification for content attribution.
  * Programming language and ecosystem metadata normalization.
  * Hierarchical/Categorical tagging mechanisms (Many-to-Many mapping).
  * Storage of core technical articles with structural Markdown text payloads and strict semver (Semantic Versioning) tracking.
  * Performance optimizations via explicit B-Tree indexing and analytical views.
* **Out of Scope:**
  * *Authentication and Session Data:* To keep the core data layer clean, passwords, OAuth tokens, and user sessions are managed outside this system (e.g., via a decoupled identity provider or stateless JWT tokens).
  * *Full-Text Search (FTS) Engines:* While text lookups are optimized via standard indexes, advanced fuzzy search and BM25 ranking are delegated to specialized engines or SQLite's FTS5 extension during future deployment phases.
  * *Analytics/Read Logs:* Keeping track of exact view counts per article per second is omitted from this transactional schema to avoid write-heavy bottlenecks.

## Functional Requirements

The database system must reliably support the following core operational flows:

* **Content Ingestion:** Seamless creation of new user profiles, languages, tags, and complex documentation assets.
* **Aggregated Content Retrieval:** Executing highly optimized multi-table joins to serve full technical articles alongside their specific metadata (author, core language, and all associated tags) in a single transactional query.
* **Audit and Version Control:** Bumping semantic versions and recording exact modification timestamps whenever an entry is updated.
* **Automatic Cascading Maintenance:** Self-cleaning database states where the removal of structural tags or languages automatically sanitizes dependent relationship tables without leaving orphaned foreign keys.

## Entity Relationship Diagram

The architectural layout of the FiveLib relational model is defined below. The database utilizes a standard relational structure optimized to resolve many-to-many relationships through intermediate junction tables.

**Code snippet**

```
erDiagram
    USERS {
        int id PK
        text username UK
        text email UK
        numeric created_at
    }
    LANGUAGES {
        int id PK
        text name UK
        text slug UK
    }
    DOCUMENTS {
        int id PK
        text title
        text slug UK
        text markdown_payload
        text version
        int user_id FK
        int language_id FK
        numeric created_at
        numeric updated_at
    }
    TAGS {
        int id PK
        text name UK
        text slug UK
    }
    DOCUMENT_TAGS {
        int document_id PK, FK
        int tag_id PK, FK
    }

    USERS oN -- oM DOCUMENTS : "authors"
    LANGUAGES || -- oM DOCUMENTS : "classifies"
    DOCUMENTS || -- oM DOCUMENT_TAGS : "contains"
    TAGS || -- oM DOCUMENT_TAGS : "groups"
```

## Entities

### `users`

Represents the structural entity for individuals who contribute documentation to the platform.

* `id` (`INTEGER`, `PRIMARY KEY`, `AUTOINCREMENT`): Internal unique identifier. Chosen as an auto-incrementing integer to optimize join alignments and indexing overhead.
* `username` (`TEXT`, `NOT NULL`, `UNIQUE`): The public handle of the user. Enforced as unique to serve as predictable URL slugs for user profile routes.
* `email` (`TEXT`, `NOT NULL`, `UNIQUE`): Communication and identification layer. Strictly constrained to prevent account duplication.
* `created_at` (`NUMERIC`, `NOT NULL`, `DEFAULT CURRENT_TIMESTAMP`): Audit timestamp mapping account creation. SQLite lacks a native `DATETIME` storage class, so `NUMERIC` is utilized to store standard ISO 8601 strings or Unix epoch times reliably.

### `languages`

Represents the ecosystem or programming language to which a document natively belongs (e.g., `Python`, `Docker`, `SQL`).

* `id` (`INTEGER`, `PRIMARY KEY`, `AUTOINCREMENT`): Surrogated integer identifier.
* `name` (`TEXT`, `NOT NULL`, `UNIQUE`): The human-readable name of the technical ecosystem.
* `slug` (`TEXT`, `NOT NULL`, `UNIQUE`): An alphanumeric, lowercase web-safe representation of the language name used directly for routing (e.g., `/languages/python`).

### `documents`

The central table of the entire schema, housing the actual technical documentation payloads.

* `id` (`INTEGER`, `PRIMARY KEY`, `AUTOINCREMENT`): Surrogated integer identifier.
* `title` (`TEXT`, `NOT NULL`): The technical headline of the article.
* `slug` (`TEXT`, `NOT NULL`, `UNIQUE`): Web-safe unique identifier for direct URL resolution.
* `markdown_payload` (`TEXT`, `NOT NULL`): The comprehensive technical text body written in Markdown format. `TEXT` handles arbitrary length strings up to SQLite's allocation limits.
* `version` (`TEXT`, `NOT NULL`, `DEFAULT '1.0.0'`): Tracking string to capture document state progression using standard semantic versioning rules.
* `user_id` (`INTEGER`, `FOREIGN KEY`): Relational bridge pointing to `users(id)`.
* `language_id` (`INTEGER`, `FOREIGN KEY`): Relational bridge pointing to `languages(id)`.
* `created_at` / `updated_at` (`NUMERIC`, `NOT NULL`, `DEFAULT CURRENT_TIMESTAMP`): System audit logs for tracking creation and updates.

### `tags`

Granular taxonomy terms used to group documents across different programming languages (e.g., `Backend`, `DevOps`, `Asynchronous`).

* `id` (`INTEGER`, `PRIMARY KEY`, `AUTOINCREMENT`): Surrogated integer identifier.
* `name` (`TEXT`, `NOT NULL`, `UNIQUE`): The literal string representation of the tag.
* `slug` (`TEXT`, `NOT NULL`, `UNIQUE`): Alphanumeric web-safe routing handle.

### `document_tags`

The pure bridge junction table designed to resolve the Many-to-Many relationship between `documents` and `tags`.

* `document_id` (`INTEGER`, `FOREIGN KEY`): Part of the composite primary key pointing to `documents(id)`.
* `tag_id` (`INTEGER`, `FOREIGN KEY`): Part of the composite primary key pointing to `tags(id)`.
* *Primary Key:* Defined as a composite key `PRIMARY KEY("document_id", "tag_id")` to prevent identical tags from being attached to the same document multiple times.

## Relationships

The system explicitly enforces database-level referential integrity constraints to maintain consistency:

* **User to Documents (One-to-Many):** A user can author multiple technical documents, but each document maps back to a single author. The foreign key constraint is explicitly configured with `ON DELETE SET NULL`. If an author decides to delete their platform profile, their structural technical contributions remain preserved in the system for the student community, gracefully falling back to an anonymous author state (`NULL`).
* **Language to Documents (One-to-Many):** A language contains multiple documents, but a document belongs strictly to one primary language/ecosystem. This relationship enforces `ON DELETE CASCADE`. If an entire technical ecosystem classification is purged from the catalog, all associated document variations are automatically deleted to prevent orphaned articles.
* **Documents to Tags (Many-to-Many):** A document can carry multiple descriptive tags, and a tag can be applied across multiple documents regardless of their parent language. This is decoupled through `document_tags`. Both foreign keys inside this junction table implement `ON DELETE CASCADE`. If a specific tag or document is wiped from the database, the corresponding junction mappings vanish instantly, preventing the system from scanning invalid relational pointers.

## Optimizations

Because FiveLib's production traffic is heavily skewed towards read operations (thousands of students browsing articles compared to a few writers publishing them), the database schema incorporates strict performance tuning optimizations:

* **B-Tree Indexing on Search Surfaces:** An explicit index named `idx_documents_title_search` is created over `documents(title)`. Since search bars execute frequent `WHERE` or order queries filtering by name, this index shifts execution times from a slow **O**(**N**) sequential table scan to an optimized **O**(**lo**g**N**) binary lookup.
* **Foreign Key Performance Overrides:** Databases inherently struggle with join lookups if the target columns aren't indexed. While SQLite implicitly creates indexes for unique constraints, standard foreign keys do not get this treatment automatically. Hence, `idx_documents_language` and `idx_document_tags_tag` were added to remove systemic latency when the backend queries reverse relationships (e.g., "Find all documents tagged as 'DevOps'").
* **View Abstraction for Metric Computation:** The `active_contributors` view wraps heavy aggregation logic (`COUNT`, `MAX`, `LEFT JOIN`, `GROUP BY`) into a clean database entity. This decouples database analytical calculations from application-level execution code, allowing backend routes to query real-time author leaderboards instantly.

## Limitations

While highly optimized for transactional consistency, the FiveLib database architecture has specific constraints:

* **SQLite Concurrency Model:** Because this system is modeled natively for SQLite, it inherits a single-writer locking architecture. During simultaneous write bursts (e.g., an automated batch migration of documents), write operations are serialized, which could lead to brief table locks. This is mitigated by shifting heavy write loads outside peak hours.
* **Denormalized Tag Extraction:** To pull down an article with all its tags in a single database round-trip, the application relies on SQL strings paired with string manipulation functions like `GROUP_CONCAT`. While highly performant for fetching data blocks, filtering documents by multiple complex intersections of tags requires advanced multi-layered subqueries.
* **Static Timestamp Management:** The `updated_at` timestamps rely on manual programmatic triggers or `CURRENT_TIMESTAMP` updates passed explicitly via `UPDATE` execution blocks, as native database level row-update triggers are omitted to maintain cross-platform SQL simplicity.
