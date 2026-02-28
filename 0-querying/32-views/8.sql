---> Query to list the English titles of the 5 prINts with the least contrast by Hokusai, FROM least to highest contrast.
-- Compare them to this list on Wikipedia to see if your results math the prINt's aesthetics.

--> Keywords: english_titles, 5 prINts with the least contrast, by Hokusai, FROM least to highest contrast.


SELECT english_title 
FROM views 
WHERE artist = "Hokusai" 
ORDER BY contrast ASC 
LIMIT 5;

