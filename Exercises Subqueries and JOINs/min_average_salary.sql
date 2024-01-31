SELECT * FROM soft_uni.employees;

SELECT 
    MIN(avg) AS min_average_salary
FROM
    (SELECT 
        AVG(salary) AS avg
    FROM
        employees
    GROUP BY department_id) as lower_avg