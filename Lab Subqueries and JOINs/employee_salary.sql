SELECT * FROM soft_uni.employees;

SELECT employee_id, 
first_name, 
last_name, 
department_id,
salary
from employees
WHERE manager_id IS NULL;

