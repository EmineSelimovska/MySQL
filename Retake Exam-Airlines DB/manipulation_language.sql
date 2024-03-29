SELECT * FROM airlines_db.airplanes;

INSERT INTO airplanes(model, passengers_capacity,
tank_capacity, cost)
SELECT 
concat(reverse(first_name),'797'),
char_length(last_name) * 17,
id * 790,
char_length(first_name) * 50.6
FROM 
passengers
WHERE id <= 5;


UPDATE flights f
RIGHT JOIN countries c on c.id = f.departure_country
SET airplane_id = airplane_id + 1 
WHERE c.name = 'Armenia';

DELETE FROM flights 
WHERE id NOT IN(SELECT flight_id FROM flights_passengers);
