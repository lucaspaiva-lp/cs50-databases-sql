-- CELULA 3 - VISUALIZADOR
/*
SELECT listings.id, listings.property_type, listings.host_name, availabilities.date
FROM listings
JOIN availabilities ON listings.id = availabilities.listing_id
WHERE availabilities.available = 'TRUE';
*/
-- CELULA 3.1 - CRIADOR
CREATE VIEW available AS
SELECT listings.id, listings.property_type, listings.host_name, availabilities.date
FROM listings
JOIN availabilities 
    ON listings.id = availabilities.listing_id
WHERE availabilities.available = 'TRUE';