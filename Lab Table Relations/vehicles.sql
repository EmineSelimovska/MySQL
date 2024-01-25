SELECT * FROM camp.vehicles;

use camp;

SELECT driver_id, vehicle_type,
CONCAT(first_name, ' ', last_name) as driver_name 
FROM vehicles as v
JOIN campers as c
on v.driver_id = c.id;

