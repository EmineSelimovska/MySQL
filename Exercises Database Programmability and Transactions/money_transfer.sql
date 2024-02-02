SELECT * FROM soft_uni.accounts;


DELIMITER $ 
CREATE PROCEDURE usp_transfer_money(account_id int, to_account_id INT, 
money_amount DECIMAL(19,4))
BEGIN 

START TRANSACTION;
	IF((SELECT COUNT(*) FROM accounts WHERE id = account_id) <> 1 or
    (SELECT COUNT(*) FROM accounts WHERE id = to_account_id) <> 1 or
    account_id = to_account_id or
    ((SELECT balance FROM accounts WHERE id = account_id) < money_amount) or
    money_amount < 0) THEN
    ROLLBACK;
    ELSE 
    UPDATE accounts
    SET balance = balance - money_amount
    WHERE id = account_id;
	UPDATE accounts
    SET balance = balance + money_amount
    WHERE id = to_account_id;
     COMMIT;
         END IF;
END $
DELIMITER ;

call usp_transfer_money(1, 2, 20)