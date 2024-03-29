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


SELECT 
    COUNT(*) as count
FROM
    employees
    WHERE manager_id IS NULL;
    
    SELECT department_id, SUM(salary) as total_salary 
    FROM employees
    GROUP BY department_id
    ORDER BY department_id;
    
SELECT 
    department_id,
    (SELECT DISTINCT
            salary
        FROM
            employees
        WHERE
            e.department_id = department_id
        ORDER BY salary DESC
        LIMIT 1 OFFSET 2) as third_higest_salary
FROM
    employees e
GROUP BY department_id
HAVING third_higest_salary IS NOT NULL
ORDER BY department_id;

SELECT first_name, last_name, department_id
FROM employees e
where salary > ( SELECT AVG(salary)
from employees 
where department_id = e.department_id
)
ORDER BY department_id, employee_id
limit 10

    