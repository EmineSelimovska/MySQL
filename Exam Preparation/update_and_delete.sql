SELECT * FROM universities_db.courses;

UPDATE universities
SET tuition_fee = tuition_fee + 300
WHERE  id BETWEEN 5 AND 12;


DELETE FROM universities 
WHERE number_of_staff IS NULL;

