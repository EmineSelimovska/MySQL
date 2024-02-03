SELECT * FROM universities_db.students;

SELECT 
CONCAT(s.first_name, ' ', s.last_name) as full_name,
substr(s.email,2, 10) as username,
reverse(s.phone) as password
 from students s
 LEFT JOIN students_courses sc ON
 s.id = sc.student_id
 WHERE sc.course_id IS NULL
ORDER BY password DESC;
