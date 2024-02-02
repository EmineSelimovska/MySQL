SELECT * FROM soft_uni.employees;


DELIMITER $
CREATE PROCEDURE usp_get_towns_starting_with(symbol varchar(50))

BEGIN
    SELECT name from towns
    WHERE name LIKE CONCAT(symbol, '%')
    order by name;
END $

DELIMITER ;

call usp_get_towns_starting_with('b')