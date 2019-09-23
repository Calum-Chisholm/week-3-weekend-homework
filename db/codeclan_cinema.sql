DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS screanings;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  funds INT
);

CREATE TABLE films (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  price INT
);

CREATE TABLE screanings (
  id SERIAL8 PRIMARY KEY,
  film_id INT8 REFERENCES films(id) ON DELETE CASCADE,
  screaning_time DATE
);

CREATE TABLE tickets (
  id SERIAL8 PRIMARY KEY,
  screaning_id INT8 REFERENCES screanings(id) ON DELETE CASCADE,
  customer_id INT8 REFERENCES customers(id) ON DELETE CASCADE
);
