--E-COMMERCE CASE STUDY – SAMPLE DATA

----------------------------------------DAY 13--------------------------------------------
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE products(
			product_id INT PRIMARY KEY,
			product_name VARCHAR(50),
			category VARCHAR(50),
			price INT
);

CREATE TABLE orders(
			order_id INT PRIMARY KEY,
			customer_id VARCHAR(50),
			order_date INT
);

CREATE TABLE order_items(
			order_items_id INT PRIMARY KEY,
			order_id INT,
			product_id INT,
			quantity INT
			
);

INSERT INTO customers VALUES
(1, 'Rahul', 'Delhi'),
(2, 'Aman', 'Mumbai'),
(3, 'Priya', 'Delhi'),
(4, 'Neha', 'Pune'),
(5, 'Arjun', 'Bangalore');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 50000),
(102, 'Mobile', 'Electronics', 20000),
(103, 'Headphones', 'Accessories', 2000),
(104, 'Keyboard', 'Accessories', 1500),
(105, 'Monitor', 'Electronics', 12000);

INSERT INTO orders VALUES
(1001, 1, '2024-01-10'),
(1002, 2, '2024-01-15'),
(1003, 1, '2024-02-05'),
(1004, 3, '2024-02-10'),
(1005, 4, '2024-03-01');
ALTER TABLE orders
ALTER COLUMN order_date TYPE VARCHAR(50);


INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 105, 1),
(5, 1003, 104, 1),
(6, 1004, 102, 2),
(7, 1005, 103, 3);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;


🔹 Level 1
--Q1. Show all customers.
SELECT * FROM customers;

--Q2. Show all products with their price.
SELECT *,products.product_id price FROM products;

--Q3. Show all orders placed in January 2024
SELECT * FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-01-31';

--Q4. Count total number of customers
SELECT COUNT(*) AS total_customers
FROM customers;

--Q5. Count total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;

--Q6. Show customer name and their order id
SELECT c.customer_name, o.order_id
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Q7. Show product name and quantity sold
SELECT p.product_name, oi.quantity
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id;

--Q8. Find total revenue generated
SELECT SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;

-- Q9. Find customer-wise total spending
SELECT c.customer_name,
       SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_name;

-- Q10. Find the top customer based on total spending
SELECT c.customer_name,
       SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

