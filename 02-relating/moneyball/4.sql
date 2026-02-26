--> You need to make a recommendation about which players the team should consider hiring. 
-- With the team’s dwindling budget, the general manager wants to know which players were 
-- paid the lowest salaries in 2001. 

-- Query to find the 50 players paid the least in 2001.

    -- Sort players by salary, lowest to highest.
    -- If two players have the same salary, sort alphabetically by first name and then by last name.
    -- If two players have the same first and last name, sort by player ID.
    -- Your query should return three columns, one for players’ first names, one for their last names, and one for their salaries.
    -- Your query should return three columns, one for players’ first names, one for their last names, and one for their salaries.

select players.first_name, players.last_name, salaries.salary
from players 
join salaries 
    on salaries.player_id = players.id
where salaries.year = '2001'
order by salaries.salary ASC, first_name ASC, last_name ASC, salaries.player_id ASC;