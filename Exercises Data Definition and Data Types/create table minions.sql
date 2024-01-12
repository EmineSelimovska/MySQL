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
)
