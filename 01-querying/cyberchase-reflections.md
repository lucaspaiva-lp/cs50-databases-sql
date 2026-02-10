
# Reflection on *Module Cyberchase*

This assignment focused on working with the *Cyberchase* dataset through a sequence of SQL querying tasks. Rather than treating each exercise as an isolated problem, the main objective was to understand how to interpret problem statements accurately and translate them into precise queries.

The primary challenge throughout the module was  **interpreting the instructions correctly** . Many difficulties were not related to SQL syntax, but to understanding what the question was truly asking. Terms such as “original season,” “unique,” and time-related conditions (“before”, “after”, “during”) required careful reading to avoid incorrect assumptions.

To improve accuracy, I started breaking each prompt into **keywords and smaller logical parts** before writing any SQL. In some cases, I initially focused too much on the table structure instead of mapping the wording of the question directly to the required columns. Re-reading the problem statements and aligning them literally with the expected output consistently led to correct solutions.

Another recurring challenge was  **scope control** . In multiple exercises, my first attempts returned more rows than expected because the conditions were logically valid but not restrictive enough for the problem’s intent. This reinforced the importance of being precise rather than permissive when defining filters.

Aggregation and distinct values also required special attention. Understanding  **what was being counted or deduplicated** , and in which column, was essential. Misapplying `AVG`, `COUNT`, or `DISTINCT` to the wrong column led to incorrect results, even when the query syntax was valid.

Overall, this module reinforced the importance of careful reading, structured reasoning, and translating natural language requirements into exact logical conditions. All queries passed `check50`, confirming that both interpretation and SQL logic were correctly applied.
