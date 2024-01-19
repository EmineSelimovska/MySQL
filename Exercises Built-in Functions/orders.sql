SELECT * FROM diablo.orders;

SELECT product_name, order_date, 
DATE_ADD(order_date, INTERVAL 3 DAY) as 'pay_due',
DATE_ADD(order_date, INTERVAL 1 MONTH) as 'deliver_due'
FROM orders;