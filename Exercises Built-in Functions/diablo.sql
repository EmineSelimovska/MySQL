SELECT * FROM diablo.games;
use diablo;

SELECT name, date_format(start,'%Y-%m-%d') as 'start' FROM games
WHERE year(start) IN(2011, 2012)
ORDER BY start
limit 50;