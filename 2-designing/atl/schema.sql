CREATE TABLE passengers (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INTEGER
);

CREATE TABLE airlines (
    id INTEGER PRIMARY KEY,
    name TEXT,
    concourse TEXT
);

CREATE TABLE flights (
    id INTEGER PRIMARY KEY,
    airline_id INTEGER,
    number TEXT,
    departure_airport TEXT,
    destination_airport TEXT,
    departure_datetime TEXT,
    arrival_datetime TEXT,
    FOREIGN KEY (airline_id) REFERENCES airlines(id)
);

CREATE TABLE checkins (
    id INTEGER PRIMARY KEY,
    passenger_id INTEGER,
    flight_id INTEGER,
    checkin_time TEXT,
    FOREIGN KEY (passenger_id) REFERENCES passengers(id),
    FOREIGN KEY (flight_id) REFERENCES flights(id)
);


/*
    1. Revisa os nomes.
    2. Ver quais serão às foreing key e suas conexões.
    3. Ver os method que cada atributo irá ter.
    4. Ver a referencie de cada atributo ID para se encaixa
    adequadamente.
*/