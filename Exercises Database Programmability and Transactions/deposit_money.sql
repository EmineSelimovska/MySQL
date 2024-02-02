SELECT * FROM soft_uni.accounts;


DELIMITER $ 
CREATE PROCEDURE usp_deposit_money(account_id INT, money_amount DECIMAL(10,4))
BEGIN 

START TRANSACTION;
	IF((SELECT COUNT(*) FROM accounts WHERE id = account_id) <> 1 or money_amount < 0) THEN
    ROLLBACK;
    ELSE 
    UPDATE accounts
    SET balance = balance + money_amount
    WHERE id = account_id;
     END IF;
     COMMIT;
END $


DELIMITER ;


call usp_deposit_money(1, 10);