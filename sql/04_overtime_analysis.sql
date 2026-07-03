-- ============================================
-- Overtime vs Attrition
-- Business Question: Does overtime drive 
-- employee attrition?
-- ============================================

SELECT 
    over_time,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM hr_employee
GROUP BY over_time
ORDER BY attrition_rate DESC;

-- Key Finding: Overtime employees have 30.53% attrition
-- vs 10.44% for non-overtime = 3x higher risk
