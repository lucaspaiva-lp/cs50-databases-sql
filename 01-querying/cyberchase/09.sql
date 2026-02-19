-- Write a query that | counts | the number of episodes
-- released IN Cyberchase's first 6 years, FROM | 2002 to 2007 |, INclusive.

SELECT count(*)
FROM episodes
WHERE air_date BETWEEN '2002-01-21' AND '2007-12-12';
