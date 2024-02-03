SELECT * FROM universities_db.universities;

SELECT COUNT(*) as students_count ,
u.name as university_name from universities u
JOIN courses c ON u.id = c.university_id
JOIN students_courses sc ON sc.course_id =  c.id
GROUP BY university_name
HAVING students_count >= 8
ORDER BY students_count DESC, university_name DESC;