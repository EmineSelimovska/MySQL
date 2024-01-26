use relations_tb;


CREATE TABLE teachers(
	teacher_id INT AUTO_INCREMENT PRIMARY KEY ,
	name varchar(60),
	manager_id INT 
);

INSERT INTO teachers(teacher_id, name, manager_id) VALUES
(101, 'John', null),
(102, 'Maya', 106),
(103, 'Silvia',106),
(104, 'Ted', 105),
(105, 'Mark', 101),
(106, 'Greta', 101);

ALTER TABLE teachers
add FOREIGN KEY (manager_id) REFERENCES teachers(teacher_id);

 SELECT * FROM teachers;