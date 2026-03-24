# CS50 – Introduction to Databases with SQL

This repository contains my personal solutions, notes, and experiments for
 **CS50's Introduction to Databases with SQL (HarvardX / edX)**.

The structure follows the  **official weekly progression of the course**, aligned
strictly with the problem sets as released by CS50.

---

## Course Roadmap (Official Order)

### Week 0 — Foundations

**Objective:** Build fluency in reading queries, basic filtering, and thinking in sets.

* [Cyberchase](/0-querying/cyberchase/)
* [36 Views](/0-querying/32-views/)
* [Players](/0-querying/players/)

---

### Week 1 — Querying & Aggregation

**Objective:** Apply filtering, grouping, joins, and real-world investigation logic.

* [Packages, Please](/1-relating/packages-please/)
* [DESE](/1-relating/dese/)
* [Moneyball](/1-relating/moneyball/)

---

### Week 2 — Relating Data

**Objective:** Work with multi-table relationships and real datasets.

* ATL
* Happy to Connect
* Union Square Donuts

---

### Week 3 — Data Integrity & Cleaning

**Objective:** Defensive querying and handling imperfect data.

* Don’t Panic!
* Meteorite Cleaning

---

### Week 4 — Investigation & Analysis

**Objective:** Complex joins, investigative reasoning, and storytelling with SQL.

* Census Taker
* The Private Eye
* Bed and Breakfast

---

### Week 5 — Advanced Query Composition

**Objective:** Views, abstractions, and reusable query logic.

* In a Snap
* your.harvard

---

### Week 6 — Sentimental SQL & Final Project

**Objective:** Apply SQL concepts via another language and complete a capstone.

* Don’t Panic! (Sentimental) — Python or Java
* From the Deep
* Happy to Connect (Sentimental)
* FP Final Project
* Final Project

---

## Repository Organization

Each week or conceptual block is organized into directories following the
progression above. SQL files contain only the queries required by each problem
set, following CS50’s constraints.

---

## Note on Databases (.db files)

The database files `.db` used in the exercises are **not included** in this
repository.

These databases are provided by **CS50 / HarvardX** as part of the official
course materials and are excluded here for  **ethical and academic integrity
reasons**.

All SQL queries in this repository were written and tested against the official
course databases within the authorized learning environment.

---


## Environment Setup & Usage (PC / Notebook)

This repository leverages **Docker** and **Expect** to automate `check50` and `submit50` authentication, eliminating the need to manually enter your GitHub Token every time the container starts.

### 1. Initial Configuration (One-time setup)

After cloning the repository, create the environment variables file:

**Bash**

```
touch .env
```

Edit the `.env` file with your credentials:

```
GITHUB_USER=user_name
GITHUB_TOKEN=ghp_your_token_here
```

### 2. Build the Image

Ensure Docker is running and execute the build command. This installs all CS50 dependencies and the automation scripts:

**Bash**

```
docker compose build --no-cache
```

### 3. Running the Environment

To enter the container and start working on the exercises:

**Bash**

```
docker compose run --rm cs50-sql
```

### 4. Using check50 / submit50

Once inside the container, use the commands normally. The internal script will detect the login prompt and automatically inject your credentials from the `.env` file:

**Example:**

```
check50 cs50/problems/2024/sql/connect
```

## License and Disclaimer

The solutions, queries, and technical results contained in this repository
represent **my own work and understanding** developed while completing the
course exercises.

However, the **course content, problem statements, datasets, and instructional
materials** are the intellectual property of **CS50 / Harvard University /
HarvardX (edX)** and are used here  **strictly for educational and non-commercial
purposes**, in accordance with the course’s academic integrity and usage
policies.

This repository is intended as a **personal study record and technical** **portfolio**, not as a redistribution of official course materials.
Solutions are published **after independent completion** of the exercises.
