SELECT * FROM soft_uni.employees;

use soft_uni;

SELECT department_id , Min(salary) as minimum_salary
FROM employees
WHERE department_id IN (2, 5, 7) AND hire_date > '2000-01-01'
GROUP BY department_id
ORDER BY department_id ASC;

CREATE TABLE new_empoyees 
select * from employees 
where salary > 30000; 

DELETE from new_empoyees
where manager_id = 42;

UPDATE new_empoyees SET salary = salary + 5000
where department_id = 1;

SELECT department_id, AVG(salary) as avg_salary FROM new_empoyees
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, MAX(salary) as max_salary
FROM employees
GROUP BY department_id
HAVING max_salary NOT BETWEEN 30000 AND 70000
ORDER BY department_id;