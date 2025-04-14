-- select distinct values of a column from a table.
select * from playstore;
select distinct category from playstore;

-- run count on distinct
-- give an alias
select count(distinct category) as cnt_category from playstore;