/* 
Question: What are the top-paying Machine Learning Jobs?
- Identify the top 20 highest paying ML roles that are available.
- Focus on job postings with specified salaries (remove nulls).
- To highlight the top-paying opportunities, offering insights into employment
*/

SELECT 
    cd.name AS Company_Name,
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

/* 

Results (As CSV)

"company_name","job_title","yearly_salary","country"
"Mantys","Data Analyst","650000.0","India"
"ЛАНИТ","Data base administrator","400000.0","Belarus"
"Torc Robotics","Director of Safety Data Analysis","375000.0","United States"
"Citigroup, Inc","Head of Infrastructure Management & Data Analytics - Financial...","375000.0","United States"
"Illuminate Mission Solutions","HC Data Analyst , Senior","375000.0","United States"
"Illuminate Mission Solutions","Sr Data Analyst","375000.0","United States"
"Anthropic","Data Analyst","350000.0","United States"
"Care.com","Head of Data Analytics","350000.0","United States"
"Meta","Director of Analytics","336500.0","United States"
"OpenAI","Research Scientist","285000.0","United States"
"AT&T","Associate Director- Data Insights","255829.5","United States"
"Google","Partner Technology Manager, Data Analytics and AI","254000.0","United States"
"Channel Personnel Services","Director Analytics","245000.0","United States"
"Anthropic","Data Analyst","240000.0","United States"
"Coda Search│Staffing","Data Sector Analyst - Hedge Fund in Midtown","240000.0","United States"
"TikTok","Investigations and Insights Lead Data Analyst - USDS","239777.5","United States"
"TikTok","Investigations and Insights Lead Data Analyst - USDS","239777.5","United States"
"Asana","Data & Intelligence Manager, Finance","235000.0","United States"
"Walmart Global Tech","Principal, Data Analyst","234000.0","United States"
"Pinterest Job Advertisements","Data Analyst, Marketing","232423.0","United States"

*/

/*

Results (AS CSV)

"company_name","job_title","yearly_salary","country"
"Mantys","Data Analyst","650000.0","India"
"ЛАНИТ","Data base administrator","400000.0","Belarus"
"Torc Robotics","Director of Safety Data Analysis","375000.0","United States"
"Citigroup, Inc","Head of Infrastructure Management & Data Analytics - Financial...","375000.0","United States"
"Illuminate Mission Solutions","HC Data Analyst , Senior","375000.0","United States"
"Illuminate Mission Solutions","Sr Data Analyst","375000.0","United States"
"Anthropic","Data Analyst","350000.0","United States"
"Care.com","Head of Data Analytics","350000.0","United States"
"Meta","Director of Analytics","336500.0","United States"
"OpenAI","Research Scientist","285000.0","United States"
"AT&T","Associate Director- Data Insights","255829.5","United States"
"Google","Partner Technology Manager, Data Analytics and AI","254000.0","United States"
"Channel Personnel Services","Director Analytics","245000.0","United States"
"Anthropic","Data Analyst","240000.0","United States"
"Coda Search│Staffing","Data Sector Analyst - Hedge Fund in Midtown","240000.0","United States"
"TikTok","Investigations and Insights Lead Data Analyst - USDS","239777.5","United States"
"TikTok","Investigations and Insights Lead Data Analyst - USDS","239777.5","United States"
"Asana","Data & Intelligence Manager, Finance","235000.0","United States"
"Walmart Global Tech","Principal, Data Analyst","234000.0","United States"
"Pinterest Job Advertisements","Data Analyst, Marketing","232423.0","United States"

*/