/* As a data analyst at a mobile app-focused market research firm you’ll recommend 
whether the company should develop paid or free apps for each category based on the ratings of that category.*/
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