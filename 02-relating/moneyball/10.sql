/*
The general manager has asked you for a report which details each player’s name, their salary for each year they’ve been playing, and their number of home runs 
for each year they’ve been playing. To be precise, the table should include:

    - All player’s first names
    - All player’s last names
    - All player’s salaries
    - All player’s home runs
    - The year in which the player was paid that salary and hit those home runs

*/

select players.first_name, players.last_name, salaries.year, salaries.salary, performances.HR
from players
join salaries
    on salaries.player_id = players.id
join performances
    on performances.player_id = players.id
    and performances.year = salaries.year
order by players.id ASC, salaries.year DESC, performances.HR DESC, salaries.salary DESC;