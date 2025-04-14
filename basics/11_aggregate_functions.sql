/*
Aggregation functions
- MIN
- MAX
- COUNT
- SUM
- AVG
*/

select * from playstore;

-- count
select count(*) from playstore;

select count(app) from playstore;

select count(distinct category) from playstore;

select count(distinct category, app) from playstore;

-- MIN
select min(rating) from playstore;

-- MAX
select max(rating) from playstore;

-- SUM
select sum(rating) from playstore;

-- AVG
select round(avg(rating), 2) as avg_rating_art from playstore
where category = 'ART_AND_DESIGN';

-- AVG with expression
select round(avg(rating * 10), 2) as avg_rating_art from playstore
where category = 'ART_AND_DESIGN';

select round(avg(rating * reviews ), 2) as avg_rating_art from playstore
where category = 'ART_AND_DESIGN';


