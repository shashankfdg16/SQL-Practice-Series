-- NULL Filtering in SQL
-- This script demonstrates how to filter rows with NULL or non-NULL values.

-- 1. Check for employees who are currently working (to_date = '9999-01-01' in dept_emp)
SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01';

mysql> SELECT e.emp_no, e.first_name, e.last_name FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no WHERE de.to_date = '9999-01-01' LIMIT 10;
+--------+------------+-----------+
| emp_no | first_name | last_name |
+--------+------------+-----------+
|  10001 | Georgi     | Facello   |
|  10002 | Bezalel    | Simmel    |
|  10003 | Parto      | Bamford   |
|  10004 | Chirstian  | Koblick   |
|  10005 | Kyoichi    | Maliniak  |
|  10006 | Anneke     | Preusig   |
|  10007 | Tzvetan    | Zielinski |
|  10009 | Sumant     | Peac      |
|  10010 | Duangkaew  | Piveteau  |
|  10012 | Patricio   | Bridgland |
+--------+------------+-----------+
--10 rows in set (0.00 sec)

-- 2. Check for employees who have left the company (to_date != '9999-01-01' in dept_emp)
SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE de.to_date != '9999-01-01';

mysql> SELECT e.emp_no, e.first_name, e.last_name FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no WHERE de.to_date != '9999-01-01' LIMIT 10;
+--------+------------+-----------+
| emp_no | first_name | last_name |
+--------+------------+-----------+
|  10008 | Saniya     | Kalloufi  |
|  10010 | Duangkaew  | Piveteau  |
|  10011 | Mary       | Sluis     |
|  10015 | Guoxiang   | Nooteboom |
|  10018 | Kazuhide   | Peha      |
|  10021 | Ramzi      | Erde      |
|  10025 | Prasadram  | Heyers    |
|  10028 | Domenick   | Tempesti  |
|  10029 | Otmar      | Herbst    |
|  10033 | Arif       | Merlo     |
+--------+------------+-----------+
--10 rows in set (0.00 sec)

-- 3. In the salaries table, show records where to_date is NULL (unlikely but structurally valid)
SELECT emp_no, salary
FROM salaries
WHERE to_date IS NULL;

mysql> SELECT emp_no, salary FROM salaries WHERE to_date IS NULL LIMIT 10;
Empty set (2.12 sec)

-- 4. Show salary records that have a valid end date (to_date IS NOT NULL)
SELECT emp_no, salary, to_date
FROM salaries
WHERE to_date IS NOT NULL;

mysql> SELECT emp_no, salary, to_date FROM salaries WHERE to_date IS NOT NULL LIMIT 10;
+--------+--------+------------+
| emp_no | salary | to_date    |
+--------+--------+------------+
|  10001 |  60117 | 1987-06-26 |
|  10001 |  62102 | 1988-06-25 |
|  10001 |  66074 | 1989-06-25 |
|  10001 |  66596 | 1990-06-25 |
|  10001 |  66961 | 1991-06-25 |
|  10001 |  71046 | 1992-06-24 |
|  10001 |  74333 | 1993-06-24 |
|  10001 |  75286 | 1994-06-24 |
|  10001 |  75994 | 1995-06-24 |
|  10001 |  76884 | 1996-06-23 |
+--------+--------+------------+
--10 rows in set (0.00 sec)

-- Notes:
-- - Use IS NULL / IS NOT NULL only for NULL checks (NOT = NULL!)
-- - Don't use equality/inequality operators with NULL. They won't work:
--     ❌ salary = NULL   (wrong)
--     ✅ salary IS NULL  (correct)

-- BONUS: Find employees without a middle name (assuming middle_name column exists)
-- SELECT emp_no, first_name FROM employees WHERE middle_name IS NULL;
