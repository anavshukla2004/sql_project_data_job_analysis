--
select* 
from (SELECT*
from job_postings_fact
where extract(month from job_posted_date) = 1)  as january_jobs