# A parent asks you for advice on fINdINg the best public school districts IN Massachusetts. 
# Query to fINd public school districts with above-average per-pupil expenditures AND an above-average percentage of teachers rated “exemplary”. 
# Your query should return the districts’ names, along with their per-pupil expenditures AND percentage of teachers rated exemplary. 
# Sort the results first by the percentage of teachers rated exemplary (high to low), then by the per-pupil expenditure (high to low).


SELECT districts.name, expenditures.per_pupil_expenditure, staff_evaluations.exemplary 
FROM districts 
    JOIN staff_evaluations on staff_evaluations.district_id = districts.id 
    JOIN expenditures on expenditures.district_id = districts.id 
WHERE districts.type = 'Public School District' 
    AND staff_evaluations.exemplary > (SELECT AVG(exemplary) FROM staff_evaluations) 
    AND expenditures.per_pupil_expenditure > (SELECT AVG(per_pupil_expenditure) FROM expenditures)
ORDER BY staff_evaluations.exemplary DESC, expenditures.per_pupil_expenditure DESC;




--> Tables: districts, expenditures, staff_evaluations
---> Columns: districts.type, expenditures.per_pupil_expenditures, staff_evaluations.exemplary <= 100
---> Conditions