-- group by and order by
select category, round(avg(reviews), 0) 'avg_reviews'
from playstore
group by category
order by round(avg(reviews), 0) desc;

select category, round(avg(reviews), 0) 'avg_reviews'
from playstore
group by category
order by round(avg(rating), 2) desc; -- order can be aggregation function on other column.

-- having
select category, round(avg(reviews), 0) 'avg_reviews'
from playstore
group by category
having round(avg(reviews), 0) >  50000 -- having has to be before order.
order by round(avg(reviews), 0) desc;

