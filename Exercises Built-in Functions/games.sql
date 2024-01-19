SELECT * FROM diablo.games;
use diablo;

SELECT name as game,
CASE 
	when HOUR(start) < 12 THEN 'Morning'
    when HOUR(start) < 18 THEN 'Afternoon'
    when HOUR(start) < 24 THEN 'Evening'
END as 'Part of the Day',
CASE 
	when duration < 4 THEN 'Extra Short'
    when duration < 7 THEN 'Short'
    when duration < 11 THEN 'Long'
    ELSE 'Extra Long'
END as 'Duration'
from games;


