SHOW DATABASES;
USE employees;

-- 1) copied order_by_exercises.sql

-- 2)
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%E';

-- 3)
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%E';

-- 4)
SELECT COUNT(UPPER(CONCAT(first_name, ' ', last_name))) AS full_name
FROM employees
WHERE last_name LIKE 'E%E';

-- 5)
SELECT first_name, last_name, datediff(CURDATE(), hire_date) AS time_at_company
FROM employees
WHERE hire_date LIKE '199%' 
	AND birth_date LIKE '%12-25';

-- 6)
SELECT MIN(salary) AS smallest_salary, MAX(salary) AS largest_salary
FROM salaries;

-- 7) create a username column with the formula:
-- lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born
SELECT lower(
		concat(
			substr(first_name, 1, 1), 
			substr(last_name, 1, 4), 
            '_', 
            substr(birth_date, 6, 2), 
            substr(birth_date, 3, 2))) 
            AS username, 
		first_name, last_name, birth_date
FROM employees
LIMIT 10;