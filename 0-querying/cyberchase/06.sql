-- list the | titles | of episodes FROM | season 6 | (2008) that were
-- released | early, IN 2007 |.

SELECT title
FROM episodes
WHERE air_date like '2007%'
AND season = 6;
