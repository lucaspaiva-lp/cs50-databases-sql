--> Count how many prints by Hakusai Include "Fuji" in the English title.
---> Focused on Mt.Fuji.
---> How many did "Fuji" make it into the title?

-- [ Priorite: Count, Hakusai, name "Fuji", column "English_title"]


SELECT count(*) 
FROM views 
WHERE english_title like '%Fuji%' AND artist = 'Hokusai';
