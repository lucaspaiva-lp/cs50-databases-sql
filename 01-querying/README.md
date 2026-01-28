# Module 01 — Querying

## Objective

Learn how to retrieve data using basic SQL queries, with emphasis on **reading problem statements carefully** and translating natural language requirements into precise SQL conditions.

## Concepts

- `SELECT`
- `WHERE`
- `AND` / `OR`
- `DISTINCT`
- `ORDER BY`
- `LIMIT`
- Aggregate functions (`COUNT`)

## Patterns

- Read the question **before** looking at the table
- Identify **which column the question is actually about**
- Apply filters based on **problem wording** , not assumptions
- Use `DISTINCT` only on the column whose values must be unique
- Validate queries by checking row counts and output shape

## Common Pitfalls

- Misinterpreting English terms like _original_ , _unique_ , _before_ , _after_
- Applying `DISTINCT` to the wrong column
- Reasoning about table structure instead of data semantics
- Returning valid but **extra rows** outside the problem scope
- Confusing row filtering (`WHERE`) with value uniqueness (`DISTINCT`)
- Using equivalent SQL constructs when the problem explicitly requires specific keywords (e.g. `AND` / `OR`)

## Structure

- `exercises/` — SQL solutions (`1.sql` to `13.sql`)
- `notes/` — reflections and learning notes

## Resources

- Problem set:

  [https://cs50.harvard.edu/sql/psets/0/cyberchase/](https://cs50.harvard.edu/sql/psets/0/cyberchase/)

> Database file (`cyberchase.db`) provided by CS50 and used exclusively
> within the course environment (`cs50.dev`).
