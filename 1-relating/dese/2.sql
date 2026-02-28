# Query to fINd the names of districts that are no longer operational.
    --> Districts that are no longer operational have “(non-op)” at the end of their name.

SELECT name 
FROM districts 
WHERE name like '%(non-op)';