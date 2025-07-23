-- 1. Count how many employees are in the 'Sales' department
SELECT COUNT(*) AS sales_count
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

mysql> SELECT COUNT(*) AS sales_count FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no WHERE d.dept_name = 'Sales';
+-------------+
| sales_count |
+-------------+
|       52245 |
+-------------+
--1 row in set (0.18 sec)

-- 2. Get the minimum salary of employees in 'Sales'
SELECT MIN(s.salary) AS min_sales_salary
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE d.dept_name = 'Sales';

mysql> SELECT MIN(s.salary) AS min_sales_salary FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no JOIN salaries s ON e.emp_no = s.emp_no WHERE d.dept_name = 'Sales';
+------------------+
| min_sales_salary |
+------------------+
|            39169 |
+------------------+
--1 row in set (1.39 sec)

-- 3. Find the most recent hire date in the 'Sales' department
SELECT MAX(e.hire_date) AS latest_sales_hire
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

mysql> SELECT MAX(e.hire_date) AS latest_sales_hire FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no WHERE d.dept_name = 'Sales';
+-------------------+
| latest_sales_hire |
+-------------------+
| 2000-01-04        |
+-------------------+
--1 row in set (0.19 sec)

-- 4. Full validation in one query
SELECT 
  COUNT(*) AS total_filtered,
  MIN(s.salary) AS min_salary,
  MAX(e.hire_date) AS latest_hire
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE d.dept_name = 'Sales'
  AND e.hire_date BETWEEN '1990-01-01' AND '1999-12-31'
  AND e.last_name LIKE 'S%';

mysql> SELECT COUNT(*) AS total_filtered, MIN(s.salary) AS min_salary, MAX(e.hire_date) AS latest_hire FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no JOIN salaries s ON e.emp_no = s.emp_no WHERE d.dept_name = 'Sales' AND e.hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND e.last_name LIKE 'S%';
+----------------+------------+-------------+
| total_filtered | min_salary | latest_hire |
+----------------+------------+-------------+
|          19835 |      39511 | 1999-12-31  |
+----------------+------------+-------------+
--1 row in set (0.92 sec)
