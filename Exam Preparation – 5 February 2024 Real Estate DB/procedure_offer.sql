SELECT * FROM real_estate_db.cities;

DELIMITER $ 
CREATE PROCEDURE udp_special_offer(first_name VARCHAR(50))
BEGIN
update property_offers po
JOIN agents a on a.id = po.agent_id
set  price = price * 0.9
where a.first_name = first_name;
END $



DELIMITER ;


CALL udp_special_offer('Hans');
