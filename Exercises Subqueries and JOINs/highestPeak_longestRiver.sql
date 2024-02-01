SELECT * FROM geography.countries;

SELECT c.country_name,MAX(p.elevation) as highest_peak_elevation,
MAX(r.length) as longest_river_length
from countries c
JOIN countries_rivers cr on c.country_code = cr.country_code
JOIN mountains_countries mc on cr.country_code = mc.country_code
JOIN peaks p on mc.mountain_id = p.mountain_id
JOIN rivers r on cr.river_id = r.id
GROUP BY c.country_name
ORDER BY highest_peak_elevation DESC, longest_river_length DESC, c.country_name ASC
limit 5;

