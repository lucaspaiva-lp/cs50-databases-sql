# Query to answer a question you have about the data! The query should:
    --> Involve at least one JOIN or subquery

SELECT districts.name AS 'Nome', expenditures.per_pupil_expenditure AS 'Custo por Aluno', staff_evaluations.exemplary AS 'Avalição dos Professores' 
FROM districts 
    JOIN staff_evaluations ON staff_evaluations.district_id = districts.id 
    JOIN expenditures on expenditures.district_id = districts.id 
WHERE districts.type = 'Public School District' 
    AND staff_evaluations.exemplary > (SELECT AVG(exemplary) FROM staff_evaluations) 
    AND expenditures.per_pupil_expenditure > (SELECT AVG(per_pupil_expenditure) FROM expenditures)
ORDER BY staff_evaluations.exemplary DESC, expenditures.per_pupil_expenditure DESC;