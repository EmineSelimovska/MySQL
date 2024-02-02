SELECT * FROM soft_uni.accounts;


DELIMITER $
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(total_balance DECIMAL(19,4))
BEGIN 
	SELECT ac.first_name, ac.last_name FROM account_holders ac
	JOIN accounts a on  ac.id = a.account_holder_id
	GROUP BY ac.id
    HAVING SUM(a.balance) > total_balance
	ORDER BY ac.id;


END $

DELIMITER ;

call usp_get_holders_with_balance_higher_than(70000)