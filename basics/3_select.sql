-- select all columns from the tables.
select * from playstore;

-- select columns with columns names from the table.
-- in SQL column names are not case sensitive.
select APP, Category, rating from playstore;

-- Just write a string in select statement.
select 'akhilesh' from playstore;

-- Top Rows
select * from playstore
limit 3;

select *
from playstore
order by app desc
limit 3;

/*
create table test_tbl as 
select app, rating
from playstore where rating > 4.8;
*/

/* does not support select into
select * into test_tbl 
from test_tbl
where rating= 5;


