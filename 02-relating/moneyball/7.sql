/*
> You need to make a recommendation about which player (or players) to avoid recruiting. 
Write a SQL query to find the name of the player who’s been paid the | highest salary |, of all time, in Major League Baseball.
    - Your query should return a table with two columns, one for the player’s first name and one for their last name.

Table: Players, Salaries
*/

select players.first_name, players.last_name
FROM salaries
join players
    on salaries.player_id = players.id
where salaries.salary = (select max(salary) from salaries);