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

DELIMITER $ 
CREATE PROCEDURE udp_award_movie(movie_title VARCHAR(50))
BEGIN
UPDATE actors a
JOIN movies_actors ma ON a.id = ma.actor_id
JOIN movies m ON m.id = ma.movie_id
SET a.awards = a.awards + 1
WHERE m.title = movie_title;
END $
DELIMITER ;

CALL udp_award_movie('Tea For Two');