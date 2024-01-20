SELECT * FROM restaurant.products;

SELECT count(*) as 'appetizers' FROM products
WHERE category_id = 2 AND price > 8;
