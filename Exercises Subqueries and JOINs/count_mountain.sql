SELECT * FROM geography.countries;
 use geography;

SELECT mc.country_code , 
COUNT(m.mountain_range) as mountain_range
FROM  mountains m
JOIN mountains_countries mc on m.id = mc.mountain_id
WHERE mc.country_code IN ('BG', 'RU', 'US')
GROUP BY mc.country_code
ORDER BY mountain_range DESC;