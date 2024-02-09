SELECT * FROM restaurant_db.products;

-- 02 Insert

INSERT INTO products(name, type, price)
SELECT 
concat(last_name, ' ', "specialty"),
"Cocktail",
ceiling(salary * 0.01)
FROM waiters
WHERE id > 6;

-- 03 Update

UPDATE orders 
SET table_id = table_id - 1
WHERE id >= 12 AND id <= 23;

-- 04 Delete

DELETE FROM waiters 
WHERE id NOT IN(SELECT waiter_id FROM orders);



