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

-- 07. Accounts

SELECT CONCAT(last_name,first_name,CHAR_LENGTH(first_name),"Restaurant") as username,
REVERSE(SUBSTR(email, 2,12)) as password from waiters 
WHERE salary IS NOT NULL
ORDER BY password DESC;

-- 08. Top from menu

SELECT p.id, p.name, COUNT(op.order_id) as count  FROM products p
JOIN orders_products op on p.id = op.product_id
GROUP BY  name
HAVING count >= 5
ORDER BY count DESC, name ASC;

-- 09. Availability

SELECT o.table_id, t.capacity, COUNT(oc.client_id) as count_clients,
 CASE 
 WHEN t.capacity > COUNT(oc.client_id) THEN "Free seats"
 WHEN t.capacity = COUNT(oc.client_id) THEN "Full"
 WHEN t.capacity < COUNT(oc.client_id) THEN "Extra seats"
 END AS availability
 from orders o
JOIN orders_clients oc ON o.id = oc.order_id
JOIN tables t ON t.id = o.table_id
WHERE t.floor = 1
GROUP BY o.table_id
ORDER BY o.table_id DESC;



