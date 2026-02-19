-- List the | titles | of episodes FROM | season 5 |, IN | reverse alphabetical order|.

SELECT title
FROM episodes
WHERE season = 5
ORDER BY title DESC;
