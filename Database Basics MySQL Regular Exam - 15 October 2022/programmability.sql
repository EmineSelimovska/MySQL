SELECT * FROM restaurant_db.products;

-- 10. Extract bill

DELIMITER $ 
CREATE FUNCTION udf_client_bill(full_name VARCHAR(50)) 
RETURNS DECIMAL(19,2)
DETERMINISTIC
BEGIN
    DECLARE bill DECIMAL(19,2);
    SET bill := (
    SELECT SUM(p.price) FROM clients c
    JOIN orders_clients oc ON c.id = oc.client_id
    JOIN orders_products op ON oc.order_id = op.order_id
    JOIN products p ON op.product_id = p.id
    WHERE concat(c.first_name, ' ', last_name) = full_name
     GROUP BY c.first_name, c.last_name
    
    );
    
    RETURN bill;

END $


DELIMITER ;

SELECT udf_client_bill('Silvio Blyth');

-- 11. Happy hour

DELIMITER $ 
CREATE PROCEDURE udp_happy_hour (type_name VARCHAR(50))
BEGIN
UPDATE products 
SET price = price - (price * 0.2)
WHERE price >= 10.00 and type = type_name;
END $


DELIMITER ;
    
    CALL udp_happy_hour ('Cognac');