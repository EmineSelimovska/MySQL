SELECT * FROM real_estate_db.property_transactions;

SELECT bank_name, COUNT(*) as count 
FROM property_transactions 
GROUP BY bank_name
HAVING count >= 9
ORDER BY count DESC , bank_name ASC;


SELECT address, area,
case
  when area <= 100 then 'small'
  when area <= 200 then 'medium'
  when area <= 500 then 'large'
  when area > 500 then 'extra large'
end as size
from
properties
ORDER BY area ASC, address DESC;



