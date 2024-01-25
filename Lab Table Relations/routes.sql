SELECT * FROM camp.routes;

SELECT starting_point as route_starting_point,
end_point as route_ending_point,
leader_id,
CONCAT(first_name, ' ', last_name) as leader_name
from 
routes r 
JOIN campers c on 
r.leader_id = c.id;