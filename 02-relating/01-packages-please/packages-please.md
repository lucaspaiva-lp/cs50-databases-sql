# [Packages, Please](https://cs50.harvard.edu/sql/psets/1/packages/#packages-please)

### BASE

**ADDRESSES**

```
+----+---------------------+-------------+
| id |       address       |    type     |
+----+---------------------+-------------+
```

**PACKAGES**

```
+----+--------------+-----------------+---------------+
| id |   contents   | from_address_id | to_address_id |
+----+--------------+-----------------+---------------+
```

**SCANS**

```
+----+-----------+------------+------------+--------+----------------------------+
| id | driver_id | package_id | address_id | action |         timestamp          |
+----+-----------+------------+------------+--------+----------------------------+
```

**DRIVERS**

```
+----+----------+
| id |   name   |
+----+----------+
```

### [The Lost Letter](https://cs50.harvard.edu/sql/psets/1/packages/#the-lost-letter)

Clerk, my name’s **Anneke**. I live over at **900 Somerville Avenue**. Not long
ago, I sent out a special letter. It’s meant for my friend **Varsha**. She’s
starting a new chapter of her life at **2 Finnegan Street**, uptown. (That
address, let me tell you: it was a bit tricky to get right the first
time.) The letter is a **congratulatory note**—a cheery little paper hug
from me to her, to celebrate this big move of hers. **Can you check if
it’s made its way to her yet?**

At what type of address did the Lost Letter end up?: Residential
At what address did the Lost Letter end up?: 2 Finnigan Street

Address
`select * from addresses where id = 854;`

```
+-----+-------------------+-------------+
| id  |      address      |    type     |
+-----+-------------------+-------------+
| 854 | 2 Finnigan Street | Residential |
+-----+-------------------+-------------+
```

_ID 854 - 2 Finnigan Street - Residential
(Yes, she is mistake about address. Finnegan -> Finnigan)_

**Packages**

`select * from packages where to_address_id = 854;`

```
+-----+-----------------------+-----------------+---------------+
| id  |       contents        | from_address_id | to_address_id |
+-----+-----------------------+-----------------+---------------+
| 384 | Congratulatory letter | 432             | 854
```

**Scans**
`select * from scans where package_id = 384;`

```
+----+-----------+------------+------------+--------+----------------------------+
| id | driver_id | package_id | address_id | action |         timestamp          |
+----+-----------+------------+------------+--------+----------------------------+
| 54 | 1         | 384        | 432        | Pick   | 2023-07-11 19:33:55.241794 |
| 94 | 1         | 384        | 854        | Drop   | 2023-07-11 23:07:04.432178 |
```

**Drivers**
`select \* from drivers where id = 1;`

```
| id | name |
+----+---------+
| 1 | Matthew |
+----+---------+
```

### [The Devious Delivery](https://cs50.harvard.edu/sql/psets/1/packages/#the-devious-delivery)

Good day to you, deliverer of the mail. You might remember that not too
long ago I made my way over from **the town of Fiftyville**. I gave a
certain box into your reliable hands and asked you to keep things low.
My **associate** has been expecting the package for a while now. And yet, it
appears to have grown wings and flown away. Ha! Any chance you could
help clarify this mystery? Afraid there’s **no “From” address**. It’s the
kind of parcel ~~that would add a bit more~~… ~~quack to someone’s bath times,
if you catch my drift~~.

At what type of address did the Devious Delivery end up?: Police Station
What were the contents of the Devious Delivery?: Duck debugger

**Address (3)**
`select * from addresses where id = 50; `

```
+----+-------------------+-------------+
| id | address | type |
+----+-------------------+-------------+
| 50 | 123 Sesame Street | Residential |
+----+-------------------+-------------+
```

**Package (1)**

`select * from packages where from_address_id is null;`

```
+------+---------------+-----------------+---------------+
| id | contents | from_address_id | to_address_id |
+------+---------------+-----------------+---------------+
| 5098 | Duck debugger | NULL | 50 |
+------+---------------+-----------------+---------------+
```

`select * from addresses where id = 348;`

```
+-----+------------------+----------------+
| id  |     address      |      type      |
+-----+------------------+----------------+
| 348 | 7 Humboldt Place | Police Station |
+-----+------------------+----------------+

```

**SCANS (2)**

`select * from scans where package_id = 5098;`

```
+-------+-----------+------------+------------+--------+----------------------------+
|  id   | driver_id | package_id | address_id | action |         timestamp          |
+-------+-----------+------------+------------+--------+----------------------------+
| 30123 | 10        | 5098       | 50         | Pick   | 2023-10-24 08:40:16.246648 |
| 30140 | 10        | 5098       | 348        | Drop   | 2023-10-24 10:08:55.610754 |
+-------+-----------+------------+------------+--------+----------------------------+
```

**DRIVERS (4)**

`select * from drivers where id = 10;`

```
+----+-----------+
| id | name |
+----+-----------+
| 10 | Josephine |
+----+-----------+
```

### [The Forgotten Gift](https://cs50.harvard.edu/sql/psets/1/packages/#the-forgotten-gift)

Oh, excuse me, Clerk. I had sent a mystery gift, you see, to my
wonderful granddaughter, off at **728 Maple Place**. That was about two
weeks ago. Now the delivery date has passed by seven whole days and I
hear she still waits, her hands empty and heart filled with
anticipation. I’m a bit worried wondering where my package has gone. I
cannot for the life of me remember what’s inside, but I do know it’s
filled to the brim with my love for her. Can we possibly track it down
so it can fill her day with joy? I did send it **from my home at 109
Tileston Street.**

What are the contents of the Forgotten Gift?: Flowers
Who has the Forgotten Gift?: Mikel

**Address**

`select * from addresses where address like '%728 M%';`

```
+------+-----------------+-------------+
| id | address | type |
+------+-----------------+-------------+
| 4983 | 728 Maple Place | Residential |
```

+------+-----------------+-------------+

`select * from addresses where address like '%109 T%';`

```
+------+---------------------+-------------+
| id | address | type |
+------+---------------------+-------------+
| 9873 | 109 Tileston Street | Residential |
+------+---------------------+-------------+

```

**Packages**

`select * from packages where from_address_id = 9873 and to_address_id = 4983;`

```
+------+----------+-----------------+---------------+
| id | contents | from_address_id | to_address_id |
+------+----------+-----------------+---------------+
| 9523 | Flowers | 9873 | 4983 |
+------+----------+-----------------+---------------+

```

**Scans**
`select * from scans where package_id = 9523 and address_id = 9873;`

```
`+-------+-----------+------------+------------+--------+----------------------------+
| id | driver_id | package_id | address_id | action | timestamp |
+-------+-----------+------------+------------+--------+----------------------------+
| 10432 | 11 | 9523 | 9873 | Pick | 2023-08-16 21:41:43.219831 |
+-------+-----------+------------+------------+--------+----------------------------+`

```

**Drivers**
`select * from drivers where id = 11;`

```
+----+--------+
| id | name |
+----+--------+
| 11 | Maegan |
+----+--------+
```

`select * from drivers where id = 17;`

```
+----+-------+
| id | name |
+----+-------+
| 17 | Mikel |
+----+-------+
```

Results for cs50/problems/2024/sql/packages generated by check50 v4.0.0.dev0
:) log.sql and answers.txt exist
:) log file contains SELECT queries
:) answers.txt formatted correctly
:) Lost Letter solved
:) Devious Delivery solved
:) Forgotten Gift solved
