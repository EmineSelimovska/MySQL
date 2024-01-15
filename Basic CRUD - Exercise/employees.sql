SELECT * FROM soft_uni.employees;

SELECT first_name, last_name,salary
FROM employees
ORDER BY employee_id;

SELECT first_name, middle_name,last_name
FROM employees
ORDER BY employee_id;

SELECT concat(first_name,'.',last_name,'@softuni.bg') as full_email_address
FROM employees;

SELECT DISTINCT salary FROM employees;

SELECT *
FROM employees 
WHERE job_title = "Sales Representative"
ORDER BY employee_id;

SELECT first_name, last_name,job_title
FROM employees
WHERE salary between 20000 AND 30000
ORDER BY employee_id;

SELECT concat(first_name,' ',middle_name, ' ',last_name) as 'Full Name'
FROM employees
WHERE salary = 25000 || salary = 14000 || salary = 12500 || salary = 23600;

SELECT first_name, last_name 
FROM employees
WHERE manager_id is Null;

