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

SELECT concat(first_name, ' ', last_name) as full_name,
concat(reverse(last_name),char_length(last_name), '@cast.com') as email,
2022 - year(birthdate) as age, height from actors
WHERE id NOT IN(SELECT actor_id FROM movies_actors)
ORDER BY height;

-- 08. International festival

SELECT c.name, COUNT(*) as movies_count FROM countries c
JOIN movies m ON c.id = m.country_id
GROUP BY c.name
HAVING movies_count >= 7
ORDER BY c.name DESC;

