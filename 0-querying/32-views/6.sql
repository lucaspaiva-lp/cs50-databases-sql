---> Query to fINd the average entropy of prINts by Hiroshige, rounded to two decimal places.
---- Call the resultINg column "Hiroshige Average Entropy".

---> Keywords: Average, entropy of prINts by Hiroshige.
---> Solution: Artist = Hiroshige, Average -> entropy, AVG(entropy) AS "Hiroshige Average Entropy", ROUND(AVG(entropy), 2)

--Query:
SELECT ROUND(AVG(entropy), 2) AS "Hiroshige Average Entropy" 
FROM views 
WHERE artist = "Hiroshige";
