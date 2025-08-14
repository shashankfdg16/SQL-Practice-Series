-- ------------------------------------------------------------
-- Complex Scenario — Department Gender Ratios
-- ------------------------------------------------------------
-- This section demonstrates how to calculate gender ratios
-- per department using conditional aggregation.
-- We use SUM(IF(...)) to count by gender and ROUND to show
-- percentages.

-- Example Query 1: Gender ratio for departments with more than 10,000 employees
SELECT  
    d.dept_name, 
    ROUND(100 * SUM(IF(e.gender = 'F', 1, 0)) / COUNT(*), 1) AS female_pct, 
    ROUND(100 * SUM(IF(e.gender = 'M', 1, 0)) / COUNT(*), 1) AS male_pct
FROM departments d
JOIN dept_emp de 
    ON d.dept_no = de.dept_no
JOIN employees e 
    ON de.emp_no = e.emp_no
WHERE de.to_date > CURDATE()
GROUP BY d.dept_name
HAVING COUNT(*) > 10000;

mysql> SELECT d.dept_name, ROUND(100 * SUM(IF(e.gender = 'F', 1, 0)) / COUNT(*), 1) AS female_pct, ROUND(100 * SUM(IF(e.gender = 'M', 1, 0)) / COUNT(*), 1) AS male_pct FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN employees e ON de.emp_no = e.emp_no WHERE de.to_date > CURDATE() GROUP BY d.dept_name HAVING COUNT(*) > 10000;
+--------------------+------------+----------+
| dept_name          | female_pct | male_pct |
+--------------------+------------+----------+
| Customer Service   |       39.9 |     60.1 |
| Development        |       40.0 |     60.0 |
| Finance            |       40.3 |     59.7 |
| Human Resources    |       39.9 |     60.1 |
| Marketing          |       39.5 |     60.5 |
| Production         |       40.1 |     59.9 |
| Quality Management |       40.4 |     59.6 |
| Research           |       40.0 |     60.0 |
| Sales              |       39.8 |     60.2 |
+--------------------+------------+----------+
9 rows in set (5.01 sec)

-- Example Query 2: Gender ratio in 'Sales' department
SELECT  
    d.dept_name, 
    ROUND(100 * SUM(IF(e.gender = 'F', 1, 0)) / COUNT(*), 1) AS female_pct, 
    ROUND(100 * SUM(IF(e.gender = 'M', 1, 0)) / COUNT(*), 1) AS male_pct
FROM departments d
JOIN dept_emp de 
    ON d.dept_no = de.dept_no
JOIN employees e 
    ON de.emp_no = e.emp_no
WHERE de.to_date > CURDATE()
  AND d.dept_name = 'Sales'
GROUP BY d.dept_name;

mysql> SELECT d.dept_name, ROUND(100 * SUM(IF(e.gender = 'F', 1, 0)) / COUNT(*), 1) AS female_pct, ROUND(100 * SUM(IF(e.gender = 'M', 1, 0)) / COUNT(*), 1) AS male_pct FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN employees e ON de.emp_no = e.emp_no WHERE de.to_date > CURDATE() AND d.dept_name = 'Sales' GROUP BY d.dept_name;
+-----------+------------+----------+
| dept_name | female_pct | male_pct |
+-----------+------------+----------+
| Sales     |       39.8 |     60.2 |
+-----------+------------+----------+
1 row in set (0.48 sec)

-- Example Query 3: Departments with female percentage greater than 50%
SELECT  
    d.dept_name, 
    ROUND(100 * SUM(IF(e.gender = 'F', 1, 0)) / COUNT(*), 1) AS female_pct
FROM departments d
JOIN dept_emp de 
    ON d.dept_no = de.dept_no
JOIN employees e 
    ON de.emp_no = e.emp_no
WHERE de.to_date > CURDATE()
GROUP BY d.dept_name
HAVING female_pct > 50;

mysql> SELECT d.dept_name, ROUND(100 * SUM(IF(e.gender = 'F', 1, 0)) / COUNT(*), 1) AS female_pct FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN employees e ON de.emp_no = e.emp_no WHERE de.to_date > CURDATE() GROUP BY d.dept_name HAVING female_pct > 50;
Empty set (3.00 sec)
