SELECT * FROM real_estate_db.property_offers;



INSERT INTO property_transactions(
property_id, buyer_id, transaction_date,
bank_name, iban,is_successful)
SELECT 
agent_id + day(offer_datetime),
agent_id + month(offer_datetime),
offer_datetime,
concat('Bank', ' ', agent_id),
concat('BG',price,agent_id),
1
from property_offers
WHERE agent_id <= 2;

UPDATE properties 
SET price = price - 50000
WHERE price >= 800000;


