--> query to fINd the \ first AND last names \ of players who were \ not born IN the United States \. 
-- Sort the \ results alphabetically by first name \, then by last name.

SELECT first_name, last_name 
FROM players 
WHERE birth_country NOT IN ('USA') 
ORDER BY first_name ASC, last_name ASC;