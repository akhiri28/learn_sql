-- alias for table names
select * from playstore as p;
select p.app from playstore as p;

-- alias to column names
select  category as app_cat from playstore;

-- as keyword is optional.
select  category app_cat from playstore;

-- alias names with spaces
select category "App Category" from playstore;

-- alias to derived table.

/* to comment mutiple statements */ 
select s.App from 
(
select * from playstore
)s;


-- concate columns
select concat(App , ' - ' , category) as app_category_concat from playstore;