-- Use in select
select Rating,
case 
	when rating > 4 then 'Rating greater than 4'
	when rating = 4 then 'Rating is 4'
	else 'Rating is less than 4'
end as rating_comments
from playstore;

-- Use in order by clause.
select * from playstore
order by 
(
case 
	when reviews > 1000000 then reviews
	else rating
end
);

-- IF ELSE
/*
Use IF() for simple conditions that return a value.
Use IF...ELSE inside stored procedures or functions. - Will deal later.
Use IF in SET for variable assignment.
Use IF in WHERE for conditional filtering.
*/

select Rating,
if( rating > 4 , 'Rating greater than 4', 
    if( rating = 4 , 'Rating is 4', 'Rating is less than 4')) as rating_comments
from playstore;

-- Varaibles in SQL
set @threshold = 4;
select Rating,
if( rating > @threshold , 'Rating greater than 4', 
    if( rating = @threshold , 'Rating is 4', 'Rating is less than 4')) as rating_comments
from playstore;

set @threshold = 49;
set @message = if (@threshold > 50, 'Thresholld is high', 'Threshold is low');
select @message;

SELECT * FROM playstore 
WHERE IF(category = 'ART_AND_DESIGN', rating > 4.7, rating > 4.8);


