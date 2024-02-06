use real_estate_db;

DELIMITER $ 
CREATE FUNCTION udf_offers_from_city_name (cityName VARCHAR(50))
RETURNS INT 
DETERMINISTIC
BEGIN
 DECLARE offers_count int;
   SET offers_count := (
   SELECT COUNT(*) FROM property_offers po
   JOIN properties p on p.id = po.property_id
   JOIN cities c ON p.city_id = c.id
   where c.name = cityName
   group by c.name
   );
   RETURN offers_count;

END $



DELIMITER ;



