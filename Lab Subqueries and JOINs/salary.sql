SELECT * FROM soft_uni.employees;

SELECT COUNT(*) as count 
FROM employees 
WHERE salary > ( 
SELECT AVG(salary) from employees
);