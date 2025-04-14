/*
In MySQL, Common Table Expressions (CTEs) are temporary result sets that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement. 
CTEs make queries more readable and are especially useful for recursive queries or when you want to break complex queries into smaller parts.

WITH cte_name AS (
    SELECT ...
)
SELECT * FROM cte_name;
*/

with t1 as
(
select Category, round(avg(Rating), 2) as 'free'
from data_for_sql.playstore
where type = 'Free'
group by Category
),
t2 as
(
select Category, round(avg(Rating), 2) as 'paid'
from data_for_sql.playstore
where type = 'Paid'
group by Category
)

select *, if(paid > free, 'develop paid apps', 'develop free apps') as 'decision'
from
(
select t1.Category, t2.paid, t1.free
from t1 inner join t2
on t1.Category = t2.Category
)k;



