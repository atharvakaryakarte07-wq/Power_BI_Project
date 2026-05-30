use db4;

## Stored procedure
## Q1 Create a procedure that displays all sales details.

DELIMITER && 
Create procedure GetAllData()
Begin
select * from Sales;
End &&

DELIMITER ;

call GetAllData();


## Q2 Create a procedure to get sales details for a given order_id.Example inputs: 1, 3, 5, 7

DELIMITER &&
create procedure GetAllDataforOrderID(IN order_id1 INT)
Begin
select * from sales
where order_id = order_id1;
End &&

DELIMITER ;

call GetAllDataforOrderID(2);

## Q3 Create a procedure to get all sales for a given city. Example: Mumbai, Delhi, Pune, Bangalore

DELIMITER &&
create procedure GetCityData(IN City_name VARCHAR(50))
Begin
select * from sales
where city = City_name;
End &&

DELIMITER ;

call GetCityData('Mumbai');

## Q4 Create a procedure that returns total sales amount for a given product_category. Example: Electronics, Grocery, Clothing

DELIMITER &&
Create procedure GetSalesAmount1(IN category VARCHAR(50))
Begin
SELECT product_category, SUM(total_amount) from sales
where product_category = category
group by product_category;
End &&
DELIMITER ;

call GetSalesAmount1('Electronics');

## Q8 An e-commerce company wants to find the total number of orders placed in a given city.
#Write a stored procedure that takes city as input and returns order count as output

DELIMITER &&
Create procedure Orders_placed(IN City_name VARCHAR(50))
Begin
select city, count(order_id) as count_orders from sales
where city = City_name
group by  city;
end &&
DELIMITER ;

call Orders_placed('Pune');

## Another way


DELIMITER &&
Create procedure Orders_placed1(IN City_name VARCHAR(50), out order_amount INT)
Begin
select count(order_id) INTO order_amount from sales
where city = City_name;
end &&
DELIMITER ;

call Orders_placed1('Pune', @totalorders);
select @totalorders;




## Homework

## Q5 Create a procedure that returns total quantity sold for a given product_name. Example: Smartphone, Laptop, Rice"	

DELIMITER &&
create procedure homework1(IN Product VARCHAR(50))
Begin
select product_name, sum(quantity) as total_quantity_sold from sales
where product_name = Product 
group by product_name;
end &&
DELIMITER ;

call homework1('USB cable');


## Q6 Write a stored procedure that accepts two order_id values and 
#returns the sales records matching either of the given order IDs.		
DELIMITER &&
Create procedure Homework2(IN ID1 INT, IN ID2 INT)
Begin
Select * from sales
where order_id IN (ID1, ID2);
end &&
DELIMITER ;

CALL Homework2(2,7);

			
## Q7 Write a stored procedure that returns the count of customers for a given office location.		

DELIMITER &&
create procedure Homework3(IN Location VARCHAR(50))
Begin
select city,  count(distinct(customer_name)) as Total_customers from sales
where city = Location
group by city;
end &&
DELIMITER ;	

call Homework3('Pune');
					
					
					
					


