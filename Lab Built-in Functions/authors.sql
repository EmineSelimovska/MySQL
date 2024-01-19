SELECT * FROM book_library.authors;

use book_library;

SELECT concat(first_name, ' ', last_name) AS 'Full Name',
TIMESTAMPDIFF(DAY, born, died) as 'Days Lived' from authors;