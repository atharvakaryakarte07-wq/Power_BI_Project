use db4;

## CTE: 
## view - DDL Mostly -- we can store it as well
## CTE - DQL as well

## Q-1: Total Sales per City


WITH city_sales AS (
    SELECT city, SUM(total_amount) AS total_sales
    FROM sales
    GROUP BY city
)
SELECT * FROM city_sales;


## Q-2: Find Above Average Orders

WITH avg_sales AS (
    SELECT AVG(total_amount) AS avg_value
    FROM sales
)
SELECT customer_name, total_amount
FROM sales, avg_sales
WHERE total_amount > avg_value;

## Cross join:

WITH avg_sales AS (
    SELECT AVG(total_amount) AS avg_value
    FROM sales
)
SELECT s.customer_name, s.total_amount
FROM sales s
CROSS JOIN avg_sales a         -- we can use as implicit join as well
WHERE s.total_amount > a.avg_value;


## Q-3:Total Quantity Sold per Product

WITH product_qty AS (
    SELECT product_name, SUM(quantity) AS total_qty
    FROM sales
    GROUP BY product_name
)
SELECT * FROM product_qty;


## Q-4: Filter High Value Orders (> 20000)

WITH high_orders AS (
    SELECT *
    FROM sales
    WHERE total_amount > 20000
)
SELECT * FROM high_orders;


## Q-5: Category-wise Sales

WITH category_sales AS (
    SELECT product_category, SUM(total_amount) AS total_sales
    FROM sales
    GROUP BY product_category
)
SELECT * FROM category_sales;
