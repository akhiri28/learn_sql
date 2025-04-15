with salary_ct as
(
	select * from ds_job_salaries.ds_sal_2024
	where company_location in 
    (select company_location from
			
            (select company_location, count(distinct work_year) as 'num_of_years'
			from ds_job_salaries.ds_sal_2024
			where work_year >= year(current_date()) - 2
			group by company_location
			having num_of_years = 3 
			)t
	)
)
select company_location,
MAX(CASE WHEN work_year = 2022 THEN avg_salary END) as avg_sal_2022,
MAX(CASE WHEN work_year = 2023 THEN avg_salary END) as avg_sal_2023,
MAX(CASE WHEN work_year = 2024 THEN avg_salary END) as avg_sal_2024
from
(select company_location, work_year, avg(salary_in_usd) as 'avg_salary'
from salary_ct
group by company_location, work_year)q
group by company_location
having avg_sal_2024 > avg_sal_2023 and
avg_sal_2023 > avg_sal_2022 ;

-- For each experinece level from fully Remote work in 2021 and 2024 and find out the increase or decrease in percentages.

select experience_level,
MAX(CASE WHEN s.work_year= 2021 THEN s.per_emp_remote END) AS PER_EMP_REMOTE_2021,
MAX(CASE WHEN s.work_year= 2024 THEN s.per_emp_remote END) AS PER_EMP_REMOTE_2024

from

(
	select t.experience_level, t.remote_ratio, t.work_year, t.emp_count, q.total_emp, round((t.emp_count / q.total_emp) * 100, 2) as per_emp_remote from 
	
    (select experience_level, remote_ratio, work_year, count(*) as emp_count
	from ds_job_salaries.ds_sal_2024
	group by experience_level, remote_ratio, work_year)t

	left join

	(select experience_level, work_year, count(*) as total_emp
	from ds_job_salaries.ds_sal_2024
	group by experience_level, work_year)q

	on t.experience_level = q.experience_level
	and t.work_year = q.work_year
	where t.work_year in (2021, 2024)
	and t.remote_ratio = 100
    
)s
group by experience_level;


-- Average salary of experience level + role in the year 2023 and 2024 and find the increase or decrease in percentage.

