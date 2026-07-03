-- ============================================
-- Attrition by Department & Job Role
-- Business Question: Which departments and 
-- roles have the highest attrition risk?
-- ============================================

-- By Department
SELECT 
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM hr_employee
GROUP BY department
ORDER BY attrition_rate DESC;

-- By Job Role
SELECT 
    job_role,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM hr_employee
GROUP BY job_role
ORDER BY attrition_rate DESC;

-- Key Finding: Sales (20.63%) highest risk department
-- Sales Representatives at 39.76% attrition rate
