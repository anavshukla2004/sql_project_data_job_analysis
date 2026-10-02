
## Introduction

Dive into the data analyst job market! This project explores top-paying Data Analyst roles, in-demand skills, and which skills are associated with higher salaries.

The goal is to use SQL to analyze real-world job posting data and identify patterns that can help understand the current Data Analyst job market.

**SQL queries:** Check them out here: [Project SQL](./project_sql/)

## Background

The Data Analyst job market contains a wide range of roles, salaries, and required technical skills.

This project focuses on answering questions such as:

- Which Data Analyst jobs have the highest salaries?
- What skills are required for the highest-paying jobs?
- Which skills are most in demand?
- Which skills are associated with higher average salaries?
- Which skills provide a strong combination of demand and salary?

## Tools I Used

- **SQL** – Data analysis and querying
- **PostgreSQL** – Database management and analysis
- **pgAdmin** – Database administration
- **VS Code** – SQL development and project management
- **Git & GitHub** – Version control and project sharing

## The Analysis

### Top-Paying Data Analyst Jobs

The first analysis identifies the top 10 Data Analyst jobs by annual salary for jobs listed as fully remote.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;

### Skills Required for Top-Paying Jobs

The second analysis connects the highest-paying jobs with the skills required for those positions.

### Most In-Demand Skills

The third analysis identifies the most frequently requested skills in remote Data Analyst job postings.

### Highest-Paying Skills

The fourth analysis calculates the average salary associated with different skills in remote Data Analyst positions.

### Optimal Skills

The final analysis combines skill demand with average salary to identify skills that have both strong demand and higher salary associations.

## What I Learned

Through this project, I strengthened my understanding of:

- SQL joins
- Common Table Expressions (CTEs)
- Aggregation and grouping
- `COUNT()` and `AVG()`
- `WHERE` and `HAVING`
- Sorting and filtering
- Relational database design
- Primary and foreign keys
- Composite primary keys
- SQL query optimization using indexes
- Analyzing real-world job-market data

## Conclusions

This project demonstrates how SQL can be used to turn raw job-posting data into useful insights about the Data Analyst career market.

The analysis connects **job demand, salary, and technical skills** to provide a data-driven view of the skills that appear across Data Analyst opportunities.

The project also helped me develop practical SQL skills that can be applied to real-world data analysis problems.

---
**Author:** Anav Shukla

[GitHub](https://github.com/anavshukla2004)
