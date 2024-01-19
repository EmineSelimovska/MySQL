SELECT * FROM book_library.books;

SELECT title FROM books
WHERE title LIKE 'The%' 
ORDER BY id;

SELECT replace(title, 'The', '***')
AS title FROM books
WHERE substring(title, 1, 3) = 'The'
ORDER BY id;

SELECT round(SUM(cost),2) AS 'sum' FROM books ;

SELECT title FROM books
WHERE title LIKE 'Harry Potter%'
ORDER BY id;

