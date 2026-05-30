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


## Q4 Label orders as:
/* 'Old Order' → if year = 2022
'Recent Order' → otherwise */

select order_id, total_amount, new_order_date, 
       case 
       when year(new_order_date) <= 2022 then 'Old order'
       Else 'Recent order'
       End as order_type
from sales;
       
## Q5 Classify cities into regions:
/* 'Maharashtra' → Mumbai, Pune
'North' → Delhi
'Other' → remaining */

select order_id, total_amount, city,
      case
      when city in ('Mumbai', 'Pune') then 'Maharashtra'
      when city = 'Delhi' then 'North'
      else 'others'
      end as city_region
from sales;

## 	Q6 Label orders as:
/*'E-Commerce' → Online
'Store' → Offline */
select order_id, total_amount, sales_channel,
      case 
      when sales_channel = 'Online' then 'E-Commerce'
      else 'Store'
      end as sales_channel_mode 
from sales;

## Q7 Mark orders as:
/* 'Eligible for Discount' → total_amount > 10000
'Not Eligible' → otherwise */
select order_id, total_amount,
      case 
      when total_amount > 10000 then 'Eligible for Discount'
      else 'Not Eligible'
      end as Eligibility
from sales;

## Q9 Categorize orders as:
/* 'Winter' → Jan, Feb
'Summer' → Apr, May
'Other' → remaining */

select order_id, new_order_date, 
      case 
      when month(new_order_date) in (1, 2) then 'Winter'
	  when month(new_order_date) in (4,5) then 'Summer'
      else 'Other'
      end as Season
from sales;

##USING monthname
select order_id, Monthname(new_order_date), 
      case 
      when monthname(new_order_date) in ('January', 'February') then 'Winter'
	  when monthname(new_order_date) in ('April','May') then 'Summer'
      else 'Other'
      end as Season
from sales;

## Q10 Display all orders sorted with priority:
/* Mumbai
Delhi
Others */
select order_id, city from sales
order by 
    case 
    when city = 'Mumbai' then 1
    when city = 'Delhi' then 2 
    else 3
    end;

##Other way 

select order_id, city,
     case
     when city = 'Mumbai' then 1
     when city = 'Delhi' then 2 
     else 3
     end as Priority
from sales
Order by Priority ASC; 


