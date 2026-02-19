---> Query to list the English titles of the 5 brightest prINts by Hiroshige, FROM most to least bright.
-- Compare them to this list on Wikipedia to see if your results math the prINt's aesthetics.

---> Keywords: english_titles, Artist = Hiroshige

SELECT english_title
FROM views
WHERE artist = "Hiroshige"
ORDER BY brightness DESC 
LIMIT 5;
