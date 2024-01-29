SELECT * FROM soft_uni.employees;

SELECT e.employee_id, e.first_name,e.salary,d.name as department_name
FROM employees e
JOIN departments d on d.department_id = e.department_id
WHERE e.salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;