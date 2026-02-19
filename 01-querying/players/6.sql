--> query to return the first name, last name, AND debut date of players born IN Pittsburgh, Pennsylvania (PA). 
-- Sort the results first by debut date—FROM most recent to oldest—then |  alphabetically by first name, | followed by last name.

SELECT first_name, last_name, debut 
FROM players 
WHERE birth_city = 'Pittsburgh' AND birth_state = 'PA' 
ORDER BY debut DESC, first_name ASC, last_name ASC;