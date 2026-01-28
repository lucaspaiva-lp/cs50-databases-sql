## Module 1 — Querying

### [01 — Cyberchase](/01-querying/exercises/01-cyberchase.sql)

The main difficulty was interpreting “original season”.

I broke the sentence into smaller parts and focused on keywords to understand the real intent of the problem.

Once mapped to `season = 1`, the query became straightforward.

---

### [02 — Cyberchase](/01-querying/exercises/02-cyberchase.sql)

The difficulty here was understanding **what the output was supposed to represent**, not the SQL syntax itself.

I initially focused on how the table was structured instead of reading the question literally and mapping it directly to the required columns.

After aligning the query with the exact wording, the solution became clear.

---

### [03 — Cyberchase](/01-querying/exercises/03-cyberchase.sql)

My main issue was returning **more results than expected**.

I misunderstood how restrictive the conditions needed to be and ended up including extra rows that were logically valid but outside the problem’s scope.

Re-reading the problem carefully helped me realize that the query needed to be more specific.

---

### [04 — Cyberchase](/01-querying/exercises/04-cyberchase.sql)

The difficulty was interpreting the question precisely and avoiding assumptions.

I initially matched multiple valid rows, but the problem expected a **very specific subset**.

This reinforced the importance of reading English problem statements literally instead of inferring extra conditions.

---

### [05 — Cyberchase](/01-querying/exercises/05-cyberchase.sql)

This problem was more direct.

Once I correctly identified the column involved and the required condition, the query worked as expected.

The main challenge was confidence, not logic.

---

### [06 — Cyberchase](/01-querying/exercises/06-cyberchase.sql)

The challenge here was understanding **how aggregation affects results**.

I needed to focus on what was being counted and ensure the aggregation matched the question’s intent.

After aligning the aggregation with the correct column, the result matched the expected output.

---

### [07 — Cyberchase](/01-querying/exercises/07-cyberchase.sql)

This query required combining multiple pieces of information.

The difficulty was keeping track of how columns relate to each other and ensuring the output format matched what was requested.

Breaking the query into logical steps helped.

---

### [08 — Cyberchase](/01-querying/exercises/08-cyberchase.sql)

This exercise reinforced careful reading.

The problem was simpler than it initially looked, but I almost overcomplicated it by adding unnecessary logic.

Sticking strictly to the question avoided that.

---

### [09 — Cyberchase](/01-querying/exercises/09-cyberchase.sql)

My result was close but incorrect.

The issue was a **slight misinterpretation of the condition**, which caused an incorrect count.

This highlighted how small wording differences in English (“before”, “after”, “during”) can significantly change the result.

---

### [10 — Cyberchase](/01-querying/exercises/10-cyberchase.sql)

This query involved returning a larger dataset.

The main challenge was ensuring the correct columns and ordering, without filtering out required rows.

Once structured properly, it behaved as expected.

---

### [11 — Cyberchase](/01-querying/exercises/11-cyberchase.sql)

The difficulty here was understanding what “unique” referred to.

Initially, I thought in terms of table structure and indexes, but the problem was actually about **distinct values in a specific column**.

Recognizing that shift was key.

---

### [12 — Cyberchase](/01-querying/exercises/12-cyberchase.sql)

This was one of the most important learning points.

I initially applied `DISTINCT` to the wrong column because I was thinking structurally instead of semantically.

After realizing that “unique episode titles” refers strictly to the `title` column across the entire dataset, the correct query became obvious.

---

### [13 — Cyberchase](/01-querying/exercises/13-cyberchase.sql)

This task was open-ended.

The challenge was not technical, but deciding **what question to ask** without overengineering the solution.

I focused on writing a valid, simple query that demonstrated understanding rather than complexity.

---

### Final Result

All queries passed `check50`, confirming that the logic, interpretation, and SQL usage were correct.
