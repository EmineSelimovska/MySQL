SELECT * FROM real_estate_db.property_offers;


SELECT substr(p.address, 1, 6) as agent_name, (char_length(p.address) * 5430) as price
 from properties p
 LEFT JOIN property_offers po ON p.id = po.property_id
 WHERE agent_id IS NULL
 ORDER BY agent_name DESC, price DESC;