--> Count how many prints by Hakusai Include "Fuji" in the English title.
---> Focused on Mt.Fuji.
---> How many did "Fuji" make it into the title?

-- [ Priorite: Count, Hakusai, name "Fuji", column "English_title"]


select count(*) from views where english_title like '%Fuji%' and artist = 'Hokusai';
