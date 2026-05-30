create database db4;

use db4;

select * from sales;

show tables;

## Aggregate functions

## Q1 The owner wants to know how many total orders have been placed so far.
select count(order_id) as "Total orders" from sales;

##Q2 Find the total revenue generated from all orders combined.
Select sum(total_amount) as "Total revenue generated" from sales;

## Q3 What is the average order value across all orders?
select avg(total_amount) As "Averaage order value" from sales;

##	Q4 The owner wants to give a prize to the customer with the highest order amount -find that amount.
Select max(total_amount) as "Highest order amount" from sales;

## Q5 Find the Lowest Order Value.
Select min(total_amount) as "Lowest order amount" from sales;


## GROUP BY 

## Q1 City wise total sales
select city, sum(total_amount) as "total sales" from sales
group by city;

## Q2 Distinct cities
select city from sales
group by city;

## Q3 Distinct product categories
select product_category from sales
group by product_category;

## Q4 Payment mode
select payment_mode from sales
group by payment_mode;

## Q5 The manager wants to know how many orders were placed from each city. Display city wise order count.
select city, count(order_id) as "order count" from sales
group by city;


## Q6 Find the total revenue generated from each product_category.
select product_category, sum(total_amount) as "Total revenue generated" from sales
group by product_category;


## Q7 Show the average order value for each payment_mode, 
#the finance team wants to know which payment method has the highest average.

select payment_mode, avg(total_amount) as AVG_Sales from sales
group by payment_mode
order by AVG_Sales desc
limit 2;

## Q8 Display the total quantity sold for each product_category.
SELECT product_category, sum(quantity) as quantity_sold, sum(total_amount) as Total_revenue from sales
group by product_category;

## SELECT list should be present in Group by clause - city
SELECT product_category, city,  sum(quantity) as quantity_sold, sum(total_amount) as Total_revenue from sales
group by product_category, city
order by product_category DESC, quantity_sold DESC;

## Homework

##  Find the maximum order amount placed from each sales_channel (Online vs Offline)

select sales_channel, max(total_amount) as max_order_amount from sales
group by sales_channel;

##  Find all cities where total revenue is more than 10,000
select city, sum(total_amount) as total_amount from sales
group by city
having total_amount > 10000;

## Show only those product_categories where more than 61 orders have been placed.
select product_category, count(order_id) as count_order from sales
group by product_category
having count_order >61;

## Display all payment modes where the average transaction amount is greater than 5,000
select payment_mode, avg(total_amount) as total from sales
group by payment_mode 
having total > 5000;

 ## Find the top 3 cities with the highest total revenue, display them in descending order
 select city, sum(total_amount) as total_revenue from sales
 group by city
 order by total_revenue DESC
 limit 3;
 
 ## Show the top 2 product categories that have generated the most revenue, 
 # but only include categories where total revenue exceeds 5,000. Sort from highest to lowest. 
 
 select product_category, sum(total_amount) as total from sales
 group by product_category
 having total >  5000
 order by total DESC  
 limit 2;
 



