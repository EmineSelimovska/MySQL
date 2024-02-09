SELECT * FROM restaurant_db.clients;

--  05 Clients

SELECT id, first_name, last_name, 
birthdate, card, review FROM clients
ORDER BY birthdate DESC, id DESC;
