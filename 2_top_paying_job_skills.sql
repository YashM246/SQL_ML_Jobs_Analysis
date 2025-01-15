/*
Question: What are the skills required for these top paying roles?
- Using the top 10 highest-paying jobs from the first query,
- Find specific skills required for these jobs
- Provides a more detailed look at which high-paying jobs demand certain skills
*/

WITH Top_Jobs AS (
    SELECT 
        cd.name AS Company_Name,
        jpf.job_id AS Job_id,
        jpf.job_title AS Job_Title,
        jpf.salary_year_avg AS Yearly_Salary,
        jpf.job_country AS Country
    FROM 
        job_postings_fact AS jpf
        LEFT JOIN
        company_dim AS cd
        ON jpf.company_id = cd.company_id
    WHERE 
        job_title_short IN ('Machine Learning', 'Data Analyst')
        AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 20
)

SELECT 
    sd.skill_id,
    sd.skills,
    COUNT(tj.job_id) AS Occurence
FROM
    Top_Jobs AS tj
    LEFT JOIN
    skills_job_dim AS sjd 
    ON tj.job_id = sjd.job_id
    LEFT JOIN
    skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE
    sd.skill_id IS NOT NULL
GROUP BY
    sd.skill_id
ORDER BY
    Occurence DESC


/* 

Results (AS CSV)

"skill_id","skills","occurence"
1,"python","11"
0,"sql","11"
5,"r","8"
182,"tableau","6"
181,"excel","5"
183,"power bi","4"
92,"spark","2"
186,"sas","2"
93,"pandas","2"
141,"express","2"
7,"sas","2"
79,"oracle","2"
80,"snowflake","2"
98,"kafka","1"
102,"jupyter","1"
108,"matplotlib","1"
169,"linux","1"
185,"looker","1"
188,"word","1"
196,"powerpoint","1"
210,"git","1"
216,"github","1"
224,"svn","1"
237,"asana","1"
2,"nosql","1"
3,"scala","1"
15,"matlab","1"
22,"vba","1"
74,"azure","1"
75,"databricks","1"
76,"aws","1"
77,"bigquery","1"
81,"gcp","1"
95,"pyspark","1"
96,"airflow","1"
97,"hadoop","1"

*/

