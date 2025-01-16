/*
Question: What are the top skills based on salary?
*/

SELECT
    sd.skills AS Skill,
    ROUND(AVG(jpf.salary_year_avg),2) AS Average_Yearly_Pay
FROM 
    job_postings_fact AS jpf
    LEFT JOIN
    skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
    LEFT JOIN
    skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.salary_year_avg IS NOT NULL
    AND
    jpf.job_title_short IN ('Data Analyst', 'Machine Learning Engineer')
GROUP BY 
    sd.skills
ORDER BY
    Average_Yearly_Pay DESC
LIMIT 20


/*

Results (AS CSV)

"skill","average_yearly_pay"
"svn","400000.00"
"haskell","213000.00"
"kotlin","184500.00"
"solidity","179000.00"
"clojure","166000.00"
"golang","163135.71"
"couchbase","160515.00"
"dplyr","147633.33"
"vmware","147500.00"
"twilio","138500.00"
"redis","137745.82"
"hugging face","135190.57"
"pytorch","132689.57"
"scala","132437.71"
"rust","132416.13"
"tensorflow","132357.08"
"ansible","131946.13"
"fastapi","131222.38"
"mxnet","131036.00"
"kafka","130935.05"

*/