/*
hat salaries are other teams paying? 
Query to find the 5 lowest paying teams (by average salary) in 2001.

    - Round the average salary column to two decimal places and call it “average salary”.
    - Sort the teams by average salary, least to greatest.
    - Your query should return a table with two columns, one for the teams’ names and one for their average salary.
*/

select teams.name ,round(avg(salaries.salary), 2) AS 'average salary' 
from salaries
join teams
    on salaries.team_id = teams.id
where salaries.year = '2001'
group by salaries.team_id
order by "average salary" ASC
limit 5;