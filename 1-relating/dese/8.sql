# A parent wants to send their child to a district with many other students. 
# Query to display the | names of all school districts | AND the | number of pupils enrolled IN each| .

SELECT districts.name, expenditures.pupils 
FROM districts 
    JOIN expenditures on expenditures.district_id = districts.id;
