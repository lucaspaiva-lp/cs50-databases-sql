-- Query, Count how many prINts by Hiroshige have English titles that refer to the "Eastern Capital".
-- Hiroshige's prINts were created IN Japan's "Edo period", referencINg the eastern capital city of Edo, now tokyo.

--> Keywords: Count, Hiroshige, English titles "Eastern Capital", Hiroshige's -> "Edo period" AND "Edo -> Tokyo".

SELECT count(*) 
FROM views 
WHERE english_title like '%Eastern Capital%' AND artist = 'Hiroshige';
