use db4;

## Date specifiers

## Q1 Show all orders with order date in YYYY format only
select order_id, date_format(new_order_date, '%Y') AS Year
from sales;

## Q2 Display order date as last 2 digits of year

