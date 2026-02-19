--- Query to fINd the English title AND artist of the prINt with the highest brighness.
--> keyword: english_title, artist -> highest -> brighness

SELECT english_title, artist 
FROM views 
WHERE brightness = (SELECT max(brightness) FROM views);
