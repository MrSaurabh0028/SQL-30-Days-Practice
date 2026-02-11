----------------------------------DAY 16-----------------------------------
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


--E-COMMERCE SQL – VERY SIMPLE (SET-2)
--Q1. Show customer names and their cities.
SELECT customer_name, city
FROM customers;

--Q2. Show all products from category ‘Electronics’.
SELECT *
FROM products
WHERE category = 'Electronics';

--Q3. Show orders placed after 1st Feb 2024.
SELECT *
FROM orders
WHERE order_date > '2024-02-01';

--Q4. Count how many orders each customer placed.
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;

--Q5. Show product name and price, sorted by price (low to high).
SELECT product_name, price
FROM products
ORDER BY price ASC;

--Q6. Show total quantity sold for each product.
SELECT product_id, SUM(quantity) AS total_quantity
FROM order_items
GROUP BY product_id;

--Q7. Show all customers who live in Mumbai or Delhi.
SELECT *
FROM customers
WHERE city IN ('Mumbai', 'Delhi');

--Q8. Show orders with customer names.
SELECT c.customer_name, o.order_id
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

--Q9. Show product names with quantities sold.
SELECT p.product_name, oi.quantity
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id;

--Q10. Find the cheapest product.
SELECT *
FROM products
ORDER BY price ASC
LIMIT 1;
