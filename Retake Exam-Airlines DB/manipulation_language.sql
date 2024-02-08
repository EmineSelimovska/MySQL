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