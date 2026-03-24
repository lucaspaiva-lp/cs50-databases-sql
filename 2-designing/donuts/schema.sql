CREATE TABLE ingredients (
    id INTEGER PRIMARY KEY,
    name TEXT UNIQUE,
    price_per_unit REAL,
    unit TEXT
);

CREATE TABLE donuts (
    id INTEGER PRIMARY KEY,
    name TEXT UNIQUE,
    is_gluten_free BOOLEAN,
    price_per_donut REAL
);

CREATE TABLE donut_ingredients (
    donut_id INTEGER,
    ingredient_id INTEGER,
    PRIMARY KEY (donut_id, ingredient_id),
    FOREIGN KEY (donut_id) REFERENCES donuts(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);

CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    phone TEXT UNIQUE,
    email TEXT NULL
);

CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items (
    order_id INTEGER,
    donut_id INTEGER,
    quantity INTEGER,
    PRIMARY KEY (order_id, donut_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (donut_id) REFERENCES donuts(id)
);

CREATE INDEX "donut_ingredients_donut_idx" ON "donut_ingredients" ("donut_id");
CREATE INDEX "donut_ingredients_ingredient_idx" ON "donut_ingredients" ("ingredient_id");
CREATE INDEX "orders_customer_idx" ON "orders" ("customer_id");
CREATE INDEX "order_items_order_idx" ON "order_items" ("order_id");
CREATE INDEX "order_items_donut_idx" ON "order_items" ("donut_id");