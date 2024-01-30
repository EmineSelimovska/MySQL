SELECT * FROM soft_uni.employees;


SELECT ep.employee_id, e.first_name,
IF(YEAR(p.start_date) >= 2005, NULL, p.name) as project_name
from employees e
JOIN employees_projects ep on ep.employee_id = e.employee_id
JOIN projects p on p.project_id = ep.project_id
WHERE ep.employee_id = 24
ORDER BY  p.name;