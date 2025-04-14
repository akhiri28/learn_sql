/*
A subquery is a query nested inside another SQL query. It helps break complex logic into smaller, manageable pieces.

Types of Subqueries:
--------------------
1. Scalar Subquery (returns one value)
2. Row Subquery (returns one row)
3. Column Subquery (returns one column, multiple rows)
4. Table Subquery (used in FROM)

*/

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