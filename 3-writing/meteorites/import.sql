-- 1. Configura o modo de importacao e cria/popula a tabela temporaria
.mode csv
.import meteorites.csv meteorites_temp

-- 2. Limpeza dos Dados: Conversao de campos vazios para NULL
UPDATE meteorites_temp SET mass = NULL WHERE mass = '';
UPDATE meteorites_temp SET year = NULL WHERE year = '';
UPDATE meteorites_temp SET lat = NULL WHERE lat = '';
UPDATE meteorites_temp SET long = NULL WHERE long = '';

-- 2.1 Limpeza dos Dados: Arredondamento para duas casas decimais
UPDATE meteorites_temp SET mass = ROUND(mass, 2) WHERE mass IS NOT NULL;
UPDATE meteorites_temp SET lat = ROUND(lat, 2) WHERE lat IS NOT NULL;
UPDATE meteorites_temp SET long = ROUND(long, 2) WHERE long IS NOT NULL;

-- 3. Criacao da tabela final com a estrutura exigida
CREATE TABLE meteorites (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    class TEXT,
    mass REAL,
    discovery TEXT,
    year NUMERIC,
    lat REAL,
    long REAL
);

-- 4. Transferencia, exclusao dos meteoritos 'Relict' e ordenacao
INSERT INTO meteorites (name, class, mass, discovery, year, lat, long)
SELECT name, class, mass, discovery, year, lat, long
FROM meteorites_temp
WHERE nametype != 'Relict'
ORDER BY year ASC, name ASC;

-- 5. Limpeza do ambiente apagando a tabela temporaria
DROP TABLE meteorites_temp;