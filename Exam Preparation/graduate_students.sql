SELECT * FROM universities_db.courses;
use  universities_db;

DELIMITER $
CREATE FUNCTION udf_average_alumni_grade_by_course_name(course_name VARCHAR(60)) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	 DECLARE average_alumni_grade DECIMAL(10,2);
     SET average_alumni_grade := (
      SELECT AVG(grade) as average_alumni_grade 
      FROM courses c 
      JOIN students_courses sc ON c.id = sc.course_id
       JOIN students s ON s.id = sc.student_id
        where s.is_graduated = 1 and c.name = course_name
       GROUP BY c.id
     );
     RETURN average_alumni_grade;

END $


DELIMITER ;


SELECT c.name, udf_average_alumni_grade_by_course_name('Quantum Physics') as

average_alumni_grade FROM courses c

WHERE c.name = 'Quantum Physics';

 SELECT c.name as course_name , round(AVG(grade),2) as average_alumni_grade 
      FROM courses c 
      JOIN students_courses sc ON c.id = sc.course_id
       JOIN students s ON s.id = sc.student_id
       where s.is_graduated = 1 and c.name = 'Quantum Physics'
       GROUP BY c.name;
