/*
MySQL doesn't have a built-in PIVOT function, but you can simulate it using CASE + GROUP BY + aggregate functions.

product	month	sales
A	    Jan	    100
A	    Feb	    120
B	    Jan	    90
B	    Feb	    110

After Pivot

product	Jan	Feb
A	    100	120
B	    90	110

*/

select work_year, job_title, salary_in_usd from salary;

SELECT
    job_title,
    AVG(CASE WHEN work_year = 2020 THEN salary_in_usd ELSE 0 END) AS '2020',
    AVG(CASE WHEN work_year = 2021 THEN salary_in_usd ELSE 0 END) AS '2021',
    AVG(CASE WHEN work_year = 2022 THEN salary_in_usd ELSE 0 END) AS '2022',
    AVG(CASE WHEN work_year = 2023 THEN salary_in_usd ELSE 0 END) AS '2023',
    AVG(CASE WHEN work_year = 2024 THEN salary_in_usd ELSE 0 END) AS '2024'
FROM (select work_year, job_title, salary_in_usd from salary)s
GROUP BY job_title
order by job_title asc;

select distinct work_year from salary
where job_title = 'Business Intelligence'


