use soft_uni;

CREATE TABLE deleted_employees
	(
    employee_id INT AUTO_INCREMENT PRIMARY KEY, 
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	middle_name VARCHAR(50),
	job_title  VARCHAR(50),
	department_id INT,
	salary DOUBLE
    );

DELIMITER $
CREATE TRIGGER tr_delete_employees
AFTER DELETE
on employees
FOR EACH ROW
BEGIN
    INSERT INTO deleted_employees(first_name,
    last_name,middle_name,job_title,department_id,salary)
    VALUES(old.first_name, old.last_name,
    old.middle_name, old.job_title, old.department_id, old.salary);
END $

DELIMITER ;
