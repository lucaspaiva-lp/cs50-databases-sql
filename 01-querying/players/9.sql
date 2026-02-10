--> query to find the players who played their final game in the MLB in 2022. 
-- Sort the results alphabetically by first name, then by last name.

-- Observation: The prompt explicitly asks for "players" and only specifies the year. 
            -- Including first_name and last_name is for better readability, but strictly following the prompt, using (*) would also be acceptable.
SELECT first_name, last_name 
FROM players 
WHERE final_game like '%2022%' ORDER BY first_name ASC, last_name ASC;