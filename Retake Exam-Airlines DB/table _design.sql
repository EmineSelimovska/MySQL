CREATE DATABASE airlines_db;

use airlines_db;

CREATE TABLE countries(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL UNIQUE,
description TEXT,
currency VARCHAR(5) NOT NULL
);

CREATE TABLE passengers(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
country_id INT NOT NULL,

FOREIGN KEY (country_id) REFERENCES countries(id)
);

CREATE TABLE airplanes(
id INT AUTO_INCREMENT PRIMARY KEY,
model VARCHAR(50) NOT NULL UNIQUE,
passengers_capacity INT NOT NULL,
tank_capacity DECIMAL(19,2) NOT NULL,
cost DECIMAL(19,2) NOT NULL
);

CREATE TABLE flights(
id INT AUTO_INCREMENT PRIMARY KEY,
flight_code VARCHAR(30) NOT NULL UNIQUE,
departure_country INT NOT NULL,
destination_country INT NOT NULL,
airplane_id INT NOT NULL,
has_delay BOOLEAN,
departure DATETIME,

FOREIGN KEY (departure_country) REFERENCES countries(id),
FOREIGN KEY (destination_country) REFERENCES countries(id),
FOREIGN KEY (airplane_id) REFERENCES airplanes(id)
);

CREATE TABLE flights_passengers(
flight_id INT,
passenger_id INT,

FOREIGN KEY (flight_id) REFERENCES flights(id),
FOREIGN KEY (passenger_id) REFERENCES passengers(id)
);

