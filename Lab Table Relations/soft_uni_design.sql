CREATE DATABASE softuni_design;

use softuni_design;

CREATE TABLE employees(
 employee_id INT(11) AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(50),
 manager_id INT(11)
 );
 
 ALTER TABLE employees
 add FOREIGN KEY (manager_id) REFERENCES employees(employee_id);
 
 CREATE TABLE departments(
 department_id INT(11) AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(50),
 manager_id INT(11) UNIQUE,
 
 FOREIGN KEY (manager_id) REFERENCES employees(manager_id)
 );
 
 ALTER TABLE employees
 add department_id int(11),
 add FOREIGN KEY (department_id) REFERENCES departments(department_id);