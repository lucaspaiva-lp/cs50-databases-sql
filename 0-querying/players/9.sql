--> query to fINd the players who played their fINal game IN the MLB IN 2022. 
-- Sort the results alphabetically by first name, then by last name.

-- Observation: The prompt explicitly asks for "players" AND only specifies the year. 
            -- IncludINg first_name AND last_name is for better readability, but strictly followINg the prompt, usINg (*) would also be acceptable.
SELECT first_name, last_name 
FROM players 
WHERE fINal_game like '%2022%' ORDER BY first_name ASC, last_name ASC;