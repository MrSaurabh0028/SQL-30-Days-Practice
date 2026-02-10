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


---E-COMMERCE SQL – VERY SIMPLE (10 QUESTIONS + ANSWERS)
--Q1. Show all product names.
SELECT product_name FROM products;

--Q2. Show all customers from Delhi.
SELECT *
FROM customers
WHERE city = 'Delhi';

--Q3. Show all orders placed by customer with id = 1.
SELECT *
FROM orders
WHERE customer_id = 1;

--Q4. Count total number of products.
SELECT COUNT(*) AS total_products
FROM products;

--Q5. Show product name and price where price > 10000.
SELECT product_name, price
FROM products
WHERE price > 10000;

--Q6. Show all order items.
SELECT * FROM order_items;

--Q7. Show product id and quantity from order_items table.
SELECT product_id, quantity
FROM order_items;

--Q8. Show distinct product categories.
SELECT DISTINCT category
FROM products;

--Q9. Show orders sorted by order date (latest first).
SELECT *
FROM orders
ORDER BY order_date DESC;

--Q10. Show top 3 expensive products.
SELECT *
FROM products
ORDER BY price DESC
LIMIT 3;