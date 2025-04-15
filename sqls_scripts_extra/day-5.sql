/* Suppose you're a database administrator your databases have been hacked and hackers are changing price of certain apps on the database, 
it is taking long for IT team to neutralize the hack, however you as a responsible manager don’t want your data to be changed, 
do some measure where the changes in price can be recorded as you can’t stop hackers from making changes. */

-- Triggers (stored procedure - launches automatically)
create table data_for_sql.pricechangelog
(
app varchar(255),
old_price decimal(10, 2),
new_price decimal(10, 2), 
operation_type varchar(255), 
operation_date timestamp
);

create 
table data_for_sql.playstore_dup 
as
select * from data_for_sql.playstore;

DELIMITER //
create trigger data_for_sql.price_update
after update on data_for_sql.playstore_dup
for each row
begin 
	insert into data_for_sql.pricechangelog (app, old_price, new_price, operation_type, operation_date)
    VALUES (NEW.app, OLD.price, NEW.price, 'update', CURRENT_TIMESTAMP);
end;
//

-- drop trigger data_for_sql.price_update;
-- drop table data_for_sql.pricechangelog;
-- drop table data_for_sql.playstore_dup;

SET SQL_SAFE_UPDATES = 0;

UPDATE data_for_sql.playstore_dup
SET price = 5
WHERE app = 'Infinite Painter';

UPDATE data_for_sql.playstore_dup
SET price = 5
WHERE app = 'Sketch - Draw & Paint';

select * from data_for_sql.pricechangelog;


/* Your IT team have neutralized the threat; however, hackers have made some changes in the prices, 
but because of your measure you have noted the changes, now you want correct data to be inserted into the database again. */
drop trigger data_for_sql.price_update;

update data_for_sql.playstore_dup as a
inner join data_for_sql.pricechangelog as b
on a.app = b.app
set a.price = b.old_price;

select * from data_for_sql.playstore_dup
where app in ('Infinite Painter',  'Sketch - Draw & Paint');


/* As a data person you are assigned the task of investigating the correlation between two numeric factors: app ratings and the quantity of reviews. */
select rating , reviews from data_for_sql.playstore;

set @rating_mean = (select round(avg(rating), 2) from data_for_sql.playstore);
set @review_mean = (select round(avg(reviews), 2) from data_for_sql.playstore);
-- select  @rating_mean, @review_mean

with t as 
(
select ((rating -  @rating_mean) * (reviews -  @review_mean)) as 'numerator' , 
power((rating -  @rating_mean), 2) as 'sqofxminusxmu', power((reviews -  @review_mean), 2) as 'sqofyminusymu'
from data_for_sql.playstore
)
select round(sum(numerator) / SQRT(sum(sqofxminusxmu) * sum(sqofyminusymu)), 2) as 'rsquare' from t;

/* Your boss noticed  that some rows in genres columns have multiple genres in them, 
which was creating issue when developing the  recommender system from the data 
he/she assigned you the task to clean the genres column and make two genres out of it, rows that have only one genre will have other column as blank */


