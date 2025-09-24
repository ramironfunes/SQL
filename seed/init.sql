-- Demo schema for logistics data-quality checks

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

CREATE TABLE customers (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE orders (
  id INT PRIMARY KEY,
  customer_id INT,
  amount DECIMAL(10,2),
  created_at DATETIME,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Good data
INSERT INTO customers (id, name, email) VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com');

INSERT INTO orders (id, customer_id, amount, created_at) VALUES
(1, 1, 100.00, '2025-01-01 10:00:00'),
(2, 2, 200.00, '2025-01-02 11:00:00');

-- Bad data (to be detected by checks)
INSERT INTO orders (id, customer_id, amount, created_at) VALUES
(3, 999, 300.00, '2025-01-03 12:00:00'); -- orphan FK

