##User defined function
use db4;
## Q1 Calculate total amount using quantity and price_per_unit

DELIMITER //
create function product(qty int, ppu int)
returns int
DETERMINISTIC
BEGIN
    RETURN qty * ppu;
END//
DELIMITER ;

#Calling the function
select 
    *, 
    product(quantity, PRICE_PER_UNIT) as total_sales
from sales;

#to compare
select 
    total_amount, 
    product(quantity, PRICE_PER_UNIT) as total_sales
from sales;



## Q2 Apply a random discount to total amount

DELIMITER &&
Create function Discount(Ta int, Di float)
returns int
DETERMINISTIC
Begin
    return( ta - (ta * Di));
end &&
DELIMITER ;

select *, Discount(total_amount, 0.3) as final_price
from sales;


