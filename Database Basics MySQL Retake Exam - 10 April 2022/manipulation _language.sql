SELECT * FROM softuni_imdb.actors;

-- 02 Insert

INSERT INTO actors(first_name, last_name, birthdate,
 height, awards, country_id)
 SELECT 
 reverse(first_name),
 reverse(last_name),
adddate(birthdate , interval -2 DAY),
 height + 10,
 country_id,
 3
 FROM actors
 WHERE id <= 10;
 
 -- 03 Update
 
 UPDATE  movies_additional_info 
 SET runtime = runtime - 10
 WHERE id >= 15 AND id <= 25;
 
 
-- 04 DELETE 

DELETE FROM countries 
WHERE id NOT IN (SELECT country_id FROM movies);