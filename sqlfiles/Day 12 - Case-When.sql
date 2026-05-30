use db4;

## Case - when - Derived column

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
   when  payment_mode = 'Cash' then 'Cash'
   else 'Unknown'
   end as payment_type
from sales;

## Q3 Classify orders into:
/* 'Very High' → > 30000
'High' → > 10000
'Medium' → > 5000
'Low' → others */

select order_id, total_amount,
     case
     when total_amount > 30000 then 'Very High'
     when total_amount > 10000 then 'High'
     WHEN total_amount > 5000 then 'Medium'    -- sequnce is imp in case-when statement
     else 'Low'
	 end as order_Status
from sales;


