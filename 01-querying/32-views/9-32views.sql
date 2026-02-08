--- Query to find the English title and artist of the print with the highest brighness.
--> keyword: english_title, artist -> highest -> brighness

select english_title, artist from views where brightness = (select max(brightness) from views);
