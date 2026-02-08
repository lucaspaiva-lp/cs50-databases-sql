---> Query to find the average entropy of prints by Hiroshige, rounded to two decimal places.
---- Call the resulting column "Hiroshige Average Entropy".

---> Keywords: Average, entropy of prints by Hiroshige.
---> Solution: Artist = Hiroshige, Average -> entropy, AVG(entropy) AS "Hiroshige Average Entropy", ROUND(AVG(entropy), 2)

--Query:
select ROUND(AVG(entropy), 2) AS "Hiroshige Average Entropy" from views where artist = "Hiroshige";
