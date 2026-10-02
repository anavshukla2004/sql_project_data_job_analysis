with skills_demand as(
select 
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
    job_title_short='Data Analyst' AND
    salary_year_avg is not NULL AND
    job_work_from_home=True 
group by 
    skills_dim.skill_id
), average_salary as(
select 
    skills_job_dim.skill_id,
    round(avg(salary_year_avg), 0) as average_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
    job_title_short='Data Analyst' AND
    salary_year_avg is not NULL AND
    job_work_from_home=True
group by 
    skills_job_dim.skill_id
)

select
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
from 
    skills_demand
inner join average_salary on skills_demand.skill_id = average_salary.skill_id
where 
    demand_count > 10
order BY
    average_salary desc,
    demand_count desc
limit 25;


--rewrting this query to make it more concise
select
    skills_dim.skill_id,
    skills_dim. skills,
    COUNT(skills_job_dim. job_id) AS demand_count,
    ROUND(AVG( job_postings_fact. salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact. job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim. skill_id = skills_dim. skill_id
WHERE
job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
AND job_work_from_home = True
GROUP BY
skills_dim. skill_id
HAVING
COUNT(skills_job_dim. job_id) > 10
ORDER BY
avg_salary DESC,
demand_count DESC
limit 25;