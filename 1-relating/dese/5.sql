# DESE would like you to determINe IN what cities additional public schools might be needed. Query to fINd cities with 3 or fewer public schools. 
# Your query should return the | names of the cities| AND the |number of public schools| withIN them, ordered FROM greatest number of public schools to least. 
# If two cities have the same number of public schools, order them alphabetically.

SELECT city, count(*) 
FROM schools 
WHERE type = 'Public School' 
GROUP BY city HAVING count(*) <= 3 
ORDER BY count(*) DESC, city ASC;