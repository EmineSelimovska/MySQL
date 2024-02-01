SELECT * FROM soft_uni.towns;
use soft_uni;

DELIMITER $

CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20)) RETURNS INT
DETERMINISTIC
BEGIN
   DECLARE count  INT;
   SET count := (SELECT COUNT(employee_id) FROM employees e 
   JOIN addresses a on a.address_id = e.address_id
   JOIN towns t on t.town_id = a.town_id
   WHERE t.name = town_name);
   RETURN count;
END $

DELIMITER ;

SELECT ufn_count_employees_by_town();
