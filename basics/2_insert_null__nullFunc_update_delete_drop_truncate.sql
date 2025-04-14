-- create a table
-- create table test_table (abc_int int, abc_str varchar(255));
-- drop table test_tbl;
-- create table test_tbl as (select category, round(avg(rating) , 2) as 'avg_rating' from playstore group by category);

-- Insert single row.
/* insert into test_tbl (category, avg_rating)
values ('Education', 5); */

-- insert multiple rows
/*
insert into test_tbl (category, avg_rating)
values ('Education', 5),
('Sports', 4.9);
*/

-- insert rows of you are sure of column order
-- insert into test_tbl values ('FOOD', 4.7);

-- Try insert rows of with only one value - Error
-- insert into test_tbl values ('Entertainment');

-- Insert NullValue
-- insert into test_tbl (category) values ('Entertainment');

-- Insert into with select
-- insert into test_tbl (category, avg_rating) 
-- (select category, avg_rating from test_tbl);

-- select * from test_tbl;

-- Fill Null values.
/*
select * from test_tbl
where avg_rating is null; */

/*
select * from test_tbl
where avg_rating is not null; */

/*
-- Update
SET SQL_SAFE_UPDATES = 0;
update test_tbl
set avg_rating = 5
where category = 'Entertainment'; */

/*
select * from 
test_tbl
where category = 'Entertainment';
*/

/*
-- Delete
delete from test_tbl
where category = 'Entertainment';
*/

-- select * from test_tbl;

-- Drop table
-- drop table test_tbl;

/*
-- null functions
-- ifnull()
select category, ifnull(avg_rating, 5)
from test_tbl;

select category, ifnull(avg_rating, 5) * 100 -- with expression
from test_tbl;

-- coalesce()
select category, coalesce(avg_rating, 5)
from test_tbl; 
*/

-- TRUNCATE
-- truncate table test_tbl;

select * from test_tbl;







