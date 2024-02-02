
use soft_uni;

CREATE TABLE logs(
log_id INT AUTO_INCREMENT PRIMARY KEY, 
account_id INT, 
old_sum decimal(19,4), 
new_sum decimal(19,4)
);

DELIMITER $
CREATE TRIGGER tr_accounts
AFTER UPDATE
ON accounts
FOR EACH ROW
   BEGIN
   INSERT INTO logs(account_id, old_sum, new_sum)
   VALUES(old.id, old.balance, new.balance);
   
   END $


DELIMITER ;
