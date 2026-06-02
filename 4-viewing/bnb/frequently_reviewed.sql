-- CELULA 4 - VISUALIZADOR
/*
SELECT listings.id, listings.property_type, listings.host_name, COUNT(*) AS reviews
FROM listings
JOIN reviews ON listings.id = reviews.listing_id
GROUP BY listings.id
ORDER BY reviews DESC, listings.property_type ASC, listings.host_name ASC
LIMIT 100;
*/

-- CELULA 4.1 - CRIADOR
CREATE VIEW frequently_reviewed AS
SELECT listings.id, listings.property_type, listings.host_name, COUNT(*) AS reviews
FROM listings
JOIN reviews 
    ON listings.id = reviews.listing_id
GROUP BY listings.id
ORDER BY reviews DESC, listings.property_type ASC, listings.host_name ASC
LIMIT 100;