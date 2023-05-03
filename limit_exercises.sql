SHOW DATABASES;
USE employees;

-- 2)
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

-- 3)
SELECT first_name, last_name
FROM employees
WHERE hire_date LIKE '199%' 
	AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5;
/*
'Alselm','Cappello'
'Utz','Mandell'
'Bouchung','Schreiter'
'Baocai','Kushner'
'Petter','Stroustrup'
*/

-- 4)
-- 3)
SELECT first_name, last_name
FROM employees
WHERE hire_date LIKE '199%' 
	AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 45;