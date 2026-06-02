/*
SELECT 
    id, 
    district, 
    locality,
    (SELECT SUM(families) FROM census) AS families,
    (SELECT SUM(households) FROM census) AS households,
    (SELECT SUM(population) FROM census) AS population,
    (SELECT SUM(male) FROM census) AS male,
    (SELECT SUM(female) FROM census) AS female
FROM census;
*/


/*
SELECT
    SUM(families) AS families,
    SUM(households) AS households,
    SUM(population) AS population,
    SUM(male) AS male,
    SUM(female) AS female
FROM census;
*/

CREATE VIEW total AS
SELECT
    SUM(families) AS families,
    SUM(households) AS households,
    SUM(population) AS population,
    SUM(male) AS male,
    SUM(female) AS female
FROM census;