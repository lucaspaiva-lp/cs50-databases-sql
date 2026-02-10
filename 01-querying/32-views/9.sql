--- Query to find the English title and artist of the print with the highest brighness.
--> keyword: english_title, artist -> highest -> brighness

SELECT english_title, artist 
FROM views 
WHERE brightness = (select max(brightness) from views);
