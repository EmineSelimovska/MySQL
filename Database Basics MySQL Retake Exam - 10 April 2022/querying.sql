SELECT * FROM softuni_imdb.countries;

-- 05. Countries

SELECT id, name, continent, currency
FROM countries 
ORDER BY currency DESC, id;

-- 06. Old movies

SELECT mi.id,m.title, mi.runtime, mi.budget, mi.release_date
from movies_additional_info mi
JOIN movies m ON mi.id = m.movie_info_id
WHERE year(mi.release_date) BETWEEN 1996 AND 1999
ORDER BY mi.runtime, mi.id
LIMIT 20;

-- 07. Movie casting