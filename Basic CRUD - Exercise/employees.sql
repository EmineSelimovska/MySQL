SELECT * FROM soft_uni.employees;

SELECT first_name, last_name,salary
FROM employees
ORDER BY employee_id;

SELECT first_name, middle_name,last_name
FROM employees
ORDER BY employee_id;

SELECT concat(first_name,'.',last_name,'@softuni.bg') as full_email_address
FROM employees;