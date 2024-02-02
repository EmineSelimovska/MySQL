SELECT * FROM soft_uni.accounts;

DELIMITER $ 
CREATE PROCEDURE usp_withdraw_money(account_id INT, money_amount DECIMAL(19,4))
BEGIN 

START TRANSACTION;
	IF((SELECT COUNT(*) FROM accounts WHERE id = account_id) <> 1 or
    ((SELECT balance FROM accounts WHERE id = account_id) < money_amount) or
    money_amount < 0) THEN
    ROLLBACK;
    ELSE 
    UPDATE accounts
    SET balance = balance - money_amount
    WHERE id = account_id;
 
     COMMIT;
         END IF;
END $


DELIMITER ;

call usp_withdraw_money(1,10)