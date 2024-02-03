SELECT * FROM universities_db.courses;

INSERT INTO courses(name, duration_hours, start_date, teacher_name,
description, university_id)
SELECT 
concat(teacher_name,' ', 'course'),
length(name)/10,
adddate(start_date, INTERVAL 5 day),
reverse(teacher_name),
concat("Course ", teacher_name, reverse(description)),
day(start_date)
 FROM courses 
WHERE id <= 5;
