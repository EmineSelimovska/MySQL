SELECT * FROM soft_uni.employees;
use soft_uni;

SELECT first_name, last_name, salary
from employees
WHERE salary > 50000
ORDER BY salary DESC;

SELECT first_name, last_name
from employees
ORDER BY salary DESC
LIMIT 5;

SELECT first_name, last_name
from employees
WHERE department_id != 4;

SELECT *
from employees
ORDER BY salary desc,
first_name,middle_name ASC,
last_name DESC;





