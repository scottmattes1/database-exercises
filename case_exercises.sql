-- Find current employees
SELECT 
	CONCAT(
		e.first_name, 
        ' ',
        e.last_name) as full_name,
	de.dept_no,
    de.from_date as start_date,
    de.to_date as end_date,
	CASE WHEN de.to_date > NOW() THEN "1"
    ELSE "0"
    END AS is_current_employee
FROM dept_emp de
JOIN employees e ON e.emp_no = de.emp_no
WHERE de.to_date < NOW();

SELECT
		CONCAT(
		first_name, 
        ' ',
        last_name) as full_name,
        CASE 
        WHEN last_name BETWEEN 'A' AND 'H' THEN 'A-H'
        WHEN last_name BETWEEN 'I' AND 'Q' THEN 'I-Q'
        ELSE "R-Z"
        END AS alpha_group
FROM employees;

-- how many employees were born in each decade?
SELECT decade_hired, COUNT(full_name) emp_in_decade
FROM	(SELECT
		CONCAT(
			first_name, 
			' ',
			last_name) as full_name,
			CASE
			WHEN birth_date LIKE "194%" THEN "40's"
			WHEN birth_date LIKE "195%" THEN "50's"
			WHEN birth_date LIKE "196%" THEN "60's"
			WHEN birth_date LIKE "197%" THEN "70's"
			WHEN birth_date LIKE "198%" THEN "80's"
			END AS decade_hired
	FROM employees) as decades
    GROUP BY decade_hired;
    
    -- current average salary for each department group?
USE dept_emp;

SELECT department_group, AVG(salary)
FROM (SELECT emp_no, CASE
		WHEN dept_no = d008 THEN "R&D"
		WHEN dept_no = d001 OR dept_no = d007 THEN "Sales & Marketing"
		WHEN dept_no = d004 OR dept_no = d006 THEN "Prod & QM"
		WHEN dept_no = d002 OR dept_no = d003 THEN "Finance & HR"
		WHEN dept_no = d009 THEN "Customer Service"
        END AS department_group
        FROM departments) as ctable
JOIN dept_emp de ON de.emp_no = ctable.emp_no
JOIN salaries s on s.emp_no = ctable.emp_no
GROUP BY department_group;
    
USE employees;

SELECT CASE
		WHEN dept_no = "d008" OR dept_no = "d005" THEN "R&D"
		WHEN dept_no = "d001" OR dept_no = "d007" THEN "Sales & Marketing"
		WHEN dept_no = "d004" OR dept_no = "d006" THEN "Prod & QM"
		WHEN dept_no = "d002" OR dept_no = "d003" THEN "Finance & HR"
		WHEN dept_no = "d009" THEN "Customer Service"
        END AS dept_group,
        ROUND(AVG(salary)) avg_salary
FROM dept_emp
JOIN salaries s USING (emp_no)
JOIN departments d USING (dept_no)
WHERE s.to_date > NOW()
GROUP BY dept_group
ORDER BY avg_salary;


