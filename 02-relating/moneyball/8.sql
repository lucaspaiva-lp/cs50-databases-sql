/*
How much would the A’s need to pay to get the best home run hitter this past season? 
Write a SQL query to find the | 2001 |  salary | of the | player|  who | hit the most home runs in 2001 |.

    - Your query should return a table with one column, the salary of the player.

*/

select max(salaries.salary)
from players 
join performances 
    on performances.player_id = players.id
join salaries
    on salaries.player_id = players.id
where performances.HR = (select max(HR) from performances) and salaries.year = '2001';