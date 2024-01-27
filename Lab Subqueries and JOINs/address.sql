SELECT * FROM soft_uni.addresses;

SELECT a.town_id, 
t.name as town_name, 
a.address_text
FROM addresses a
JOIN towns t on t.town_id = a.town_id 
AND t.name IN('San Francisco', 'Sofia','Carnation')
order by town_id, address_id;
