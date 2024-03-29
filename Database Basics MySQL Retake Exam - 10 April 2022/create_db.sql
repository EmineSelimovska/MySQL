CREATE DATABASE softuni_imdb;

use softuni_imdb;

-- 01 Table Design

CREATE TABLE movies_additional_info(
id INT AUTO_INCREMENT PRIMARY KEY,
rating DECIMAL(10,2) NOT NULL,
runtime INT NOT NULL,
picture_url VARCHAR(80) NOT NULL,
budget DECIMAL(10,2),
release_date DATE NOT NULL,
has_subtitles BOOLEAN,
description TEXT
);

CREATE TABLE countries(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL UNIQUE,
continent VARCHAR(30) NOT NULL,
currency VARCHAR(5) NOT NULL
);

CREATE TABLE movies(
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(70) NOT NULL UNIQUE,
country_id INT NOT NULL,
movie_info_id INT NOT NULL UNIQUE,

FOREIGN KEY (country_id) REFERENCES countries(id),
FOREIGN KEY (movie_info_id) REFERENCES movies_additional_info(id)
);

CREATE TABLE actors(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
birthdate DATE NOT NULL,
height INT,
awards INT,
country_id INT NOT NULL,

FOREIGN KEY (country_id) REFERENCES countries(id)
);

CREATE TABLE movies_actors(
movie_id INT,
actor_id INT,

FOREIGN KEY (movie_id) REFERENCES movies(id),
FOREIGN KEY (actor_id) REFERENCES actors(id)

);

CREATE TABLE genres(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE genres_movies(
genre_id INT,
movie_id INT,

FOREIGN KEY (genre_id) REFERENCES genres(id),
FOREIGN KEY (movie_id) REFERENCES movies(id)
);