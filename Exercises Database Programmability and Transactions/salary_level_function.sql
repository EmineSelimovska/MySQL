SELECT * FROM soft_uni.employees;
use soft_uni;

DELIMITER $
    CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(10,4)) 
    RETURNS VARCHAR(40)
    READS SQL DATA
BEGIN
  
  DECLARE salary_level varchar(40);
   if(salary < 30000) then
   SET salary_level := 'Low';
   ELSEIF (salary >= 30000 AND salary <= 50000) then
   SET salary_level := 'Average';
   ELSEIF (salary > 50000) then 
   SET salary_level := 'High';
    END IF;
	RETURN salary_level;
END $




DELIMITER ;

DELIMITER $ 
CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(40))
BEGIN
     SELECT first_name, last_name FROM employees
     WHERE salary_level = ufn_get_salary_level(salary)
     ORDER BY first_name DESC, last_name DESC;

END $ 

DELIMITER ;

select ufn_get_salary_level(50000);
CALL usp_get_employees_by_salary_level('High')






