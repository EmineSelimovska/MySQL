
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




CREATE TABLE notification_emails(
 id INT AUTO_INCREMENT PRIMARY KEY,
 recipient int not null,
 subject VARCHAR(2000),
 body text 
)

DELIMITER $
CREATE TRIGGER tr_emails
AFTER INSERT
ON logs
FOR EACH ROW
   BEGIN
   INSERT INTO notification_emails(recipient, subject, body) VALUES
   (new.account_id, 
   concat('Balance change for account: ', new.account_id),
   concat('On ',date_format(NOW(), ' %b %m %Y at %r'),' your balance was changed from ',
   ROUND(new.old_sum, 0),' to ', ROUND(new.new_sum, 0),'.'));
   
   END $


DELIMITER ;

select * from notification_emails;
SELECT date_format(NOW(), ' %b %m %Y at %r');
