-- Query to list the average colors of prints by 'Hakusai' that include "river" in the English title. (As an aside
-- do they have any hint of blue?)

SELECT average_color 
FROM views 
WHERE artist = "Hokusai" AND english_title like "%river%";
