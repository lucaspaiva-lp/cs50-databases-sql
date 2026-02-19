--> query to return the first AND last names of all right-hANDed batters. Sort the results alphabetically by first name, then by last name.

SELECT first_name, last_name 
FROM players 
WHERE bats = 'R' 
ORDER BY first_name ASC, last_name ASC;