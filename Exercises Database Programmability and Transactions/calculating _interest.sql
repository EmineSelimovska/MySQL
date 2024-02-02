SELECT * FROM soft_uni.accounts;


DELIMITER $
CREATE FUNCTION ufn_calculate_future_value(total_sum DECIMAL(19,4), 
yearly DOUBLE, num_years INT) RETURNS decimal(19,4)
deterministic
BEGIN 
	DECLARE result DECIMAL(10,4);
    SET result := (total_sum * pow((1 + yearly), num_years));
    RETURN result;

END $

DELIMITER ;


DELIMITER $
CREATE PROCEDURE usp_calculate_future_value_for_account(id int, target_sum DECIMAL(10,4))
BEGIN 
	SELECT a.id as account_id, 
    ah.first_name, ah.last_name, 
    a.balance as current_balance,
    ufn_calculate_future_value(a.balance, target_sum, 5) as balance_in_5_years
    from account_holders ah
    join accounts a on ah.id = a.account_holder_id
    WHERE a.id = id;
END $

DELIMITER ;

SELECT ufn_calculate_future_value(1000, 0.5, 5);
call usp_calculate_future_value_for_account(1, 0.1)