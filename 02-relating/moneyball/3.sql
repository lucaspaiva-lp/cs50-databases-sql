--> Your team is going to need a great home run hitter. Ken Griffey Jr., 
-- a long-time Silver Slugger and Gold Glove award winner, might be a good prospect. 

-- Query to find Ken Griffey Jr.’s home run history.

    -- Sort by year in descending order.
    -- Note that there may be two players with the name “Ken Griffey.” This Ken Griffey was born in 1969.
    -- Your query should return a table with two columns, one for year and one for home runs.


--> TODO:Entende a informação referente ao 'home runs'; e ver a viabilidade de existe outra tabela.

select year 
from players 
where first_name like '%Ken%' 
    and last_name like 'Griffey%' 
    and birth_year = '1969'
ORDER BY year DESC;

