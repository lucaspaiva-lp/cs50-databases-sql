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

This repository provides two ways to run the CS50 SQL tools: using **Docker** (automated) or a  **Local Python Virtual Environment** .

### 1. Initial Configuration (One-time setup)

Regardless of the method, create your environment variables file to store your credentials:

```
touch .env
```

Edit the `.env` file:

```
GITHUB_USER=lucaspaiva-lp
GITHUB_TOKEN=ghp_your_token_here
```

---

### 2. Option A: Using Local Python (Venv)

Use this method if you want to run the tools directly on your Arch Linux host:

**Create and activate the virtual environment:**

```
python -m venv .venv
source .venv/bin/activate
```

**Install dependencies:**

```
pip install -r requirements.txt
```

---

### 3. Option B: Using Docker (Automated Auth)

This method leverages **Expect** to automatically inject your GitHub Token, bypassing manual login prompts.

**Build the Image:**

```
docker compose build --no-cache
```

**Run the Environment:**

```
docker compose run --rm cs50-sql
```

---

### 4. Running check50 / submit50

Once your environment is ready (either via `.venv` or inside the Docker container), run the commands normally:

**Example:**

```
check50 cs50/problems/2024/sql/connect
```

---

### SysAdmin Tip (Arch Linux Alias)

To quickly jump into the Docker environment from any terminal, add this alias to your `~/.bashrc` or `~/.zshrc`:

```
alias sql='docker compose run --rm cs50-sql'
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
