SELECT * FROM airlines_db.airplanes;


SELECT id, model, passengers_capacity,
 tank_capacity, cost FROM airplanes
 ORDER BY cost DESC, id DESC;
 
SELECT flight_code, departure_country,
 airplane_id, departure FROM flights 
 WHERE year(departure) = 2022
 ORDER BY airplane_id, flight_code
 LIMIT 20;
