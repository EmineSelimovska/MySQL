SELECT * FROM real_estate_db.property_transactions;

SELECT bank_name, COUNT(*) as count 
FROM property_transactions 
GROUP BY bank_name
HAVING count >= 9
ORDER BY count DESC , bank_name ASC;