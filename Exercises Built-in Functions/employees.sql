SELECT * FROM soft_uni.employees;

use soft_uni;

SELECT first_name, last_name 
FROM employees 
WHERE first_name LIKE 'Sa%'
ORDER BY employee_id;

SELECT first_name, last_name 
FROM employees 
WHERE last_name LIKE '%ei%'
ORDER BY employee_id;

SELECT first_name
FROM employees 
WHERE (department_id = 3 or department_id = 10) AND
YEAR(hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id;

SELECT first_name, last_name 
FROM employees 
WHERE NOT (job_title LIKE '%engineer%')
ORDER BY employee_id;