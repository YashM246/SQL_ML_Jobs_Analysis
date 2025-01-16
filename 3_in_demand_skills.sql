/*
Question: What are the most in-demand skills for my roles?
*/

SELECT 
    sd.skills,
    COUNT(sd.skill_id)
FROM 
    job_postings_fact AS jpf
    LEFT JOIN
    skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
    LEFT JOIN
    skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short IN ('Machine Learning Engineer', 'Data Analyst')
GROUP BY 
    sd.skills
ORDER BY
    COUNT(sd.skill_id) DESC
LIMIT 10

/* 

Results (AS CSV)

"skills","count"
"sql","96125"
"excel","67616"
"python","67011"
"tableau","46959"
"power bi","39725"
"r","31646"
"sas","28432"
"powerpoint","13951"
"word","13864"
"azure","13674"

*/