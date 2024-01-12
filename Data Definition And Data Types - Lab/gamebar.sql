USE gamebar;

CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
CREATE TABLE categories(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(50) NOT NULL
);

CREATE TABLE products(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   category_id INT NOT NULL
   );

   
   INSERT INTO employees(first_name, last_name) 
   VALUES ("Ivan" ,"Petrov");
   
   
   INSERT INTO employees(first_name, last_name) 
   VALUES ("Petar", "Georgiev"),
   ("Stefan","Stanbolov");
   
      
   SELECT * FROM employees;
   
   
   ALTER TABLE employees
   ADD COLUMN middle_name VARCHAR(50) NOT NULL;
   
   SELECT * FROM employees;
   
 ALTER TABLE employees
 MODIFY COLUMN middle_name VARCHAR(100);
   
   
   
   
   
   
   

   