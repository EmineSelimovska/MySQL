SELECT * FROM soft_uni.employees;

SELECT ep.employee_id, e.first_name, p.name 
from employees e
JOIN employees_projects ep on ep.employee_id = e.employee_id
JOIN projects p on p.project_id = ep.project_id
WHERE DATE(p.start_date) > '2002-08-13' and p.end_date IS NULL
ORDER BY e.first_name, p.name 
LIMIT 5;