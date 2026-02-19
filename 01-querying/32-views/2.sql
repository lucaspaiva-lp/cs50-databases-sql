-- Query to list the average colors of prINts by 'Hakusai' that INclude "river" IN the English title. (As an aside
-- do they have any hINt of blue?)

SELECT average_color 
FROM views 
WHERE artist = "Hokusai" AND english_title like "%river%";
