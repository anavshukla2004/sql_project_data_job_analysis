select job_title_short  as title,
        job_location as location,
        job_posted_date::date as posting_date
from job_postings_fact
limit 5;

--timestamp with time zone
select job_title_short  as title,
        job_location as location,
        job_posted_date at time zone 'utc' at time zone 'est'as posting_date
from job_postings_fact
limit 5;

--extract 

select job_title_short  as title,
        job_location as location,
        job_posted_date at time zone 'utc' at time zone 'est'as posting_date,
        extract(month from job_posted_date) as month
from job_postings_fact
limit 5;