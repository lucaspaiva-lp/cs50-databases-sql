## **Passengers**

| Coluna     | Tipo    | Método |
| ---------- | ------- | ------- |
| id         | INTEGER | PK      |
| first_name | TEXT    | -       |
| last_name  | TEXT    | -       |
| age        | INTEGER | -       |

---

## **Checkins**

| Coluna       | Tipo    | Método             |
| ------------ | ------- | ------------------- |
| id           | INTEGER | PK                  |
| passenger_id | INTEGER | FK → passengers.id |
| flight_id    | INTEGER | FK → flights.id    |
| checkin_time | TEXT    | -                   |

---

## **Airlines**

| Coluna    | Tipo    | Método |
| --------- | ------- | ------- |
| id        | INTEGER | PK      |
| name      | TEXT    | -       |
| concourse | TEXT    | -       |
| category  | TEXT    | -       |

---

## **Flights**

| Coluna              | Tipo    | Método           |
| ------------------- | ------- | ----------------- |
| id                  | INTEGER | PK                |
| airline_id          | INTEGER | FK → airlines.id |
| number              | TEXT    | -                 |
| departure_airport   | TEXT    | -                 |
| destination_airport | TEXT    | -                 |
| departure_datetime  | TEXT    | -                 |
| arrival_datetime    | TEXT    | -                 |
