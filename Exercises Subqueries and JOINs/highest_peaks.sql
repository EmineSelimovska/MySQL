SELECT * FROM geography.peaks;


SELECT c.country_code,m.mountain_range, p.peak_name,
p.elevation from countries c
JOIN mountains_countries mc on c.country_code  = mc.country_code
JOIN mountains m on mc.mountain_id = m.id 
JOIN peaks p  ON m.id = p.mountain_id
WHERE p.elevation > 2835 and c.country_code = 'BG'
ORDER BY p.elevation DESC