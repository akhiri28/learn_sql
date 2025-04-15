set @total = (select count(*) from ds_job_salaries.ds_sal_2024);

select remote_ratio, count(*) as remote_count, round ( count(*) / (select @total) * 100, 2) as remote_perc from ds_job_salaries.ds_sal_2024
where salary_in_usd > 100000
group by remote_ratio;

select * from ds_job_salaries.ds_sal_2024;

set @overall_avg_sal = (select avg(salary_in_usd) from ds_job_salaries.ds_sal_2024);

select t.job_title, t.en_avg_salary, s.avg_salary 
from
(select company_location, job_title, round(avg(salary_in_usd), 2) as en_avg_salary from ds_job_salaries.ds_sal_2024 
where experience_level = 'EN'
group by company_location, job_title) t 
INNER JOIN
(select company_location, job_title, round(avg(salary_in_usd), 2) as avg_salary from ds_job_salaries.ds_sal_2024 
group by company_location, job_title) s
ON t.job_title = s.job_title
where t.en_avg_salary > s.avg_salary;

(select @overall_avg_sal);

(select company_location, round(avg(salary_in_usd), 2) as avg_salary from ds_job_salaries.ds_sal_2024 where experience_level = 'EN'
group by company_location);


/* for each job title which country pays max average salary */
select t.job_title, s.company_location, t.max_salary from
(select job_title, round(max(salary_in_usd), 2) as 'max_salary'
from ds_job_salaries.ds_sal_2024
group by job_title)t
left join
(select job_title, company_location, salary_in_usd from ds_job_salaries.ds_sal_2024) s
on t.job_title = s.job_title
where t.max_salary = s.salary_in_usd
order by 1;


select t.job_title, t.company_location, max(avg_salary) as 'max_avg_salary' from 
(select job_title, company_location,  round(avg(salary_in_usd), 2) as 'avg_salary'
from ds_job_salaries.ds_sal_2024
group by job_title, company_location) t
group by t.job_title, t.company_location
order by 1;

select * from
(select * , dense_rank() over (partition by job_title order by avg_salary desc) as avg_sal_rank
from 
(select job_title, company_location,  round(avg(salary_in_usd), 2) as 'avg_salary'
from ds_job_salaries.ds_sal_2024
group by job_title, company_location) t)s
where s.avg_sal_rank = 1
order by 1;


