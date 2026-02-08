---> Query to list the English titles of the 5 prints with the least contrast by Hokusai, from least to highest contrast.
-- Compare them to this list on Wikipedia to see if your results math the print's aesthetics.

--> Keywords: english_titles, 5 prints with the least contrast, by Hokusai, from least to highest contrast.


 select english_title from views where artist = "Hokusai" order by contrast asc limit 5;

