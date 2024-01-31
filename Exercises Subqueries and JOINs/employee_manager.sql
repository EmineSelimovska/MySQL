SELECT * FROM soft_uni.employees;

SELECT e.employee_id, e.first_name, e.manager_id, m.first_name as manager_name
from employees e
JOIN employees m on  e.manager_id = m.employee_id
WHERE e.manager_id IN (3, 7)
order by first_name;
