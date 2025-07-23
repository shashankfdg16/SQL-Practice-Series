-- 1. Show marketing hires in 2023 with salaries > 50,000
SELECT e.first_name, e.hire_date, s.salary
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE d.dept_name = 'Marketing' AND e.hire_date >= '2023-01-01' AND s.salary > 50000;

mysql> SELECT e.first_name, e.hire_date, s.salary FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no JOIN salaries s ON e.emp_no = s.emp_no WHERE d.dept_name = 'Marketing' AND e.hire_date >= '2023-01-01' AND s.salary > 50000;
Empty set (0.11 sec)

-- 2. List all employees hired between 1995 and 2000 in the 'Development' department
SELECT e.emp_no, e.first_name, e.hire_date
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Development' AND e.hire_date BETWEEN '1995-01-01' AND '2000-12-31';

mysql> SELECT e.emp_no, e.first_name, e.hire_date FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no WHERE d.dept_name = 'Development' AND e.hire_date BETWEEN '1995-01-01' AND '2000-12-31' LIMIT 10;
+--------+------------+------------+
| emp_no | first_name | hire_date  |
+--------+------------+------------+
|  10022 | Shahaf     | 1995-08-22 |
|  10139 | Ewing      | 1998-03-15 |
|  10172 | Shigeu     | 1995-10-13 |
|  10264 | Nalini     | 1997-07-16 |
|  10294 | Rutger     | 1996-04-08 |
|  10352 | Erzsebet   | 1996-01-21 |
|  10373 | Hongzue    | 1997-04-26 |
|  10379 | Mikhail    | 1996-07-15 |
|  10389 | Make       | 1995-10-31 |
|  10409 | Mario      | 1997-07-09 |
+--------+------------+------------+
10 rows in set (0.00 sec)

-- 3. Get top 5 highest paid employees in the 'Production' department
SELECT e.emp_no, e.first_name, s.salary
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE d.dept_name = 'Production'
ORDER BY s.salary DESC
LIMIT 5;

mysql> SELECT e.emp_no, e.first_name, s.salary FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no JOIN salaries s ON e.emp_no = s.emp_no WHERE d.dept_name = 'Production' ORDER BY s.salary DESC LIMIT 5;
+--------+------------+--------+
| emp_no | first_name | salary |
+--------+------------+--------+
| 430504 | Youjian    | 138273 |
| 474176 | Shimshon   | 137563 |
| 430504 | Youjian    | 136286 |
| 430504 | Youjian    | 135510 |
| 474176 | Shimshon   | 133620 |
+--------+------------+--------+
5 rows in set (2.51 sec)

-- 4. Show count of employees per department
SELECT d.dept_name, COUNT(*) AS total_employees
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY total_employees DESC;

mysql> SELECT d.dept_name, COUNT(*) AS total_employees FROM dept_emp de JOIN departments d ON de.dept_no = d.dept_no GROUP BY d.dept_name ORDER BY total_employees DESC;
+--------------------+-----------------+
| dept_name          | total_employees |
+--------------------+-----------------+
| Development        |           85707 |
| Production         |           73485 |
| Sales              |           52245 |
| Customer Service   |           23580 |
| Research           |           21126 |
| Marketing          |           20211 |
| Quality Management |           20117 |
| Human Resources    |           17786 |
| Finance            |           17346 |
+--------------------+-----------------+
9 rows in set (0.55 sec)


mysql> SELECT DATE_FORMAT(e.hire_date, '%Y-%m') AS hire_month FROM employees e LIMIT 5;
+------------+
| hire_month |
+------------+
| 1986-06    |
| 1985-11    |
| 1986-08    |
| 1986-12    |
| 1989-09    |
+------------+
5 rows in set (0.05 sec)
