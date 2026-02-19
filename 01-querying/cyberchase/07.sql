-- Write a SQL query to list the |titles| AND |topics| of all episodes
-- tearchINg fractions.

SELECT title, topic
FROM episodes
WHERE topic LIKE '%fractions%';
