/*

JOINS
- Inner Join (JOin and inner join will resturn the same results)
- Left Join
- Right Join
- Full OUter Join.
- self join
- union

*/

select * from products;
select * from orders;
select * from customers;
select * from suppliers;

-- Inner JOin
-- JOin 2 tables
select * from
customers as c
inner join orders o 
on c.customer_id = o.customer_id;

-- JOin multiple tables.
select * 
from
customers as c
inner join orders o on c.customer_id = o.customer_id
inner join products p on o.product_id = p.product_id
inner join suppliers s on p.supplier_id = s.supplier_id;

-- join and inner join return same result
-- JOin 2 tables
select count(*) from
customers as c
join orders o 
on c.customer_id = o.customer_id;

-- Inner JOin 2 tables
select count(*) from
customers as c
inner join orders o 
on c.customer_id = o.customer_id;



