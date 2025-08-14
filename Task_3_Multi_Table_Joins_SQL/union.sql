-- ------------------------------------------------------------
-- UNION — Combine Active/Former Sales Employees
-- ------------------------------------------------------------
-- This section demonstrates the use of UNION and UNION ALL
-- to combine datasets with matching column structures.
-- We retrieve employees who are or have been in the 'Sales'
-- department, marking their status as Active or Former.

-- Example Query 1: Combine current and former Sales employees
SELECT  
    emp_no,  
    'Active' AS status, 
    dept_name 
FROM dept_emp de 
JOIN departments d 
    ON de.dept_no = d.dept_no 
WHERE de.to_date > CURDATE()  
  AND d.dept_name = 'Sales' 

UNION ALL

SELECT  
    emp_no,  
    'Former' AS status, 
    dept_name 
FROM dept_emp de 
JOIN departments d 
    ON de.dept_no = d.dept_no 
WHERE de.to_date <= CURDATE()  
  AND d.dept_name = 'Sales'
LIMIT 5;

mysql> SELECT emp_no, 'Active' AS status, dept_name FROM dept_emp de JOIN departments d ON de.dept_no = d.dept_no WHERE de.to_date > CURDATE() AND d.dept_name = 'Sales' UNION ALL SELECT emp_no, 'Former' AS status, dept_name FROM dept_emp de JOIN departments d ON de.dept_no = d.dept_no WHERE de.to_date <= CURDATE() AND d.dept_name = 'Sales' LIMIT 5;
+--------+--------+-----------+
| emp_no | status | dept_name |
+--------+--------+-----------+
|  10002 | Active | Sales     |
|  10016 | Active | Sales     |
|  10041 | Active | Sales     |
|  10050 | Active | Sales     |
|  10053 | Active | Sales     |
+--------+--------+-----------+
5 rows in set (0.01 sec)

-- Example Query 2: Unique list (remove duplicates) of Sales employees (past or present)
SELECT  
    emp_no,  
    dept_name 
FROM dept_emp de 
JOIN departments d 
    ON de.dept_no = d.dept_no 
WHERE d.dept_name = 'Sales'
  AND de.to_date > CURDATE()

UNION

SELECT  
    emp_no,  
    dept_name 
FROM dept_emp de 
JOIN departments d 
    ON de.dept_no = d.dept_no 
WHERE d.dept_name = 'Sales'
  AND de.to_date <= CURDATE()
LIMIT 5;

mysql> SELECT emp_no, dept_name FROM dept_emp de JOIN departments d ON de.dept_no = d.dept_no WHERE d.dept_name = 'Sales' AND de.to_date > CURDATE() UNION SELECT emp_no, dept_name FROM dept_emp de JOIN departments d ON de.dept_no = d.dept_no WHERE d.dept_name = 'Sales' AND de.to_date <= CURDATE() LIMIT 5;
+--------+-----------+
| emp_no | dept_name |
+--------+-----------+
|  10002 | Sales     |
|  10016 | Sales     |
|  10041 | Sales     |
|  10050 | Sales     |
|  10053 | Sales     |
+--------+-----------+
5 rows in set (0.01 sec)

-- Example Query 3: Combine current 'Development' and current 'Sales' employees
SELECT  
    emp_no,  
    'Development' AS dept_group 
FROM dept_emp de 
JOIN departments d 
    ON de.dept_no = d.dept_no 
WHERE de.to_date > CURDATE()  
  AND d.dept_name = 'Development' 

UNION ALL

SELECT  
    emp_no,  
    'Sales' AS dept_group 
FROM dept_emp de 
JOIN departments d 
    ON de.dept_no = d.dept_no 
WHERE de.to_date > CURDATE()  
  AND d.dept_name = 'Sales'
LIMIT 5;
mysql> SELECT emp_no, 'Development' AS dept_group FROM dept_emp de JOIN departments d ON de.dept_no = d.dept_no WHERE de.to_date > CURDATE() AND d.dept_name = 'Development' UNION ALL SELECT emp_no, 'Sales' AS dept_group FROM dept_emp de JOIN departments d ON de.dept_no = d.dept_no WHERE de.to_date > CURDATE() AND d.dept_name = 'Sales' LIMIT 5;
+--------+-------------+
| emp_no | dept_group  |
+--------+-------------+
|  10001 | Development |
|  10006 | Development |
|  10012 | Development |
|  10014 | Development |
|  10022 | Development |
+--------+-------------+
5 rows in set (0.02 sec)
