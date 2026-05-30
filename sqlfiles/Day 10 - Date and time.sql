use db4;

select * from sales;

alter table sales
modify order_date DATE;

alter table sales
add column new_order_date date;

# Update all values in new column 

update sales
set new_order_date = str_to_date(Order_date, '%d-%m-%Y');

set sql_safe_updates = 0;

select * from sales;


## Q1 Extract Year from date column
select *, YEAR(new_order_date) as Year from sales;

## 	Q2 Extract Year from date column
select *, month(new_order_date) as Month from sales;

## Q3 Extract Month Name from date column
select *, monthname(new_order_date) as monthname from sales;

## Q4 Extract Day Name from date column
Select *, dayname(new_order_date) as dayname from sales;

## Q5 I want only data for the month of March (Irrespective of the Year)
select * from sales
where month(new_order_date) = 3;

##  Q6 Display all Orders After > '2022-03-01'
select * from sales 
where new_order_date > '2022-03-01';

## Q7 Display the number of days between today and the order date.
Select *, datediff(curdate(), new_order_date) as Days from sales;

##here we are just displaying the results not updating the table to do that,
#we need to make a new column by using 'alter' query and then use 'update' query

alter table sales
add column days1 int;

update sales
set days1 = datediff(curdate(), new_order_date);

select * from sales;


## Q8 Add 7 days to every order date.
Select *, date_add(new_order_date, interval 7 day) as delivery_date from sales;


## Q9 I want data only for the year 2024.
SELECT * from sales
where year(new_order_date) = 2024;

## Q10 Write a query to display order_id, new_order_date, the day name, and the month name of each order from the Sales table.

SELECT order_id, new_order_date, dayname(new_order_date), monthname(new_order_date) from sales;



# How to delete a column 

alter table sales
drop column days;

select * from sales;