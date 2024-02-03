SELECT * FROM universities_db.cities;

SELECT first_name, last_name, age, phone, email
from students
WHERE age >= 21
ORDER BY first_name DESC, email ASC, id ASC
LIMIT 10;