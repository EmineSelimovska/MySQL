SELECT * FROM soft_uni.employees;

CREATE VIEW v_employees_hired_after_2000 as
select first_name, last_name from employees
where YEAR(hire_date) > 2000;

SELECT first_name, last_name FROM v_employees_hired_after_2000;


SELECT first_name, last_name FROM employees
WHERE length(last_name) = 5;
