# Is there a relationship between school expenditures AND graduation rates? 
# Query to display the names of schools, their per-pupil expenditure, AND their graduation rate. 
# Sort the schools FROM greatest per-pupil expenditure to least. If two schools have the same per-pupil expenditure, sort by school name.
    --> You should assume a school spends the same amount per-pupil their district as a whole spends.


SELECT schools.name, expenditures.per_pupil_expenditure, graduation_rates.graduated 
FROM districts 
    JOIN schools on schools.district_id = districts.id 
    JOIN expenditures on expenditures.district_id = districts.id 
    JOIN graduation_rates on graduation_rates.school_id = schools.id 
ORDER BY expenditures.per_pupil_expenditure DESC, schools.name ASC;
