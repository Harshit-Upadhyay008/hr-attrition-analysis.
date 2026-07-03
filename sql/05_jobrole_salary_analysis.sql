-- ============================================
-- Salary Band vs Attrition
-- Business Question: Does compensation level 
-- affect employee retention?
-- ============================================

SELECT 
    CASE 
        WHEN monthly_income < 3000 THEN 'Low (<3K)'
        WHEN monthly_income BETWEEN 3000 AND 6000 THEN 'Medium (3K-6K)'
        WHEN monthly_income BETWEEN 6001 AND 10000 THEN 'High (6K-10K)'
        ELSE 'Very High (>10K)'
    END AS salary_band,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM hr_employee
GROUP BY salary_band
ORDER BY attrition_rate DESC;

-- Key Finding: Low earners (<3K) have 28.61% attrition
-- vs 8.90% for high earners = compensation is key retention lever
