SELECT * FROM soft_uni.employees;

SELECT first_name, last_name, hire_date FROM 
employees
ORDER BY hire_date DESC
limit 7;

select department_id from departments
where name in('Engineering', 'Tool Design','Marketing', 'Information Services');


UPDATE employees 
SET salary = salary * 1.12 
WHERE department_id IN(1, 2, 4, 11);

SELECT salary FROM employees;



