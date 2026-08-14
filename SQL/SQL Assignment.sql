-- 1. Write a query to create database with name pizza_sales_analysis.
CREATE DATABASE pizza_sales_analysis;

-- 2. Write a query to see list of all databases. 
SHOW DATABASES; 

-- 3. Write a query to create table. 
USE pizza_sales_analysis;

CREATE TABLE orders (
	ID INT,
    order_date DATE
);

-- 4.  Write a query to add column time with datatype time after date column in above order table.
ALTER TABLE orders
ADD COLUMN order_time time;

-- 5. Write a query to rename the table orders to customer_orders.
ALTER TABLE orders
RENAME TO customer_orders;

-- 6. Add primary key constraint to the column id on existing table customer_orders.
ALTER TABLE customer_orders
MODIFY ID INT PRIMARY KEY;

SELECT * FROM customer_orders;
  