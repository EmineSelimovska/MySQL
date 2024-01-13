USE minions;

CREATE TABLE people(
id INT UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(200) NOT NULL,
picture BLOB,
height DOUBLE(6,2),
weight DOUBLE(6,2),
gender CHAR(1) NOT NULL,
birthdate DATE NOT NULL,
biography BLOB NOT NULL
);

INSERT INTO people(name,picture,height,weight,gender,birthdate,biography)
VALUES('Ivan Ivanov', 'color', 1.45, 67.2,'m','1990-05-25','Specialist'),
('Sefa Ivailov', 'colorite', 1.70, 67.8,'m','1995-05-25','Specialisttt'),
('Lili Ivanova', 'color', 1.45, 65.9,'f','1990-05-27','Specialist'),
('Ivana Stefnoova', 'color', 1.45, 67.1,'f','1990-07-25','Coloritna'),
('Ivailo Ivanov', 'color', 1.75, 67.5,'m','1990-01-25','Specialist');

SELECT * FROM people;