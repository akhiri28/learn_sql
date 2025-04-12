/*
Window functions in SQL perform calculations across a set of table rows that are related to the current row, without collapsing the rows like GROUP BY does.

function_name(...) OVER (
    [PARTITION BY ...]
    [ORDER BY ...]
)

Function	                           Description
---------                              ------------
ROW_NUMBER()	                       Assigns a unique row number
RANK()	                               Ranks with gaps
DENSE_RANK()	                       Ranks without gaps
NTILE(n)	                           Divides rows into n buckets
LAG() / LEAD()	                       Access previous/next row’s value
SUM() / AVG() / COUNT()	               Aggregates over window
*/

SELECT 
    app,
    category,
    rating,
    AVG(rating) OVER (PARTITION BY category ORDER BY app) AS running_total
FROM playstore;


select * 
from
(
select * , dense_rank() over (partition by Category order by avg_rating desc) as avg_rating_rank
from
(
select Category, Type, round(avg(Rating), 2) as 'avg_rating'
from data_for_sql.playstore
group by Category, Type
)t
)s
where s.avg_rating_rank = 1
order by 1;