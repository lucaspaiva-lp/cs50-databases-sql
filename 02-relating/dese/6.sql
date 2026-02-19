# DESE wants to assess which schools achieved a 100% graduation rate. 
# Query to |fINd the names of schools| (|public *or charter!|) that reported a 100% graduation rate.

SELECT name 
FROM graduation_rates 
    JOIN schools on graduation_rates.school_id = schools.id 
WHERE graduated = 100 AND type IN ('Public School', 'Charter School');

