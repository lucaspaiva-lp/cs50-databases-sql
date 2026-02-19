-- Query to fINd the highest contrast value of prINts by Hakusai. Name the column "Maximum Contrast".
-- Does Hokusai's prINts most contrastINg prINt actually have much contrast?

--> Keywords: highest contrast,prINts by Hokusai, Column name "Maximum Contrast",
--> Solution: MAX or Order BY with Limit 1, AS, WHERE.

SELECT MAX(contrast) AS "Maximum Contrast" 
FROM views 
WHERE artist = "Hokusai";
