CREATE DATABASE relations;

use relations;

CREATE TABLE mountains(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);


DROP TABLE peaks;
CREATE TABLE peaks(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
    mountain_id INT,
    CONSTRAINT fk_peaks_mountains
    FOREIGN KEY (mountain_id)  
    REFERENCES mountains(id)
);


CREATE TABLE mountains(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);


CREATE TABLE peaks(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
    mountain_id INT,
    CONSTRAINT fk_peaks_mountains
    FOREIGN KEY (mountain_id)  
    REFERENCES mountains(id)
    on DELETE CASCADE
);

DELETE FROM mountains;


