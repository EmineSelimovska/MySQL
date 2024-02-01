SELECT * FROM soft_uni.employees;

DELIMITER $ 
CREATE PROCEDURE usp_raise_salary_by_id(id INT)
 BEGIN
   START TRANSACTION;
   IF((SELECT COUNT(*) FROM employees 
     WHERE employee_id = id) <> 1) THEN 
     ROLLBACK;
   ELSE 
     UPDATE employees  
     set salary = salary * 1.05 
     where employee_id = id;
   END IF;
    COMMIT;
 END $
  
 DELIMITER ;
 
 call usp_raise_salary_by_id(17);
 
 SELECT * FROM employees 
 where employee_id = 17
 