SELECT * FROM soft_uni.employees;


SELECT e.employee_id, e.job_title,
a.address_id, a.address_text from employees e
JOIN addresses a on a.address_id = e.address_id
ORDER BY address_id ASC
LIMIT 5;