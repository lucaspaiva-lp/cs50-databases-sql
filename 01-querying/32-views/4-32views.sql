-- Query, Count how many prints by Hiroshige have English titles that refer to the "Eastern Capital".
-- Hiroshige's prints were created in Japan's "Edo period", referencing the eastern capital city of Edo, now tokyo.

--> Keywords: Count, Hiroshige, English titles "Eastern Capital", Hiroshige's -> "Edo period" and "Edo -> Tokyo".

select count(*) from views where english_title like '%Eastern Capital%' and artist = 'Hiroshige';
