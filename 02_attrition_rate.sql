-- ============================================
-- Overall Attrition Rate
-- Business Question: What is the company's 
-- overall attrition rate?
-- ============================================

SELECT 
    attrition,
    COUNT(*) AS count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM hr_employee
GROUP BY attrition;

-- Result: 16.12% attrition rate (above 10-15% industry benchmark)