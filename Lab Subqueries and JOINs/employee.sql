SELECT * FROM soft_uni.employees;

use soft_uni;

SELECT e.employee_id ,
concat(first_name, ' ', last_name) as full_name,
d.department_id,
d.name as department_name
from employees e
JOIN departments d on d.manager_id = e.employee_id
ORDER BY employee_id
LIMIT 5;
