SELECT * FROM airlines_db.airplanes;


SELECT id, model, passengers_capacity,
 tank_capacity, cost FROM airplanes
 ORDER BY cost DESC, id DESC;
 
SELECT flight_code, departure_country,
 airplane_id, departure FROM flights 
 WHERE year(departure) = 2022
 ORDER BY airplane_id, flight_code
 LIMIT 20;

SELECT CONCAT(UPPER(substr(p.last_name ,1,2)), p.country_id) as flight_code,
CONCAT(p.first_name,' ', p.last_name) as full_name,
p.country_id from passengers p 
WHERE p.id NOT IN (SELECT passenger_id from flights_passengers)
ORDER BY p.country_id;