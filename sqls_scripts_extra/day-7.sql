/* 

1. You Team must promote shark Tank India season 4, The senior come up with the idea to show highest funding domain wise so that new startups can be attracted, 
and you were assigned the task to show the same.

2. You have been assigned the role of finding the domain where female as pitchers have female to male pitcher ratio >70%


3. You are working at marketing firm of Shark Tank India, you have got the task to determine volume of per season sale pitch made, 
pitches who received offer and pitches that were converted. Also show the percentage of pitches converted and percentage of pitches entertained.
*/

select count(*) from data_for_sql.sharktank;

/* 1. You Team must promote shark Tank India season 4, 
The senior come up with the idea to show highest funding in each domain, so that new startups can be attracted,
and you were assigned the task to show the same. */

select Industry, max(Total_Deal_Amount_in_lakhs) as max_funding from data_for_sql.sharktank
group by Industry
order by max_funding desc;

select * from
(
select Industry, Total_Deal_Amount_in_lakhs, row_number() over( partition by Industry order by  Total_Deal_Amount_in_lakhs desc) as rnk
from data_for_sql.sharktank
group by Industry, Total_Deal_Amount_in_lakhs
)t
where rnk = 1;

/* 2. You have been assigned the role of finding the domain where female as pitchers have female to male pitcher ratio >70% */
select * , round ((female_presenters / male_presenters) * 100, 2 ) as ratio
from 
(
select Industry, sum(Number_of_Presenters) as presenters, sum(Male_Presenters) as male_presenters,  sum(Female_Presenters) as female_presenters
from data_for_sql.sharktank
group by Industry
)t 
where female_presenters / male_presenters > 0.70;

-- select Industry, sum(Number_of_Presenters), sum(Male_Presenters),  sum(Female_Presenters), round (sum(Female_Presenters) / sum(Male_Presenters) * 100, 2 ) as ratio
-- from data_for_sql.sharktank
-- group by Industry
-- having ratio > 70;

/* 3. You are working at marketing firm of Shark Tank India, you have got the task to determine 
volume of per season sale pitch made, 
pitches who received offer and pitches that were converted. 
Also show the percentage of pitches converted and percentage of pitches entertained. */

-- SELECT STR_TO_DATE(Season_Start, '%mm-%dd-%YYYY') AS Season_Start
-- FROM data_for_sql.sharktank;

select distinct(Received_Offer) from data_for_sql.sharktank;
select distinct(Accepted_Offer) from data_for_sql.sharktank;

SELECT sum(IF(Received_Offer = 'Yes', 1, 0))
FROM data_for_sql.sharktank;

SELECT sum(IF(Accepted_Offer = 'Yes', 1, 0))
FROM data_for_sql.sharktank;

select * , round((pitchers_accepted_offer / pitchers) * 100, 2) as perc_picther_converted,
round((pitchers_received_offer / pitchers) * 100, 2) as perc_picther_entertained
from
(
select Season_Number, count(Startup_Name) as pitchers , sum(IF(Received_Offer = 'Yes', 1, 0)) as pitchers_received_offer , 
sum(IF(Accepted_Offer = 'Yes', 1, 0)) as pitchers_accepted_offer
from data_for_sql.sharktank
group by Season_Number
)t;

select * from data_for_sql.sharktank;


