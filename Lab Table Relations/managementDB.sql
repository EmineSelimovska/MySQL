CREATE DATABASE management_db;
use management_db;


CREATE TABLE clients(
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
	client_name VARCHAR(100)
);



CREATE TABLE projects(
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
	client_id INT(11),
    project_lead_id INT(11)
);




CREATE TABLE employees(
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(30),
    last_name VARCHAR(30),
    project_id INT(11),
    
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

ALTER TABLE projects
ADD FOREIGN KEY (client_id) REFERENCES clients(id),
ADD FOREIGN KEY (project_lead_id) REFERENCES employees(id);

