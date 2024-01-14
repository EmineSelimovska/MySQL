CREATE DATABASE movies;

USE movies;

CREATE TABLE directors(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
director_name VARCHAR(80) NOT NULL,
notes TEXT
);

CREATE TABLE genres(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
genre_name VARCHAR(80) NOT NULL,
notes TEXT
);

CREATE TABLE categories(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(80) NOT NULL,
notes TEXT
);

CREATE TABLE movies(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(80) NOT NULL,
director_id INT,
copyright_year DATE,
length DOUBLE(6,2),
genre_id INT,
category_id INT,
rating double(6,2),
notes TEXT
);

ALTER TABLE movies
ADD CONSTRAINT fk_director_id FOREIGN KEY (director_id) REFERENCES directors(id),
ADD CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres(id),
ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES categories(id);


INSERT INTO directors(director_name, notes)
VALUES('Stivan', 'cooooooool'),
('Dobri', 'cooooooool'),
('Stefan', 'cooool'),
('Vilian', 'I am cool'),
('Valio', 'Together');

INSERT INTO genres(genre_name, notes)
VALUES('Stivan', 'WOWW'),
('Dobri', 'cooooooool'),
('Stefan', 'I am stupied'),
('Vilian', 'I am cool'),
('Valio', 'Together');

INSERT INTO categories(category_name, notes)
VALUES('Stivan', 'col'),
('Dobri', 'Very goood'),
('Stefan', 'cooool'),
('Vilian', 'I am cool'),
('Valio', 'Together');

INSERT INTO movies(title, director_id, copyright_year, length, genre_id, category_id, rating, notes)
VALUES('Stivan',1, '2019-07-13', 1.20, 2,2, 5, 'cooooooool'),
('Vilian',2, '2022-07-13', 1.20, 2,2, 5, 'cooooooool'),
('Ivan',1, '2023-07-13', 1.20, 2,2, 5, 'col'),
('Stefan',3, '2012-07-12', 1.35, 2,2, 5, 'cooooooool'),
('Stoqn',1, '2022-07-16', 1.60, 2,2, 5, 'cooooooool');
