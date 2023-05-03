USE employees;

SHOW TABLES;

SELECT *
FROM employees;

-- 1)
-- Copied over contents from the previous exercise

-- 2) 
SELECT *
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name DESC;
-- first result = Irena Reutenauer
-- last result = Vidya Quittner

-- 3)
SELECT *
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name DESC, last_name DESC;
-- first result = Irena Acton
-- last result = Vidya Zweizig

-- 4)
SELECT *
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY last_name DESC, first_name DESC;
-- first result = Irena Acton
-- last result = Maya Zyda

-- 5)
SELECT *
FROM employees
WHERE last_name LIKE 'E%' 
	AND last_name LIKE '%E'
ORDER BY emp_no DESC;
-- employees returned = 899
-- first emplyee = Ramzi Erde, 10021
-- last employee = Tadahiro Erde, 499648

-- 6)
SELECT *
FROM employees
WHERE last_name LIKE 'E%' 
	AND last_name LIKE '%E'
ORDER BY hire_date DESC;
-- employees returned = 899
-- first emplyee = Sergi Erde
-- last employee = Teiji Eldridge

-- 7)
SELECT *
FROM employees
WHERE hire_date LIKE '199%' 
	AND birth_date LIKE '%12-25'
ORDER BY hire_date, birth_date;
-- oldest emplyee hired last = Khun Bernini
-- youngest emplyee hired first = Alselm Cappello