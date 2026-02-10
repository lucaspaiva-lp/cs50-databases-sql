## Reflection on *Players Dataset*

This assignment focused on working with the *Players* dataset as a whole, rather than treating each query as an isolated task. The main challenge was not writing SQL itself, but **correctly interpreting the instructions** and translating them into precise logical conditions.

Several prompts required careful attention to wording, especially those involving ordering and conditions. Phrases like *“from most recent to oldest—then alphabetically”* initially caused confusion, particularly in understanding how to structure the `ORDER BY` clause correctly, as seen in  **6.sql** . Breaking these instructions into ordered logical steps made it clearer how to apply multiple sorting criteria in the correct priority.

Another important learning point was the use of  **explicit logical grouping** . In  **7.sql** , when combining `AND` and `OR`, I reinforced the importance of using parentheses to make the intended logic explicit, as in `(bats = 'R' AND throws = 'L') OR (bats = 'L' AND throws = 'R')`. Even when SQL operator precedence might produce the correct result, explicitly grouping conditions improves clarity, correctness, and readability.

I also expanded my understanding of SQL operators and constructs. In  **4.sql** , I learned and applied `NOT IN` as a clearer alternative for exclusion logic, even though `NOT LIKE` could also have been used. Similarly, in  **8.sql** , I recognized that while `BETWEEN` could technically solve the problem, using comparison operators was more appropriate given that the requirement defined only a lower bound (“on or after”), making `BETWEEN` unnecessary in that context. Identifying these distinctions helped me choose more precise and intentional solutions.

With more practice, I aimed to be **more assertive and efficient** in my problem-solving approach. Instead of overanalyzing every question in writing, I reserved detailed breakdowns for prompts that required more complex logic. For simpler queries, I focused on a careful visual reading, mentally identifying the key conditions and applying them directly.

Finally, I used the guidance provided in the HarvardX Wiki, such as expected row counts, to validate my results during development. After completing all queries, I ran `check50` to verify correctness before submitting with `submit50`, ensuring that each solution aligned with the assignment requirements.

Overall, this activity reinforced the importance of careful reading, logical precision, and choosing the most appropriate SQL constructs based on the intent of each question, rather than relying on mechanically interchangeable solutions.
