--> query to answer a question of your choice. This query should:
--    Make use of AS to rename a column
--    Involve at least condition, usINg WHERE
--    Sort by at least one column usINg ORDER BY

SELECT first_name AS 'Nome', last_name AS 'Sobrenome' 
FROM players 
WHERE birth_country = 'USA' 
ORDER BY first_name ASC;