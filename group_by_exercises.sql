-- 1) created file
USE employees;

-- 2)
SELECT DISTINCT title
FROM titles;
-- There are 7 total titles

-- 3)
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;

-- 4)
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name;

-- 5)
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
/* results: 
'Chleq'
'Lindqvist'
'Qiwen'
*/


-- 6)
SELECT last_name, COUNT(*) same_last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- 7)
SELECT first_name, gender, count(*) same_name_employees_by_gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender
ORDER BY same_name_employees_by_gender DESC;

-- 8)
SELECT lower(
		concat(
			substr(first_name, 1, 1), 
			substr(last_name, 1, 4), 
            '_', 
            substr(birth_date, 6, 2), 
            substr(birth_date, 3, 2))) 
            AS username, 
		COUNT(*) same_username
FROM employees
GROUP BY username;

-- 9)
SELECT lower(
		concat(
			substr(first_name, 1, 1), 
			substr(last_name, 1, 4), 
            '_', 
            substr(birth_date, 6, 2), 
            substr(birth_date, 3, 2))) 
            AS username, 
		COUNT(*) same_username
FROM employees
GROUP BY username
HAVING same_username > 1
ORDER BY same_username DESC;

-- BONUS
SELECT COUNT(*) total_count
FROM
	(SELECT lower(
			concat(
				substr(first_name, 1, 1), 
				substr(last_name, 1, 4), 
				'_', 
				substr(birth_date, 6, 2), 
				substr(birth_date, 3, 2))) 
				AS username, 
			COUNT(*) same_username
	FROM employees
	GROUP BY username
	HAVING same_username > 1
	ORDER BY same_username DESC) AS SUBQUERY;
    
-- BONUS QUESTIONS --
SELECT * FROM salaries;

-- 1)
SELECT emp_no, AVG(salary) avg_salary
FROM salaries
GROUP BY emp_no;

-- 2)
SELECT dept_no, COUNT(emp_no) emp_in_dept
FROM dept_emp
GROUP BY dept_no;

-- 3)
SELECT emp_no, COUNT(*) num_of_salaries
FROM salaries
GROUP BY emp_no;

-- 4)
SELECT emp_no, MAX(salary) max_salary
FROM salaries
GROUP BY emp_no;

-- 5)
SELECT emp_no, MIN(salary) min_salary
FROM salaries
GROUP BY emp_no;

-- 6)
SELECT emp_no, STDDEV(salary) std_salary
FROM salaries
GROUP BY emp_no;

-- 7)
SELECT emp_no, MAX(salary) max_salary_abv_150k
FROM salaries
WHERE salary > 150000
GROUP BY emp_no;

-- 8)
SELECT emp_no, AVG(salary) avg_salary_btw_80n90k
FROM salaries
WHERE salary BETWEEN 80000 AND 90000
GROUP BY emp_no;