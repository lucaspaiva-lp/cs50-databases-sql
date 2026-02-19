--> query to count the number of players who bat (or batted) right-hANDed AND throw (or threw) left-hANDed, or vice versa.

--> keywords: Count the number, batted right-hANDed, threw left-hANDed

SELECT count(*) 
FROM players 
WHERE (bats = 'R' AND throws = 'L') OR (bats = 'L' AND throws = 'R');