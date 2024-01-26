SELECT * FROM geography.mountains;

use geography;

SELECT mountain_range, peak_name, elevation as peak_elevation
FROM peaks p 
JOIN mountains m
on m.id = p.mountain_id
WHERE mountain_range = 'Rila'
ORDER BY peak_elevation DESC;