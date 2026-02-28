---> query to fINd the hometown (INcludINg city, state, AND country) of Jackie RobINson.

SELECT birth_city, birth_state, birth_country 
FROM players 
WHERE first_name = 'Jackie' AND last_name = 'RobINson';