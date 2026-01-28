-- list the SEASON number of | and TITLE of | the FIRST episode of every season.

SELECT season, title
FROM episodes
WHERE episode_in_season = 1;
