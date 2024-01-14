CREATE DATABASE car_rental;

USE car_rental;

-- categories (id, category, daily_rate, weekly_rate, monthly_rate, weekend_rate)

CREATE TABLE categories(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
category VARCHAR(200),
daily_rate DOUBLE(6,2),
weekly_rate DOUBLE(6,2),
monthly_rate DOUBLE(6,2),
weekend_rate DOUBLE(6,2)
);

INSERT INTO categories (category, daily_rate, weekly_rate, monthly_rate, weekend_rate)
VALUES('Car', 1.3, 2.3, 5.5, 6.6),
('Car', 1.3, 2.3, 5.5, 6.6),
('Car', 1.3, 2.3, 5.5, 6.6);

-- cars (id, plate_number, make, model, car_year, category_id, doors, picture, car_condition, available)

CREATE TABLE cars(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
plate_number INT NOT NULL,
make VARCHAR(100),
model VARCHAR(100),
car_year DATE,
category_id INT,
doors INT,
picture BLOB,
car_condition VARCHAR(100),
available BOOL
);

INSERT INTO cars (plate_number, make, model, car_year, category_id, doors, picture, car_condition, available)
VALUES(2, 'coll', 'BMW', '2019-06-23', 1, 4, 'VERY BIG', 'condition', true),
(3, 'coll', 'Mercedes', '2020-06-23', 1, 4, 'VERY BIG', 'condition', false),
(4, 'coll', 'Opel', '2013-06-23', 1, 4, 'VERY BIG', 'condition', true);
-- employees (id, first_name, last_name, title, notes)

CREATE TABLE employees(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(80),
last_name VARCHAR(80),
title VARCHAR(80),
notes TEXT
);

INSERT INTO employees(first_name, last_name, title, notes)
VALUES('Ivan', 'Petrov', 'senior', 'specialist'),
('Dragan', 'Vasilev', 'senior', 'specialist'),
('Stoqn', 'Petkov', 'senior', 'specialist');

-- customers (id, driver_licence_number, full_name, address, city, zip_code, notes)

CREATE TABLE customers(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
driver_licence_number INT NOT NULL UNIQUE,
full_name VARCHAR(80) NOT NULL,
address VARCHAR(80) NOT NULL,
city VARCHAR(80) NOT NULL,
zip_code INT,
notes TEXT
);

INSERT INTO customers (driver_licence_number, full_name, address, city, zip_code, notes)
VALUES(222555, 'Ivan', 'jk.Trakia', 'Plovdiv', 4000, 'wonderfull'),
(222566, 'Ivan', 'jk.Mladost', 'Sofia', 6000, 'wonderfull'),
(222544, 'Stoqn', 'jk.Trakia', 'Plovdiv', 4000, 'wonderfull');

-- rental_orders (id, employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes)

CREATE TABLE rental_orders(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
employee_id INT NOT NULL,
customer_id INT NOT NULL,
car_id INT NOT NULL,
car_condition VARCHAR(80),
tank_level INT,
kilometrage_start INT,
kilometrage_end INT,
total_kilometrage INT,
start_date DATE,
end_date DATE,
total_days INT,
rate_applied DOUBLE(6,2),
tax_rate DOUBLE(6,2),
order_status BOOL,
notes TEXT
);

INSERT INTO rental_orders (employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes)
VALUES(1, 2, 2, 'CONS', 3, 1000, 2000, 3000, '2020-03-03', '2012-04-04', 5, 2.3, 2.3, true, 'cooool'),
(1, 3, 2, 'CONS', 3, 2000, 3000, 5000, '2020-03-03', '2012-04-04', 5, 2.3, 2.3, true, 'cooool'),
(1, 2, 2, 'CONS', 3, 1000, 2000, 3000, '2020-01-03', '2012-08-04', 5, 2.6, 5.5, true, 'cooool');