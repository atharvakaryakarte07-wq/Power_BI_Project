use db4;

##WINDOW FUNCTIONS

## Q1 Calculate the total sales (total_amount) for each city, but display it alongside each order.

select *, sum(total_amount) OVER (PARTITION BY city) as total_sales from sales;

## Q2 Find the average price_per_unit for each product_category, without grouping the rows.
select *, avg(price_per_unit) over (partition by product_category) as avg_price from sales;

## Q3 Calculate a running total of total_amount based on order_date.
Select *, sum(total_amount) over (order by order_date ASC) as running_total from sales;

## Q4 Show the previous order’s total_amount for each row based on order_date.
select *, lAG(total_amount) over (order by order_date ASC) as previous_value from sales;

## Q5 Show the next order’s quantity for each row based on order_date.
SELECT *, lead(total_amount) over (order by order_date ASC) AS next_value from sales;

## Q6 Assign a ROW_NUMBER to all orders based on total_amount (highest first).
select row_number() over (order by total_amount DESC) as Row_num, order_id, customer_name, total_amount 
from sales;

## Q7 Assign a RANK to orders within each city based on total_amount.
select rank() over (partition by city order by total_amount DESC) as Rank_no, order_id, customer_name, total_amount, city
from sales;

## Q8 Assign a DENSE_RANK to order_id based on price_per_unit (highest first).
select dense_rank() over (order by price_per_unit DESC) as Dense_rank_no, order_id, customer_name, total_amount, price_per_unit 
from sales;

## Q9 Find the top 3 highest total_amount orders in each product_category.
select * from (Select *, dense_rank() over (partition by product_category order by total_amount DESC) as top_3 from sales) t 
where top_3 <= 3;

##Q10 Find the second highest total_amount order in each city.
select * from (select *, dense_rank() over (partition by city order by total_amount desc) 
as highest_amount from sales) t where highest_amount = 2;

## alias t is compulsory for derived table
