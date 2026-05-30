.headers on
.mode box

SELECT '--- VALIDANDO LIMPEZA ---' AS status;

SELECT count(*) AS massas_vazias FROM meteorite_temp WHERE mass = '';
SELECT count(*) AS massas_null FROM meteorite_temp WHERE mass IS NULL;
SELECT count(*) AS relict_restantes FROM meteorite_temp WHERE nametype = 'Relict';

SELECT '--- AMOSTRA DE DADOS ---' AS status;
SELECT name, mass, lat, long FROM meteorite_temp WHERE lat IS NOT NULL LIMIT 5;