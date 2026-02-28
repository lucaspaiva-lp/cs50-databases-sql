/*
Hits are great, but so are RBIs! In 12.sql, 
Query to find the players among the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.

    Your query should return a table with two columns, one for the players’ first names and one of their last names.
    You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.
    You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
    Order your results by player ID, least to greatest (or alphabetically by last name, as both are the same in this case!).
    Keep in mind the lessons you’ve learned in 10.sql and 11.sql!
*/

select players.first_name, players.last_name
from players
where id in (
    select players.id
    from players
    join performances
        on performances.player_id = players.id
    join salaries
        on salaries.player_id = players.id
    where
        salaries.year = '2001'
        and performances.year = '2001'
        and performances.H > 0
    order by salaries.salary * 1.0 / performances.H
    limit 10
) and id in (
    select players.id
    from players
    join performances
        on performances.player_id = players.id
    join salaries
        on salaries.player_id = players.id
    WHERE
        salaries.year = '2001'
        and performances.year = '2001'
        and performances.RBI > 0
    order by salaries.salary * 1.0 / performances.RBI
    limit 10
)
order by id;