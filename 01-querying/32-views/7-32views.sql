---> Query to list the English titles of the 5 brightest prints by Hiroshige, from most to least bright.
-- Compare them to this list on Wikipedia to see if your results math the print's aesthetics.

---> Keywords: english_titles, Artist = Hiroshige

select english_title
from views
where artist = "Hiroshige"
order by brightness
DESC LIMIT 5;
