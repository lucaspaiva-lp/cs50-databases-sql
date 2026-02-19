-- list the SEASON number of | AND TITLE of | the FIRST episode of every season.

SELECT season, title
FROM episodes
WHERE episode_IN_season = 1;
