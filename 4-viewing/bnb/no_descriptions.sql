-- CELULA 1 - VISUALIZADOR
/*
SELECT id, property_type, host_name, accommodates, bedrooms
FROM listings
LIMIT 10;
*/

-- CELULA 1.1 - CRIADOR
CREATE VIEW no_descriptions AS
SELECT id, property_type, host_name, accommodates, bedrooms
FROM listings;

