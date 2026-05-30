CREATE DATABASE db7;

use db7;

## Create New Table

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

## Insert The Data

INSERT INTO employees VALUES
(1, 'Amit', NULL),   -- CEO (no manager)
(2, 'Neha', 1),
(3, 'Rahul', 1),
(4, 'Sneha', 2),
(5, 'Karan', 2);

select * From employees;

## Q-1: Show each employee along with their manager name

SELECT 
    e.emp_name AS employee,
    m.emp_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;



## Alternate Way:

## 1.Correlated subquery:

SELECT 
    emp_name AS employee,
    (
        SELECT emp_name 
        FROM employees m
        WHERE m.emp_id = e.manager_id
    ) AS manager
FROM employees e;

## 2.CTE:

WITH emp_cte AS (
    SELECT * FROM employees
)
SELECT 
    e.emp_name AS employee,
    m.emp_name AS manager
FROM emp_cte e
LEFT JOIN emp_cte m
ON e.manager_id = m.emp_id;




## Cross Join:

CREATE TABLE colors (
    color VARCHAR(20)
);

INSERT INTO colors VALUES
('Red'),
('Blue');

CREATE TABLE sizes (
    size VARCHAR(20)
);

INSERT INTO sizes VALUES
('S'),
('M'),
('L');

## Q-Generate all possible combinations of colors and sizes:

SELECT 
    c.color,
    s.size
FROM colors c
CROSS JOIN sizes s;

