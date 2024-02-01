SELECT * FROM geography.mountains_countries;

SELECT COUNT(c.country_code) as country_count from countries c
LEFT JOIN mountains_countries mc on mc.country_code = c.country_code
WHERE mc.mountain_id IS NULL;