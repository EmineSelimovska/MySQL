SELECT * FROM restaurant.employees;

SELECT department_id, COUNT(department_id) as 'Number of employees'
from employees
GROUP BY department_id;

SELECT department_id, ROUND(AVG(salary), 2) as 'Average Salary'
from employees
GROUP BY department_id;

SELECT department_id, ROUND(MIN(salary), 2) as 'Min Salary'
from employees
GROUP BY department_id
HAVING `Min Salary` > 800;