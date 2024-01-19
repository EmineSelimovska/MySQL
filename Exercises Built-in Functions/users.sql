SELECT * FROM diablo.users;


SELECT user_name,substring(email,locate('@',email) + 1) as 'email_provider'
from users
ORDER BY email_provider, user_name;
 