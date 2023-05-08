-- 1)
SELECT emp_no, CONCAT(first_name, " ", last_name) full_name
FROM employees
WHERE hire_date = (
					SELECT hire_date
					FROM employees
					WHERE emp_no = 101010
					);
                    
-- 2)

SELECT title, CONCAT(aamods.first_name, ' ', aamods.last_name) full_name
FROM titles
JOIN (
		SELECT *
		FROM employees
		WHERE first_name = 'Aamod'
		) AS aamods ON aamods.emp_no = titles.emp_no
WHERE titles.to_date > NOW();

-- 3)

SELECT emp_no, COUNT(*)
FROM titles
GROUP BY emp_no
HAVING MAX(to_date) < NOW();

SELECT count(*)
FROM (
	SELECT emp_no
	FROM titles
	GROUP BY emp_no
	HAVING MAX(to_date) < NOW()
    ) squery;
-- There are 59900 non-current employees

-- 4)
SELECT emp_no
FROM dept_manager
WHERE to_date > NOW();

SELECT CONCAT(first_name, ' ', last_name)
FROM (
		SELECT emp_no
		FROM dept_manager
		WHERE to_date > NOW()
		) as cm
JOIN employees e USING (emp_no)
WHERE gender= 'F';
-- 'Isamu Legleitner'
-- 'Karsten Sigstam'
-- 'Leon DasSarma'
-- 'Hilary Kambil'

-- 5)

USE employees;
SELECT AVG(salary)
FROM salaries;

SELECT e.emp_no, CONCAT(first_name, ' ', last_name) full_name
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no
JOIN dept_emp de ON de.emp_no = e.emp_no
WHERE s.salary > (
					SELECT AVG(salary)
					FROM salaries
                    )
	AND de.to_date > NOW()
GROUP BY emp_no;

-- 6)
-- what is the current highest salary?
SELECT MAX(salary)
FROM salaries
WHERE to_date > NOW();

-- what is the standard deviation of current salaries
SELECT salary
		FROM salaries
		WHERE to_date > NOW();
        
SELECT STDDEV(salary)
FROM (
		SELECT salary
		FROM salaries
		WHERE to_date > NOW()
        ) AS current_salaries;


-- what is the number of salaries within one standard deviation of the highest current salary?
SELECT COUNT(*)
FROM salaries
WHERE salary >
			((SELECT MAX(salary)
			FROM salaries
            WHERE to_date > NOW())
			-(SELECT STDDEV(salary)
			FROM salaries
			WHERE to_date > NOW()
			))
            AND
            to_date > NOW();
            
            