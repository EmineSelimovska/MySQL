SELECT * FROM soft_uni.employees;

SELECT e.employee_id, CONCAT(e.first_name,' ',e.last_name) as employee_name,
 CONCAT(m.first_name,' ',m.last_name) as manager_name, d.name as department_name
from employees e
JOIN employees m on  e.manager_id = m.employee_id
JOIN departments d on d.department_id = e.department_id
order by employee_id
LIMIT 5;