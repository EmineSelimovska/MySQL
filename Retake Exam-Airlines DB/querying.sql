SELECT * FROM airlines_db.airplanes;

-- 05 
SELECT id, model, passengers_capacity,
 tank_capacity, cost FROM airplanes
 ORDER BY cost DESC, id DESC;
 
 -- 06
 
SELECT flight_code, departure_country,
 airplane_id, departure FROM flights 
 WHERE year(departure) = 2022
 ORDER BY airplane_id, flight_code
 LIMIT 20;

-- 07

SELECT CONCAT(UPPER(substr(p.last_name ,1,2)), p.country_id) as flight_code,
CONCAT(p.first_name,' ', p.last_name) as full_name,
p.country_id from passengers p 
WHERE p.id NOT IN (SELECT passenger_id from flights_passengers)
ORDER BY p.country_id;

-- 10 
 
 DELIMITER $
 CREATE FUNCTION udf_count_flights_from_country(country VARCHAR(50)) 
 RETURNS INT
 DETERMINISTIC
 BEGIN
 DECLARE flights_count INT;
 SET flights_count := (
 SELECT COUNT(departure_country) FROM flights f
 JOIN  countries c on c.id = f.departure_country
 where c.name = country
 GROUP BY c.name
 );
 RETURN flights_count;
 
 END $
 DELIMITER ;
 
 SELECT udf_count_flights_from_country('Brazil');
 SELECT udf_count_flights_from_country('Philippines')
 
 
 -- 11 
 
 




