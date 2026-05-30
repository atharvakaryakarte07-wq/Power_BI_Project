create database db5;

use db5;

select * from customers;
select * from orders;

show tables;

## Q1 Show the name and city of all customers along with their order amount, only for customers who have placed an order
##Inner Join

select c.customer_name, c.city, o.order_amount from customers c 
inner join orders o
on c.customer_id = o.customer_id;

## Q2 Display all customer names and their product category, only for matched records.

select c.customer_name, o.product_category from customers c 
inner join orders o
on c.customer_id = o.customer_id;

##Q3 Show customer name, payment mode and quantity for all matching orders.
select c.customer_name, o.payment_mode, o.quantity from customers c 
inner join orders o
on c.customer_id = o.customer_id;

## Q4 Display all customer details along with their order id and order amount : only for customers who have ordered.
select c.*, o.order_id, o.order_amount from customers c 
inner join orders o
on c.customer_id = o.customer_id;
 
 
 ## Q5 Show order id, customer name and gender for all matching records.
 SELECT c.customer_name, o.order_id, c.gender from customers c
 inner join orders o  
 on c.customer_id = o.customer_id;
 
 
 ## Q6 Show ALL customers and their order amounts : including customers who have not placed any order.
 select c.*, o.order_amount from customers c 
 left join orders o 
 on c.customer_id = o.customer_id;
 
 ## Q7 Display all customers along with their product category : show NULL if no order exists.
 select c.*, o.product_category from customers c 
 left join orders o 
 on c.customer_id = o.customer_id;
 
 ## Q8 Show all customers with their order id and payment mode : even if customer has not ordered.
 select c.*, o.order_id, o.payment_mode from customers c 
 left join orders o 
 on c.customer_id = o.customer_id;
 
 ## Q9 Show ALL orders along with customer name and city : including orders where customer details are missing.
 select o.*, c.customer_name, c.city from customers c
 right join orders o 
 on c.customer_id = o.customer_id;    ## we can solve same problem with left join
 
 
## Q10 Display all orders with customer gender and loyalty points : show NULL if customer not found.
select o.*, c.gender, c.loyalty_points from customers c
right join orders o
on c.customer_id = o.customer_id;    ## solve the same question with left join

## Q11 Show customer name and order amount for all customers from Pune who have placed an order.
select c.customer_name, o.order_amount, c.city from customers c
inner join orders o 
on c.customer_id = o.customer_id
where city = "Pune"; 

 ## Q12 Display all orders where payment mode is UPI : show customer name and city along with order details, only for matching records
 select o.*, c.customer_name, c.city from customers c 
 inner join orders o
 on c.customer_id = o.customer_id
 where payment_mode = "UPI";
 
 ## Q13 Show customer name and order amount for all matched records : sorted by order amount from highest to lowest.
 select c.customer_name, o.order_amount from customers c
 inner join orders o
  on c.customer_id = o.customer_id
  order by o.order_amount DESC;
 
 ## Q14 Display customer name, loyalty points and order amount : sorted by loyalty points from highest to lowest.
 select c.customer_name, c.loyalty_points, o.order_amount from customers c
 inner join orders o
 on c.customer_id = o.customer_id
 order by c.loyalty_points DESC;
 
 ## Q15 Find the total order amount spent by each customer.
 select c.customer_id, sum(o.order_amount) from customers c
 inner join orders o
 on c.customer_id = o.customer_id
 group by c.customer_id;
 
 ## Q16 Find the total quantity ordered from each city.
 select c.city, sum(o.quantity) from customers c 
 inner join orders o 
 on c.customer_id = o.customer_id
 group by city;
 
 ## Display highest to lowest
 
 select c.city, sum(o.quantity) as total_quantity from customers c 
 inner join orders o 
 on c.customer_id = o.customer_id
 group by city
 order by total_quantity DESC;
 
 
 ## Q17 Find the total order amount from each product category along with how many orders were placed.
 select product_category, sum(order_amount) as Total_amount, count(quantity) as Total_orders from orders
 group by product_category;
 
 ## Display only records where Total_orders > 30
 
 select product_category, sum(order_amount) as Total_amount, count(quantity) as Total_orders from orders
 group by product_category
 having Total_orders > 30;
 
 ## Q18 Find all cities where total order amount is more than 5000
 select c.city, sum(o.order_amount) as total_order from customers c 
 inner join orders o
 on c.customer_id = o.customer_id
 group by c.city
 having total_order > 5000;
 
 ## Q19 Find all product categories where total quantity ordered is more than 60.
 select product_category, sum(quantity) as Quantity_ordered from orders
 group by product_category
 having Quantity_ordered > 60;
 
 ## Q20 Find the top 2 cities with total spending more than 400 :
 #considering only Card or UPI payments : sorted highest to lowest.
 
 select c.city, sum(o.order_amount) as Total_spending from customers c
 inner join orders o 
 on c.customer_id = o.customer_id
 where payment_mode = "Card" or payment_mode = "UPI"
 Group by c.city
 having Total_spending > 400
 order by Total_spending DESC
 limit 2;
 
select c.city, sum(o.order_amount) as Total_spending from customers c
 inner join orders o 
 on c.customer_id = o.customer_id
 where payment_mode in ('card', 'UPI')
 Group by c.city
 having Total_spending > 400
 order by Total_spending DESC
 limit 2;
 
 ## Homework 
 
 ## Q21 Find product categories where total revenue is more than 500 
 #considering only male customers: sorted by total revenue highest to lowest: show top 2 only.
 Select o.product_category, sum(o.order_amount) as total_revenue  from customers c
 inner join orders o
 on c.customer_id = o.customer_id
 where c.gender = "M"
 group by o.product_category
 having total_revenue > 500
 order by total_revenue DESC
 LIMIT 2;
  
 ## Q22 Show ALL customers and ALL orders : whether they match or not.
 SELECT c.customer_name from customers c UNION
 select o.order_id from orders o;
 
 select * from customers c
 full outer join orders o 
 on  c.customer_id = o.customer_id