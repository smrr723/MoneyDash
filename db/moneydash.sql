DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
   id SERIAL8 PRIMARY KEY,
   name VARCHAR(255)
);

CREATE TABLE transactions (
   id SERIAL8 PRIMARY KEY,
   name VARCHAR(255),
   amount INT8,
   category_id INT8 REFERENCES categories(id) ON DELETE CASCADE
);
