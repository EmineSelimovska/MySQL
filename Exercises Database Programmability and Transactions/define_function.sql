SELECT * FROM soft_uni.employees;


DELIMITER $
    CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
    RETURNS VARCHAR(40)
    READS SQL DATA
BEGIN
  
  DECLARE result varchar(40);
  IF(word REGEXP CONCAT('^[', set_of_letters, ']+$') ) THEN
  SET result := 1;
  else 
  SET result:= 0;
  END IF;
	RETURN result;
END $

DELIMITER ;


SELECT ufn_is_word_comprised('pppp', 'Sofia')