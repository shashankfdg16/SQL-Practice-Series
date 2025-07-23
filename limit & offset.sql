-- LIMIT and OFFSET in SQL (MySQL)
-- This script demonstrates how to restrict and paginate results using LIMIT and OFFSET.

-- 1. Get the first 5 employees by hire date
SELECT emp_no, first_name, hire_date
FROM employees
ORDER BY hire_date ASC
LIMIT 5;

mysql> SELECT emp_no, first_name, hire_date FROM employees ORDER BY hire_date ASC LIMIT 5;
+--------+------------+------------+
| emp_no | first_name | hire_date  |
+--------+------------+------------+
| 110022 | Margareta  | 1985-01-01 |
| 110511 | DeForest   | 1985-01-01 |
| 110303 | Krassimir  | 1985-01-01 |
| 110085 | Ebru       | 1985-01-01 |
| 110183 | Shirish    | 1985-01-01 |
+--------+------------+------------+
--5 rows in set (0.28 sec)

  
-- 2. Get the next 5 employees (pagination: page 2)
SELECT emp_no, first_name, hire_date
FROM employees
ORDER BY hire_date ASC
LIMIT 5 OFFSET 5;

mysql> SELECT emp_no, first_name, hire_date FROM employees ORDER BY hire_date ASC LIMIT 5 OFFSET 5;
+--------+------------+------------+
| emp_no | first_name | hire_date  |
+--------+------------+------------+
| 110303 | Krassimir  | 1985-01-01 |
| 111400 | Arie       | 1985-01-01 |
| 110022 | Margareta  | 1985-01-01 |
| 110183 | Shirish    | 1985-01-01 |
| 110114 | Isamu      | 1985-01-14 |
+--------+------------+------------+
--5 rows in set (0.29 sec)

-- 3. Top 10 highest paid employees in the company
SELECT e.emp_no, e.first_name, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY s.salary DESC
LIMIT 10;

-- 4. Skip top 10 salaries and show next 5 (for pagination)
SELECT e.emp_no, e.first_name, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY s.salary DESC
LIMIT 5 OFFSET 10;

mysql> SELECT e.emp_no, e.first_name, s.salary FROM employees e JOIN salaries s ON e.emp_no = s.emp_no ORDER BY s.salary DESC LIMIT 5 OFFSET 10;
+--------+------------+--------+
| emp_no | first_name | salary |
+--------+------------+--------+
| 493158 | Lidong     | 154376 |
| 253939 | Sanjai     | 154227 |
| 205000 | Charmane   | 153715 |
|  43624 | Tokuyasu   | 153458 |
|  43624 | Tokuyasu   | 153166 |
+--------+------------+--------+
--5 rows in set (4.56 sec)

-- Notes:
-- - LIMIT n: returns n rows.
-- - LIMIT n OFFSET m: skips m rows and returns next n.
-- - Useful for paging, dashboards, and UI lists.

-- Bonus: Show employees in 'Sales' department, page 1 (first 5)
SELECT e.emp_no, e.first_name, s.salary
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN (
    SELECT emp_no, MAX(salary) AS salary
    FROM salaries
    GROUP BY emp_no
) s ON e.emp_no = s.emp_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no
LIMIT 5;

mysql> SELECT e.emp_no, e.first_name, s.salary FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no JOIN salaries s ON e.emp_no = s.emp_no WHERE d.dept_name = 'Sales' ORDER BY e.emp_no LIMIT 5;
+--------+------------+--------+
| emp_no | first_name | salary |
+--------+------------+--------+
|  10002 | Bezalel    |  65828 |
|  10002 | Bezalel    |  65909 |
|  10002 | Bezalel    |  67534 |
|  10002 | Bezalel    |  69366 |
|  10002 | Bezalel    |  71963 |
+--------+------------+--------+
--5 rows in set (0.01 sec)

-- Page 2 (next 5 Sales employees)
SELECT e.emp_no, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no
LIMIT 5 OFFSET 5;

mysql> SELECT e.emp_no, e.first_name, d.dept_name FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no WHERE d.dept_name = 'Sales' ORDER BY e.emp_no LIMIT 5 OFFSET 5;
+--------+------------+-----------+
| emp_no | first_name | dept_name |
+--------+------------+-----------+
|  10053 | Sanjiv     | Sales     |
|  10060 | Breannda   | Sales     |
|  10061 | Tse        | Sales     |
|  10068 | Charlene   | Sales     |
|  10087 | Xinglin    | Sales     |
+--------+------------+-----------+
--5 rows in set (0.30 sec)
