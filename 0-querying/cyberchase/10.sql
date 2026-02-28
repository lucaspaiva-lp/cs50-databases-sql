-- Write a SQL query to |list the ids, titles, AND production codes| of all episodes. Order the results by |production code|, FROM |earliest to latest|.


SELECT id, title, production_code
FROM episodes
ORDER BY production_code ASC;
