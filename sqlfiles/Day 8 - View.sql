use db4;

## View

select * from sales;

## Q1 Create view for sales table which will be querying all the data

create view All_sales as
select * from sales;

select * from All_sales;

## Q2 Create view for sales table which will be querying the data only for Pune

create view Pune_data as
select * from sales
where City = 'Pune';

select * from Pune_data;

##  Q3 Create View for Sales Table which Will be querying the data only for Pune (Give Only acces to 6 columns).

CREATE VIEW Pune_data2 as
select order_id, order_date, customer_name, city , product_category, product_name from sales
where city = 'Pune';

select * from Pune_data2;

## Q4 Hide customer_name column from Pune_data2 (Alter)

alter view Pune_data2 as 
select order_id, order_date, city , product_category, product_name from sales
where city = 'Pune';

select * from Pune_data2;

## Q5 Create the table using view

create table Pune_sales as
select * from Pune_data;

## Q6 Drop view  --> even after dropping the view, the table remains

Drop view Pune_data;


