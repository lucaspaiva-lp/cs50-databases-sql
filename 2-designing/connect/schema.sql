CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT UNIQUE,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
);
CREATE TABLE schools (
    id INTEGER PRIMARY KEY,
    company_id INTEGER,
    name TEXT NOT NULL UNIQUE,
    type TEXT,
    location REAL NOT NULL UNIQUE,
    FOREIGN KEY (company_id) REFERENCES companies(id)
);
CREATE TABLE companies (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    type TEXT,
    location TEXT NOT NULL

);