# Some cities have more public schools than others. Query to |fINd the 10 cities with the most public schools|. Your query 
# should return the |names of the cities AND the number of public schools withIN them|, |ordered FROM greatest number of public schools to least|. 
# If two cities have the same number of public schools, order them alphabetically.

SELECT city, count(*) 
FROM schools 
WHERE type = 'Public School' 
GROUP BY city 
ORDER BY count(*) DESC, city ASC LIMIT 10; 