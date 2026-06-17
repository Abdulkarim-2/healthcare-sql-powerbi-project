SELECT
    d.department_name,
    COUNT(v.visit_id) AS total_visits,
    ROUND(AVG(v.cost), 2) AS avg_cost,
    ROUND(SUM(v.cost), 2) AS total_cost,
    CASE
        WHEN AVG(v.cost) >= 4000 THEN 'High Cost Department'
        WHEN AVG(v.cost) >= 2500 THEN 'Medium Cost Department'
        ELSE 'Low Cost Department'
    END AS cost_category
FROM visits v
JOIN departments d
    ON v.department_id = d.department_id
GROUP BY d.department_name
HAVING COUNT(v.visit_id) >= 30
ORDER BY avg_cost DESC;