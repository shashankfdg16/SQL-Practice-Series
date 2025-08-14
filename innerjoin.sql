-- ------------------------------------------------------------
-- INNER JOIN — Employee-Department Mapping
-- ------------------------------------------------------------
-- This section demonstrates different INNER JOIN use cases
-- to retrieve employee and department information.
-- All queries focus on combining data from multiple tables
-- and filtering for current assignments.

-- Example Query 1: Basic INNER JOIN with current record filtering
SELECT  
    e.emp_no,  
    CONCAT(e.first_name, ' ', e.last_name) AS name, 
    d.dept_name 
FROM employees e 
INNER JOIN dept_emp de 
    ON e.emp_no = de.emp_no 
INNER JOIN departments d 
    ON de.dept_no = d.dept_no 
WHERE de.to_date > CURDATE() 
LIMIT 5;

mysql> SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS name, d.dept_name FROM employees e INNER JOIN dept_emp de ON e.emp_no = de.emp_no INNER JOIN departments d ON de.dept_no = d.dept_no WHERE de.to_date > CURDATE() LIMIT 5;
+--------+----------------------+------------------+
| emp_no | name                 | dept_name        |
+--------+----------------------+------------------+
|  10038 | Huan Lortz           | Customer Service |
|  10049 | Basil Tramer         | Customer Service |
|  10060 | Breannda Billingsley | Customer Service |
|  10088 | Jungsoon Syrzycki    | Customer Service |
|  10112 | Yuichiro Swick       | Customer Service |
+--------+----------------------+------------------+
5 rows in set (0.26 sec)

-- Example Query 2: Retrieve employees in the 'Sales' department
SELECT  
    e.emp_no,  
    CONCAT(e.first_name, ' ', e.last_name) AS name, 
    d.dept_name 
FROM employees e 
INNER JOIN dept_emp de 
    ON e.emp_no = de.emp_no 
INNER JOIN departments d 
    ON de.dept_no = d.dept_no 
WHERE de.to_date > CURDATE()
  AND d.dept_name = 'Sales'
LIMIT 5;

mysql> SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS name, d.dept_name FROM employees e INNER JOIN dept_emp de ON e.emp_no = de.emp_no INNER JOIN departments d ON de.dept_no = d.dept_no WHERE de.to_date > CURDATE() AND d.dept_name = 'Sales' LIMIT 5;
+--------+----------------------+-----------+
| emp_no | name                 | dept_name |
+--------+----------------------+-----------+
|  10002 | Bezalel Simmel       | Sales     |
|  10016 | Kazuhito Cappelletti | Sales     |
|  10041 | Uri Lenart           | Sales     |
|  10050 | Yinghua Dredge       | Sales     |
|  10053 | Sanjiv Zschoche      | Sales     |
+--------+----------------------+-----------+
5 rows in set (0.09 sec)

-- Example Query 3: Employees hired after 1995 in 'Development'
SELECT  
    e.emp_no,  
    CONCAT(e.first_name, ' ', e.last_name) AS name, 
    d.dept_name,
    e.hire_date
FROM employees e 
INNER JOIN dept_emp de 
    ON e.emp_no = de.emp_no 
INNER JOIN departments d 
    ON de.dept_no = d.dept_no 
WHERE de.to_date > CURDATE()
  AND d.dept_name = 'Development'
  AND e.hire_date > '1995-01-01'
LIMIT 5;

mysql> SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS name, d.dept_name, e.hire_date FROM employees e INNER JOIN dept_emp de ON e.emp_no = de.emp_no INNER JOIN departments d ON de.dept_no = d.dept_no WHERE de.to_date > CURDATE() AND d.dept_name = 'Development' AND e.hire_date > '1995-01-01' LIMIT 5;
+--------+------------------+-------------+------------+
| emp_no | name             | dept_name   | hire_date  |
+--------+------------------+-------------+------------+
|  10022 | Shahaf Famili    | Development | 1995-08-22 |
|  10139 | Ewing Foong      | Development | 1998-03-15 |
|  10264 | Nalini Kawashimo | Development | 1997-07-16 |
|  10352 | Erzsebet Ohori   | Development | 1996-01-21 |
|  10373 | Hongzue Heijenga | Development | 1997-04-26 |
+--------+------------------+-------------+------------+
5 rows in set (0.02 sec)
