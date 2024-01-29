SELECT * FROM soft_uni.departments;

SELECT e.employee_id, e.first_name, e.last_name, d.name as department_name
FROM employees e
JOIN departments d on e.department_id = d.department_id
HAVING department_name = 'Sales'
ORDER BY employee_id DESC;
