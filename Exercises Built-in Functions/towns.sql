SELECT * FROM soft_uni.towns;

SELECT name from towns
WHERE length(name) = 5 OR length(name) = 6
ORDER BY name;


SELECT town_id, name FROM towns 
WHERE name LIKE 'M%'or 
 name LIke 'K%' or
 name LIKE 'B%' or 
 name LIKE 'E%'
ORDER BY name;

SELECT town_id, name FROM towns 
WHERE name NOT LIKE 'R%' AND
 name NOT LIKE 'B%' AND
 name NOT LIKE 'D%'
ORDER BY name;