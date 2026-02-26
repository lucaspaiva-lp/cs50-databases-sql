/* > It’s a bit of a slow day in the office. Though Satchel no longer plays, 
    Write a SQL query to find all teams that Satchel Paige played for.
        - Your query should return a table with a single column, one for the name of the teams.
*/

select teams.name
from performances
join players
    on performances.player_id = players.id
join teams
    on performances.team_id = teams.id
where players.first_name = 'Satchel' and players.last_name = 'Paige';