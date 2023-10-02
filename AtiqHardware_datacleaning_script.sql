select * from sales.transactions;

select t.sales_amount*75
from sales.transactions as t
where t.currency = "USD";

-- to convert USD to RS

update sales.transactions
set sales_amount = sales_amount* 75
where sales.transactions.currency = "USD";

-- to replace USD to RS

update sales.transactions set currency= replace(currency,'USD','INR');

select *
from sales.transactions;

-- to eliminate rows with blank zones

select distinct(zone)
from sales.markets;

delete 
from sales.markets
where zone = '' or zone is null;

select *
from sales.markets;

-- checking if there are any duplicates, blanks or nulls

select distinct(product_code), product_code
from sales.products;

select distinct(product_type)
from sales.products;

select sales_amount
from sales.transactions
where sales_amount = 0;

select distinct(currency)
from sales.transactions;

select count(currency)
from sales.transactions;

select product_code, count(product_code)
from sales.transactions
group by product_code
having count(product_code)> 1;

-- checking rows with missing values in any of the column

select distinct(conca)
from sales.transactions
where conca in
(select concat(product_code, customer_code, market_code, order_date, sales_qty, sales_amount) as conca
from sales.transactions)
having count(conca)>1;

-- checking for duplicates or invalid entry

select product_code, customer_code, market_code, order_date, sales_qty, sales_amount, count(*)
from sales.transactions
group by product_code, customer_code, market_code, order_date, sales_qty, sales_amount
having count(*)>1;

select *
from sales.transactions
where sales_amount <1;

-- deleting rows

delete
from sales.products
where product_code is null or product_code='';