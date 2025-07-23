-- Sorting in SQL
-- This script demonstrates how to use ORDER BY to sort query results.

-- 1. Sort by first name in ascending order (A–Z)
SELECT emp_no, first_name, last_name
FROM employees
ORDER BY first_name ASC LIMIT 10;

mysql> SELECT emp_no, first_name, last_name FROM employees order by hire_date DESC limit 10;
+--------+------------+------------+
| emp_no | first_name | last_name  |
+--------+------------+------------+
| 463807 | Bikash     | Covnot     |
| 428377 | Yucai      | Gerlach    |
| 499553 | Hideyuki   | Delgrande  |
| 222965 | Volkmar    | Perko      |
|  47291 | Ulf        | Flexer     |
| 422990 | Jaana      | Verspoor   |
| 227544 | Shahab     | Demeyer    |
| 205048 | Ennio      | Alblas     |
| 226633 | Xuejun     | Benzmuller |
| 424445 | Jeong      | Boreale    |
+--------+------------+------------+
--10 rows in set (0.46 sec)

-- 2. Sort by hire date in descending order (latest hires first)
SELECT emp_no, first_name, hire_date
FROM employees
ORDER BY hire_date DESC; --you can a limit to avoid overflow of result ex:LIMIT 10;

mysql> SELECT emp_no, first_name, hire_date FROM employees ORDER BY hire_date DESC LIMIT 10;
+--------+------------+------------+
| emp_no | first_name | hire_date  |
+--------+------------+------------+
| 463807 | Bikash     | 2000-01-28 |
| 428377 | Yucai      | 2000-01-23 |
| 499553 | Hideyuki   | 2000-01-22 |
| 222965 | Volkmar    | 2000-01-13 |
|  47291 | Ulf        | 2000-01-12 |
| 422990 | Jaana      | 2000-01-11 |
| 227544 | Shahab     | 2000-01-08 |
| 205048 | Ennio      | 2000-01-06 |
| 226633 | Xuejun     | 2000-01-04 |
| 424445 | Jeong      | 2000-01-03 |
+--------+------------+------------+
--10 rows in set (0.28 sec)

  
-- 3. Sort by department (A–Z), then by salary in descending order
SELECT e.emp_no, e.first_name, d.dept_name, s.salary
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY d.dept_name ASC, s.salary DESC
LIMIT 10;

mysql> SELECT e.emp_no, e.first_name, d.dept_name, s.salary FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no JOIN salaries s ON e.emp_no = s.emp_no ORDER BY d.dept_name ASC, s.salary DESC LIMIT 10;
+--------+------------+------------------+--------+
| emp_no | first_name | dept_name        | salary |
+--------+------------+------------------+--------+
|  18006 | Vidya      | Customer Service | 144866 |
|  98169 | Bedrich    | Customer Service | 144088 |
|  96957 | Odoardo    | Customer Service | 143950 |
| 432583 | Seongbin   | Customer Service | 143937 |
|  98169 | Bedrich    | Customer Service | 143832 |
|  98169 | Bedrich    | Customer Service | 143060 |
|  96957 | Odoardo    | Customer Service | 142654 |
|  98169 | Bedrich    | Customer Service | 142600 |
|  18006 | Vidya      | Customer Service | 142384 |
|  98169 | Bedrich    | Customer Service | 142350 |
+--------+------------+------------------+--------+
--10 rows in set (14.71 sec)


-- Notes:
-- - ORDER BY clause should always come after WHERE (if used).
-- - ASC is the default order, so it can be omitted.
-- - Multiple columns can be sorted with different directions.

-- Example with WHERE + ORDER BY
-- Show employees from the Sales department sorted by hire date (oldest first)
SELECT e.emp_no, e.first_name, e.hire_date, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.hire_date ASC
LIMIT 10;

mysql> SELECT e.emp_no, e.first_name, e.hire_date, d.dept_name FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no WHERE d.dept_name = 'Sales' ORDER BY e.hire_date ASC LIMIT 10;
+--------+-------------+------------+-----------+
| emp_no | first_name  | hire_date  | dept_name |
+--------+-------------+------------+-----------+
| 111035 | Przemyslawa | 1985-01-01 | Sales     |
|  87761 | Shir        | 1985-02-01 | Sales     |
|  98018 | Yongdong    | 1985-02-01 | Sales     |
| 297266 | Adil        | 1985-02-01 | Sales     |
|  33092 | Guenter     | 1985-02-02 | Sales     |
|  44157 | Erzsebet    | 1985-02-02 | Sales     |
|  89618 | Keung       | 1985-02-02 | Sales     |
|  65515 | Phillip     | 1985-02-02 | Sales     |
|  24759 | Chaosheng   | 1985-02-02 | Sales     |
|  12318 | Jingling    | 1985-02-02 | Sales     |
+--------+-------------+------------+-----------+
--10 rows in set (0.32 sec)
