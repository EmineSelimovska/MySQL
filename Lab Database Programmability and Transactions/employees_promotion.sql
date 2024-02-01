SELECT * FROM soft_uni.employees;
use soft_uni;
DELIMITER $

CREATE PROCEDURE usp_raise_salaries(department_name VARCHAR(50)) 
BEGIN
	UPDATE employees e
     JOIN departments d 
     on e.department_id = d.department_id
     SET e.salary = e.salary * 1.05 
     WHERE d.name = department_name;
END $

DELIMITER ;

select first_name, salary from employees
order by first_name, salary;

CALL usp_raise_salaries("Finance");

