use db4;

## String Operation

## 	Q1 Display all customer names in UPPERCASE
select customer_name, upper(customer_name) as upper_cust_name from sales;

## 	Q2 Display all customer names in LOWERCASE
select customer_name as capitalize_case, 
upper(customer_name) as upper_cust_name, 
lower(customer_name) as lower_cust_name 
from sales;


## 	Q3 Find the length of each customer name
select customer_name, length(customer_name) as length_of_characters from sales;

## Q4 Remove extra spaces :- '   Aarav Sharma   '
select trim('   Aarav Sharma   ') as trimmed_name;

## Q5 Extract first name from customer_name
select  customer_name, substring_index(customer_name, " ", 1) as first_name from sales;

## Q6 Extract last name from customer_name
select  customer_name, substring_index(customer_name, " ", -1) as first_name from sales;


## Q7 Display first 5 characters of product_name
select product_name, left(product_name, 5) as first_5_chars from sales;


##WILDCARDS

## Q8 Find customers whose name starts with 'A'
select customer_name from sales 
where customer_name like 'A%';

## Q9 Find customers whose name ends with 'A'
select customer_name from sales 
where customer_name like '%A';

## Q10 Find products containing the word 'Table'
select product_name from sales
where product_name like '%table%';

## Q11 Find position of space in customer_name
select customer_name, instr(customer_name, " ") as space_position from sales;

## Q12 Replace 'Online' with 'E-Commerce' in sales_channel  
select order_id, sales_channel, replace(sales_channel, 'Online', 'E-commerce') as updated_sales_channel
from sales;

 ## --> Replace function is case sensetive

## Q13 Reverse customer names
Select customer_name, reverse(customer_name) as reverse_name from sales;

## Q14 Create a new column showing: "Customer lives in City"
select order_id, concat(customer_name, " ", 'lives in', " " , city) as cust_city
from sales;

## 	Q15 Seperate first and last name
select  customer_name, substring_index(customer_name, " ", 1) as first_name, substring_index(customer_name, " ", -1) as last_name from sales;


## Homework

# Q1 Capitalize case the name --ask sir

select  customer_name, substring_index(customer_name, " ", 1) as first_name, substring_index(customer_name, " ", -1) as last_name from sales;

# Q2 Generate email ids like aarav.sharma#company.com
select customer_name, concat(lower(substring_index(customer_name, " ", 1)), ".", lower(substring_index(customer_name, " ", -1)), "@company.com") as email_ids 
from sales;

# Q3 categorised product names :
/* if contains 'Table' --> Furniture Item
if contains 'Shirt' or 'jeans' --> clothing item */

select order_id,
product_name, 
   case 
   when product_name like '%table%' then 'Furniture item'
   when product_name like '%Shirt%' or product_name like '%jeans%'then 'Clothing item'
   else 'others'
   end as product_category
from sales;