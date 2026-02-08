-- Query to find the highest contrast value of prints by Hakusai. Name the column "Maximum Contrast".
-- Does Hokusai's prints most contrasting print actually have much contrast?

--> Keywords: highest contrast,prints by Hokusai, Column name "Maximum Contrast",
--> Solution: MAX or Order BY with Limit 1, AS, where.

select MAX(contrast) AS "Maximum Contrast" from views where artist = "Hokusai";
