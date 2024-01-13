USE minions;

CREATE TABLE minions(
   id INT AUTO_INCREMENT,
   name VARCHAR(60),
   age INT,
   
   PRIMARY KEY (id)
);

CREATE TABLE towns(
   town_id INT AUTO_INCREMENT ,
   name VARCHAR(60),
  
  PRIMARY KEY (town_id)
);

ALTER TABLE towns
CHANGE town_id id INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE towns
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE minions
ADD COLUMN town_id INT;

ALTER TABLE minions
ADD CONSTRAINT fk_town_id FOREIGN KEY (town_id) REFERENCES towns(id);

SELECT * FROM towns;
SELECT * FROM minions;

drop table minions;
drop table towns;
INSERT INTO towns(id,name) VALUE(1,'Sofia');
INSERT INTO towns(id,name) VALUE(2,'Plovdiv');
INSERT INTO towns(id,name) VALUE(3,'Varna');

INSERT INTO minions(id,name,age,town_id) VALUE(1,'Kevin',22,1);
INSERT INTO minions(id,name,age,town_id) VALUE(2,'Bob',15, 3);
INSERT INTO minions(id,name,age,town_id) VALUE(3,'Steward',NULL,2);


SELECT * FROM towns;
SELECT * FROM minions;

TRUNCATE TABLE minions;

DROP TABLE minions;
DROP TABLE towns;



