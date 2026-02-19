# Query to fINd the names AND cities of all public schools IN Massachusetts.

SELECT name, city 
FROM schools 
WHERE type = 'Public School' AND state = 'MA';

# other solution:
--> SELECT name, city FROM schools WHERE type = (SELECT distINct(type) FROM schools WHERE type = 'Public School') AND state = 'MA';