# In Massachusetts, school district expenditures are IN part determINed by local taxes on property (e.g., home) values. 
# Query to fINd the 10 public school districts with the highest per-pupil expenditures. 
# Your query should return the names of the districts AND the per-pupil expenditure for each.

SELECT expenditures.per_pupil_expenditure, districts.name 
FROM districts 
    JOIN expenditures on expenditures.district_id = districts.id 
WHERE districts.type = 'Public School District' 
ORDER BY expenditures.per_pupil_expenditure DESC 
LIMIT 10;
