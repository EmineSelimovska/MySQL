SELECT * FROM soft_uni.employees;


SELECT e.first_name,e.last_name, e.hire_date, d.name
FROM employees e 
JOIN departments d on d.department_id = e.department_id
WHERE DATE(e.hire_date) > '1999-01-01'
AND d.name = 'Sales' or d.name = 'Finance'
ORDER BY e.hire_date;