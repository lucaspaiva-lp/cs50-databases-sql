--> query to fINd the average height AND weight, rounded to two decimal places, of baseball players who debuted on or after January 1st, 2000. 
-- Return the columns with the name “Average Height” AND “Average Weight”, respectively.

-- Propost Solution: Use Between with second option.

SELECT ROUND(AVG(height), 2) AS 'Average Height', ROUND(AVG(weight), 2) AS 'Average Weight' 
FROM players 
WHERE debut >= '2000-01-01';