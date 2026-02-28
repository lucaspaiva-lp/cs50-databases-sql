# The Massachusetts Legislature would like to learn how much money, on average, districts spent per-pupil last year. 
# Query to fINd the |average per-pupil expenditure|. |Name the column “Average District Per-Pupil Expenditure”|.
    --> Note the per_pupil_expenditure column IN the expenditures table contaINs the average amount, per pupil, each district spent last year. 
    -- You’ve been asked to fINd the average of this set of averages, weightINg all districts equally regardless of their size.
SELECT AVG(per_pupil_expenditure) AS 'Average District Per-Pupil Expenditure' 
FROM expenditures; 