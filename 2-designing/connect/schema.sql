CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT UNIQUE,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);
CREATE TABLE education (
    user_id INTEGER,
    school_id INTEGER,
    degree TEXT,
    start_date TEXT,
    end_date TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (school_id) REFERENCES schools(id)
);

CREATE TABLE schools (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    type TEXT,
    location TEXT NOT NULL,
    founded_year TEXT
);
CREATE TABLE companies (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    industry TEXT,
    location TEXT NOT NULL
);
CREATE TABLE employment (
    user_id INTEGER,
    company_id INTEGER,
    title TEXT,
    start_date TEXT,
    end_date TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (company_id) REFERENCES companies(id)
);
CREATE TABLE connections (
    user_id_1 INTEGER,
    user_id_2 INTEGER,
    PRIMARY KEY (user_id_1, user_id_2),
    FOREIGN KEY (user_id_1) REFERENCES users(id),
    FOREIGN KEY (user_id_2) REFERENCES users(id)
);

/* Add-ons

CREATE INDEX "education_user_idx" ON "education" ("user_id");
CREATE INDEX "education_school_idx" ON "education" ("school_id");
CREATE INDEX "employment_user_idx" ON "employment" ("user_id");
CREATE INDEX "employment_company_idx" ON "employment" ("company_id");
CREATE INDEX "connections_user1_idx" ON "connections" ("user_id_1");
CREATE INDEX "connections_user2_idx" ON "connections" ("user_id_2");

*/