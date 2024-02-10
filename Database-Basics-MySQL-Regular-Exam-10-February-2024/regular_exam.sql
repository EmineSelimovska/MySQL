CREATE DATABASE preserves_db;
use preserves_db;


-- CREATE table

CREATE TABLE continents(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE countries(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(40) NOT NULL UNIQUE,
country_code VARCHAR(10) NOT NULL UNIQUE,
continent_id INT NOT NULL,

FOREIGN KEY (continent_id) REFERENCES continents(id)
);

CREATE TABLE positions(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(40) NOT NULL UNIQUE,
description TEXT,
is_dangerous BOOLEAN NOT NULL
);

CREATE TABLE preserves(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL UNIQUE,
latitude DECIMAL(9,6),
longitude DECIMAL(9,6),
area INT,
type VARCHAR(20),
established_on DATE
);

CREATE TABLE workers(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(40) NOT NULL,
last_name VARCHAR(40) NOT NULL,
age INT,
personal_number VARCHAR(20) NOT NULL UNIQUE,
salary DECIMAL(19,2),
is_armed BOOLEAN NOT NULL,
start_date DATE,
preserve_id INT,
position_id INT,

FOREIGN KEY (preserve_id) REFERENCES preserves(id),
FOREIGN KEY (position_id) REFERENCES positions(id)
);

CREATE TABLE countries_preserves(
country_id INT ,
preserve_id INT,

FOREIGN KEY (country_id) REFERENCES countries(id),
FOREIGN KEY (preserve_id) REFERENCES preserves(id)
);

-- 02 . Insert

INSERT INTO preserves(name, latitude, longitude,
area, type, established_on)
SELECT 
concat(name, ' ', "is in South Hemisphere") ,
latitude,
longitude,
area * id,
lower(type),
established_on
FROM preserves 
WHERE latitude < 0;

-- 03. Update

UPDATE workers 
SET salary = salary + 500
WHERE position_id IN(5, 8,11, 13);

-- 04. Delete

DELETE FROM preserves 
WHERE established_on IS NULL; 

-- 05. Most experienced workers

SELECT concat(first_name, ' ',last_name) as full_name,
datediff('2024-01-01', start_date) as days_of_experience
FROM workers 
ORDER BY days_of_experience DESC 
LIMIT 10;

-- 06. Worker's salary

SELECT w.id, w.first_name, w.last_name ,p.name,c.country_code 
FROM workers w
JOIN preserves p ON w.preserve_id = p.id
JOIN countries_preserves cp ON p.id = cp.preserve_id
JOIN countries c ON cp.country_id = c.id
WHERE w.salary > 5000 AND w.age < 50
ORDER BY c.country_code;

-- 07. Armed workers count

SELECT p.name, COUNT(w.id) as armed_workers FROM preserves p
JOIN workers w ON p.id = w.preserve_id
JOIN countries_preserves cp ON w.preserve_id = cp.preserve_id
JOIN countries cs ON cp.country_id = cs.id
JOIN positions pos ON w.position_id = pos.id
WHERE w.is_armed = 1
GROUP BY p.name
ORDER BY armed_workers DESC, p.name ASC;

-- 08. Oldest preserves

SELECT p.name,c.country_code, year(p.established_on) as founded_in FROM preserves p 
JOIN countries_preserves cp ON p.id = cp.preserve_id
JOIN countries c ON cp.country_id = c.id
WHERE month(p.established_on) = 5
ORDER BY p.established_on;


-- 09. Preserve categories

SELECT id, name,
CASE 
  WHEN area <= 100 THEN "very small"
  WHEN area <= 1000 THEN "small"
  WHEN area > 1000 AND area <= 10000 THEN "medium"
  WHEN area > 10000 AND area <= 50000 THEN "large" 
  WHEN area > 50000 THEN "very large"
END AS category
 FROM preserves 
ORDER BY area DESC;

-- 10. Extract average salary

DELIMITER $ 
CREATE FUNCTION udf_average_salary_by_position_name (name_position VARCHAR(40))
RETURNS DECIMAL(19,2)
DETERMINISTIC
BEGIN
    DECLARE position_average_salary DECIMAL(19,2);
    SET position_average_salary := (
    SELECT ROUND(AVG(w.salary),2) as avg_salary FROM workers w
	JOIN positions p ON w.position_id = p.id
	JOIN preserves ps ON w.preserve_id = ps.id
	WHERE p.name = name_position
	GROUP BY p.name
    );
    
    RETURN position_average_salary;

END $

DELIMITER ;

SELECT p.name, udf_average_salary_by_position_name('Forester') as position_average_salary FROM positions p 
WHERE p.name = 'Forester';

-- 11. Improving the standard of living

DELIMITER $
CREATE PROCEDURE udp_increase_salaries_by_country(country_name VARCHAR(40))
BEGIN
	UPDATE workers w
    JOIN preserves p ON w.preserve_id = p.id
    JOIN countries_preserves cp ON p.id = cp.preserve_id
    JOIN countries c ON cp.country_id = c.id
    SET w.salary = ROUND(w.salary + (w.salary * 0.05), 2)
    WHERE c.name = country_name;
END $

DELIMITER ;

CALL increase_salaries_by_country (Germany);



