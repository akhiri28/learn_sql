/* Suppose you're a database administrator your databases have been hacked and hackers are changing price of certain apps on the database, 
it is taking long for IT team to neutralize the hack, however you as a responsible manager don’t want your data to be changed, 
do some measure where the changes in price can be recorded as you can’t stop hackers from making changes. */

-- Triggers (stored procedure - launches automatically)
-- Audit Table
create table pricechangelog
(
app varchar(255),
old_price decimal(10, 2),
new_price decimal(10, 2), 
operation_type varchar(255), 
operation_date timestamp
);

-- Create a duplicate table.
create 
table data_for_sql.playstore_dup 
as
select * from data_for_sql.playstore;


/*
-- Delimiter --
You set DELIMITER // to treat // as the new "end of command".
Write your multi-line SQL block using ; inside it.
End the block with //.
Reset back to ; after you're done.
*/ 
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