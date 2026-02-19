-- Write a query that |counts the number of episodes| released...
-- IN the last 6 years, |FROM 2018 to 2023|, INclusive.

SELECT count(*)
FROM episodes
WHERE air_date BETWEEN '2018-01-01' AND '2023-12-31';
