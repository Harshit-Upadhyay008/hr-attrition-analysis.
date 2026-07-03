-- ============================================
-- Work-Life Balance & Tenure vs Attrition
-- Business Question: Do work-life balance and 
-- tenure predict attrition risk?
-- ============================================

-- Work Life Balance
SELECT 
    work_life_balance,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM hr_employee
GROUP BY work_life_balance
ORDER BY attrition_rate DESC;

-- Tenure Band
SELECT 
    CASE 
        WHEN years_at_company <= 2 THEN '0-2 years'
        WHEN years_at_company BETWEEN 3 AND 5 THEN '3-5 years'
        WHEN years_at_company BETWEEN 6 AND 10 THEN '6-10 years'
        ELSE '10+ years'
    END AS tenure_band,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM hr_employee
GROUP BY tenure_band
ORDER BY attrition_rate DESC;

-- Key Finding: 0-2 year employees have 29.82% attrition
-- Early career retention is the critical window