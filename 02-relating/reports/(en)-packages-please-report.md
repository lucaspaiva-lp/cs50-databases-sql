# Report — Packages, Please (CS50 SQL)

This report describes the main difficulties encountered during the resolution of the **Packages, Please** problem, as well as the key reasoning steps required to solve each part correctly. The analysis is organized according to the three sections of the activity.

---

## 1. The Lost Letter

### Main difficulties

The primary difficulty in this section was correctly interpreting what **“end up”** means in the context of the problem. It was necessary to clearly distinguish between:

- the origin address (`from_address_id`)
- the intended destination (`to_address_id`)
- the actual final location of the package

Another important challenge was recognizing that the problem text contains an **intentional inconsistency in the street name** (“Finnegan” vs “Finnigan”). This required relying strictly on the database records rather than the narrative description.

### How the problem was solved

- The correct address was identified directly from the `addresses` table.
- The package was located using the corresponding `to_address_id`.
- The `scans` table was analyzed to understand the sequence of events (`Pick` → `Drop`).
- The **latest scan**, with action `Drop`, confirmed that the package reached its destination.
- The address type was obtained from the related record in `addresses`.

### Key takeaways

- The final state of a package should **never be inferred solely from `to_address_id`**.
- The `scans` table is the only reliable source to determine where a package actually ended up.
- Narrative details may contain intentional errors; the database is the authoritative source.

---

## 2. The Devious Delivery

### Main difficulties

This section was the most challenging initially because it:

- Explicitly removes the origin address
- Uses semantic clues (“quack”, “bath times”) instead of direct data
- Requires careful reading to extract technical constraints

The most important realization was understanding that:

- “There’s no ‘From’ address” means the database field is **NULL**
- The package must be identified using **absence of data combined with contents**, not addresses

### How the problem was solved

- Filtering packages with `from_address_id IS NULL` correctly isolated the package.
- The `contents` field confirmed the semantic hint (“Duck debugger”).
- The `scans` table was used to track the package’s movement.
- The last `Drop` scan pointed to a different address than the intended destination.
- The final address type was correctly identified as **Police Station**.

### Key takeaways

- Missing data (`NULL`) is as meaningful as present data.
- A package does not always end where it was supposed to go.
- The solution requires clearly separating:
  - package identification
  - movement tracking
  - final location determination

---

## 3. The Forgotten Gift

### Main difficulties

The main challenge in this section was interpreting the question **“Who has the Forgotten Gift?”**.

It was necessary to understand that this does not refer to:

- who sent the package
- who was supposed to receive it

But instead refers to:

- **who currently has custody of the package**

Another critical point was realizing that:

- identifying the package is not sufficient
- the **action of the latest scan** determines possession

### How the problem was solved

- The origin and destination addresses were correctly identified.
- The package was located by matching `from_address_id` and `to_address_id`.
- The contents were obtained directly from `packages.contents`.
- The `scans` table showed that the latest action was `Pick`.
- Since no `Drop` followed, the package is currently **with the driver**.
- The driver’s identity was confirmed using the `drivers` table.

### Key takeaways

- “Who has” refers to **current possession**, not original intent.
- Correct interpretation of the `action` field (`Pick` vs `Drop`) is essential.
- The answer depends on the **most recent chronological scan**, not assumptions.

---

## Overall Conclusion

Throughout the _Packages, Please_ problem, the main difficulties were not related to SQL syntax, but to:

- interpreting contextual English correctly
- mapping narrative clues to database relationships
- understanding that **scans are the source of truth**
- avoiding assumptions based on intention rather than recorded events

By the end, the exercise successfully reinforced understanding of **table relationships**, **temporal event tracking**, and **precise schema interpretation**, fully achieving the goals of the _Relating_ phase of the course.
