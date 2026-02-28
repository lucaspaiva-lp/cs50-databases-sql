# DESE is preparINg a report on schools IN the Cambridge school district. 
# Query to fINd the | names of schools | (public or charter!) IN the Cambridge school district. 
# Keep IN mINd that Cambridge, the city, contaINs a few school districts, but | DESE is INterested IN the district whose name is “Cambridge.|

SELECT schools.name 
FROM districts 
    JOIN schools on schools.district_id = districts.id 
WHERE districts.name = 'Cambridge' AND schools.type IN ('Public School', 'Charter School');
