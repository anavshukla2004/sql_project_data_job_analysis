select job_title_short, job_location,company_id
from january_jobs
union
select job_title_short, job_location,company_id
from february_jobs
union
select job_title_short, job_location,company_id
from march_jobs;
