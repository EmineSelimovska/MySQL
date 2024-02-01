SELECT * FROM geography.countries_rivers;

SELECT c.country_name, r.river_name 
from countries c 
LEFT JOIN countries_rivers cr on c.country_code = cr.country_code
LEFT JOIN rivers r on cr.river_id = r.id
WHERE c.continent_code = 'AF'
ORDER BY c.country_name 
LIMIT 5;