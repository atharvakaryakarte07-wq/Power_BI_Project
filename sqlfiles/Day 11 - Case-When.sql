use db4;

## Case - when

## Q1 Classify each order as 'High' if total_amount > 20000, otherwise 'Low'.
select order_id, total_amount,
     case
     when total_amount > 20000 then 'High'
     else 'Low'
	 end as order_Status
from sales;



## Q2 Categorize payment modes into: 'Digital' → UPI, Credit Card, Debit Card  & 'Cash' → Cash
Select order_id, payment_mode,
   case
   when payment_mode IN ("UPI", "Credit Card", "Debit Card") then 'Digital'
   else 'Cash' 
   end as payment_type
from sales;


