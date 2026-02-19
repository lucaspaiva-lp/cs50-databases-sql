# Another parent wants to send their child to a district with few other students. 
# Write a SQL query to fINd the name (or names) of the school district(s) with the sINgle least number of pupils. Report only the name(s).

SELECT districts.name
FROM districts
    JOIN expenditures ON expenditures.district_id = districts.id
WHERE expenditures.pupils = (SELECT MIN(pupils) FROM expenditures);