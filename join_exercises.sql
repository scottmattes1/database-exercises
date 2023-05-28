-- 1)
USE join_example_db;

SELECT *
FROM users;

SELECT *
FROM roles;

-- 2)
SELECT *
FROM users u
JOIN roles r ON r.id = u.role_id;
-- predicting four rows, correct

SELECT *
FROM users u
LEFT JOIN roles r ON r.id = u.role_id;
-- predicting four rows, actually there's six

SELECT *
FROM users u
RIGHT JOIN roles r ON r.id = u.role_id;

-- 3)
SELECT u.role_id, r.name, COUNT(*) emp_in_position
FROM users u
JOIN roles r ON r.id = u.role_id
GROUP BY u.role_id, r.name
ORDER BY u.role_id ASC;


-- 1) employee database
USE employees;

-- 2)
SELECT *
FROM departments;

SELECT *
FROM dept_manager;

SELECT *
FROM employees;

DESCRIBE dept_manager;
SHOW CREATE TABLE dept_manager;

SELECT d.dept_name Department_name, CONCAT(e.first_name, ' ', e.last_name) Manager_name
FROM employees e
JOIN dept_manager dm ON dm.emp_no = e.emp_no
JOIN departments d ON d.dept_no = dm.dept_no
WHERE dm.to_date LIKE "9999%"
ORDER BY dept_name;

-- 3)
SELECT d.dept_name Department_name, gender, CONCAT(e.first_name, ' ', e.last_name) Manager_name
FROM employees e
JOIN dept_manager dm ON dm.emp_no = e.emp_no
JOIN departments d ON d.dept_no = dm.dept_no
WHERE dm.to_date LIKE "9999%" AND e.gender = 'F'
ORDER BY dept_name;

-- 4)
USE employees;
SELECT t.title, COUNT(t.emp_no) count
FROM titles t
JOIN dept_emp de ON de.emp_no = t.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE de.to_date LIKE "9999%" AND d.dept_name = "Customer Service"
GROUP BY t.title;

SELECT *
FROM titles;

-- 5)
SELECT dept_name;

-- 6

SELECT dept_emp.dept_no, dept_name, count(*) AS num_employees
FROM dept_emp
	JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.tp_date > NOW()
GROUP BY dept_emp.dept_no, dept_name
ORDER BY dept_no;

-- 7)

    
    
