SELECT * FROM restaurant_db.clients;

--  05 Clients

SELECT id, first_name, last_name, 
birthdate, card, review FROM clients
ORDER BY birthdate DESC, id DESC;

-- 06 Birthdate

SELECT first_name, last_name, birthdate, review 
FROM clients
WHERE card IS NULL AND (YEAR(birthdate) BETWEEN 1978 AND 1993)
ORDER BY last_name DESC, id ASC
LIMIT 5;
