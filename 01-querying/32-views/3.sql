--> Count how many prINts by Hakusai Include "Fuji" IN the English title.
---> Focused on Mt.Fuji.
---> How many did "Fuji" make it INto the title?

-- [ Priorite: Count, Hakusai, name "Fuji", column "English_title"]


SELECT count(*) 
FROM views 
WHERE english_title like '%Fuji%' AND artist = 'Hokusai';
