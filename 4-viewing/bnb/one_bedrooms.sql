-- CELULA 2 - VISUALIZADOR
/*
SELECT id, property_type, host_name, accommodates
FROM listings
WHERE bedrooms = 1;
*/

-- CELULA 2.1 - CRIADOR
CREATE VIEW one_bedrooms AS
SELECT id, property_type, host_name, accommodates
FROM listings
WHERE bedrooms = 1;