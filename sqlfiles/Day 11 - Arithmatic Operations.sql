use db4;

select * from sales;

## Arithmatic operations

## Q1 Calculate total price using quantity and price_per_unit.
select order_id, total_amount, (quantity * price_per_unit) as total_price from sales;   -- comment

## Q2 Add ₹100 delivery charge to each order.
select order_id, total_amount, (total_amount + 100) as total_cost from sales;

## Q3 Apply 10% discount on total_amount.
select order_id, total_amount, (total_amount - (total_amount * 0.1)) as final_price from sales;
select order_id, total_amount, (total_amount * 0.9) as final_price from sales;

## Q4 Apply 18% GST to total_amount.
select order_id, total_amount, (total_amount * 1.18) as final_price from sales;
select order_id, total_amount, (total_amount + (total_amount * 0.18)) as final_price from sales;

## Q5 Assume cost is 70% of total_amount. Calculate profit.
select order_id, total_amount, (total_amount - (total_amount * 0.7)) as profit from sales; 
select order_id, total_amount, (total_amount * 0.70) as cost, (total_amount * 0.30) as profit from sales;

## Q6 Find average price per unit
select order_id, total_amount, price_per_unit, (total_amount/quantity) as p_p_u from sales;

## Q7 Apply discount: 
/* 20% if total_amount > 20000, 
10% otherwise */

select 
  order_id,
  total_amount,
  (case 
      when total_amount > 20000 then total_amount * 0.8
      Else total_amount * 0.9
  end) as Discounted_amount
from sales;



## Q8 Calculate Final Bill Amount with:
/* 10% discount if total_amount > 20000, else 5%
Add 18% GST on discounted amount
Add ₹100 delivery charge
Show:
Original amount
Discount 
Tax 
Final amount */

SELECT order_id, total_amount,
  (case
      when total_amount > 20000 then total_amount * 0.1
      else total_amount * 0.05
  End) as Discount,
(total_amount - (case
      when total_amount > 20000 then total_amount * 0.1
      else total_amount * 0.05
  End)) as amount_after_discount,
((total_amount - (case
      when total_amount > 20000 then total_amount * 0.1
      else total_amount * 0.05
  End)) * 0.18) as Tax, 
((total_amount - (case
      when total_amount > 20000 then total_amount * 0.1
      else total_amount * 0.05
  End)) * 1.18) as amount_after_tax,
 (((total_amount - (case
      when total_amount > 20000 then total_amount * 0.1
      else total_amount * 0.05
  End)) * 1.18) +100) as Final_Amount
from sales;



