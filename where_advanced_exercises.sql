USE employees;

SHOW TABLES;

SELECT *
FROM employees;

-- 1) 
SELECT *
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya');
-- numbers of top three results = '10200', '10397', '10610'

-- 2)
SELECT *
FROM employees
WHERE first_name = 'Irena' OR 'Vidya' OR 'Maya';
-- numbers of top three results = 10397, 10610, 10821

-- 3)
SELECT *
FROM employees
WHERE first_name = 'Irena' OR 'Vidya' OR 'Maya'
	AND gender = 'M';
-- numbers of top three results = 10397, 10610, 10821

-- 4)
SELECT DISTINCT *
FROM employees
WHERE last_name LIKE 'E%';

-- 5)
SELECT DISTINCT *
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE'%E';

-- 6)
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%';

-- 7)
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%E' AND last_name LIKE 'E%';

-- 8)
SELECT *
FROM employees
WHERE hire_date BETWEEN "1990-01-01" AND "1999-12-31";
-- first three ids = 100008,10011,10012

-- 9)
SELECT *
FROM employees
WHERE MONTH(birth_date) = 12 AND DAY(birth_date) = 25;
-- first three ids = 10078, 10115, 10261

-- 10)
SELECT *
FROM employees
WHERE hire_date BETWEEN "1990-01-01" AND "1999-12-31"
	AND MONTH(birth_date) = 12 AND DAY(birth_date) = 25;
-- first three ids = 10261,10438,10681

-- 11)
SELECT DISTINCT *
FROM employees
WHERE last_name LIKE '%q%';

-- 12)
SELECT DISTINCT *
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';