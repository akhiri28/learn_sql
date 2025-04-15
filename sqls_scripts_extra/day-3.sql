select count(*) from data_for_sql.playstore;

/* load data infile "E:/learn_sql/playstore.csv"
into table data_for_sql.playstore
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;*/

/* You're working as a market analyst for a mobile app development company. 
Your task is to identify the most promising categories (TOP 5) for launching new free apps based on their average ratings */

select Category, round(avg(Rating), 3) as 'avg_rating' from data_for_sql.playstore
where Type = 'Free'
group by Category
order by 2 desc
limit 5;

/* As a business strategist for a mobile app company, 
your objective is to pinpoint the three categories that generate the most revenue from paid apps. 
This calculation is based on the product of the app price and its number of installations.*/
select Category , (avg(Installs * Price)) as 'total_revenue'
from data_for_sql.playstore
where Type = "Paid"
group by Category
order by 2 desc
limit 3;

/*As a data analyst for a gaming company, you're tasked with calculating the percentage of apps within each category. 
This information will help the company understand the distribution of gaming apps across different categories.*/
select * , round((app_count / (select count(*) from data_for_sql.playstore)) * 100, 2) as 'perc_of_apps_in_category'
from
(
select Category, count(App) as 'app_count'
from data_for_sql.playstore
group by Category
)t;

/* As a data analyst at a mobile app-focused market research firm you’ll recommend 
whether the company should develop paid or free apps for each category based on the ratings of that category.*/
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









