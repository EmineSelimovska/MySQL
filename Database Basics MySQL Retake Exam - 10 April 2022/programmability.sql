SELECT * FROM softuni_imdb.movies_additional_info;
USE softuni_imdb;

-- 10. History movies

DELIMITER $
CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50)) 
RETURNS INT
DETERMINISTIC
BEGIN 
      DECLARE history_movies INT;
      SET history_movies := (
     SELECT COUNT(g.name) movies 
	FROM actors a
    JOIN movies_actors ma ON a.id = ma.actor_id
    JOIN genres_movies gm ON ma.movie_id = gm.movie_id
    JOIN genres g ON g.id = gm.genre_id 
    WHERE concat(a.first_name, ' ', a.last_name) = full_name AND g.name = 'History'
    GROUP BY g.name
      );
      
      RETURN history_movies;
END $

DELIMITER ;

SELECT udf_actor_history_movies_count('Stephan Lundberg')  AS 'history_movies';

-- 11. Movie awards