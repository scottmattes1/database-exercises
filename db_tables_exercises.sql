SHOW DATABASES;
USE albums_db;
SELECT database();
SHOW TABLES;
USE employees;
SELECT database();
SHOW TABLES;
SHOW CREATE TABLE employees;
-- 10) emp_no = int; birth_date = date; first_name = varchar; last_name = varchar; hire_date = date
SHOW TABLES;
-- 11) contains numeric column = ALL, because of primary key
-- 12) contains string column = departments, dept_emp, employees, titles
-- 13) contains date column = dept_emp, dept_manager, employees, salaries, titles
-- 14) there are no shared columns or relationships between the employees and departments columns
SHOW CREATE TABLE dept_manager;
-- CREATE TABLE'dept_manager', 'CREATE TABLE `dept_manager` (\n  `emp_no` int NOT NULL,\n  `dept_no` char(4) NOT NULL,\n  `from_date` date NOT NULL,\n  `to_date` date NOT NULL,\n  PRIMARY KEY (`emp_no`,`dept_no`),\n  KEY `dept_no` (`dept_no`),\n  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,\n  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT\n) ENGINE=InnoDB DEFAULT CHARSET=latin1'
DESCRIBE employees;