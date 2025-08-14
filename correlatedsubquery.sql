-- ------------------------------------------------------------
-- Correlated Subquery — Current Salary
-- ------------------------------------------------------------
-- This section demonstrates the use of correlated subqueries
-- to retrieve the current salary of employees.
-- The subquery references the outer query for filtering
-- based on employee number.

-- Example Query 1: Current salary for employees in a specific range
SELECT  
    e.emp_no, 
    e.first_name, 
    (SELECT salary  
     FROM salaries s  
     WHERE s.emp_no = e.emp_no  
       AND s.to_date > CURDATE() 
    ) AS current_salary 
FROM employees e 
WHERE e.emp_no BETWEEN 10001 AND 10010;

mysql> SELECT e.emp_no, e.first_name, (SELECT salary FROM salaries s WHERE s.emp_no = e.emp_no AND s.to_date > CURDATE()) AS current_salary FROM employees e WHERE e.emp_no BETWEEN 10001 AND 10010;
+--------+------------+----------------+
| emp_no | first_name | current_salary |
+--------+------------+----------------+
|  10001 | Georgi     |          88958 |
|  10002 | Bezalel    |          72527 |
|  10003 | Parto      |          43311 |
|  10004 | Chirstian  |          74057 |
|  10005 | Kyoichi    |          94692 |
|  10006 | Anneke     |          59755 |
|  10007 | Tzvetan    |          88070 |
|  10008 | Saniya     |           NULL |
|  10009 | Sumant     |          94409 |
|  10010 | Duangkaew  |          80324 |
+--------+------------+----------------+
10 rows in set (0.07 sec)

-- Example Query 2: Current salary of employees in 'Sales'
SELECT  
    e.emp_no, 
    CONCAT(e.first_name, ' ', e.last_name) AS name, 
    (SELECT salary  
     FROM salaries s  
     WHERE s.emp_no = e.emp_no  
       AND s.to_date > CURDATE()
    ) AS current_salary
FROM employees e
JOIN dept_emp de 
    ON e.emp_no = de.emp_no
JOIN departments d 
    ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
  AND de.to_date > CURDATE()
LIMIT 5;

mysql> SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS name, (SELECT salary FROM salaries s WHERE s.emp_no = e.emp_no AND s.to_date > CURDATE()) AS current_salary FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no JOIN departments d ON de.dept_no = d.dept_no WHERE d.dept_name = 'Sales' AND de.to_date > CURDATE() LIMIT 5;
+--------+----------------------+----------------+
| emp_no | name                 | current_salary |
+--------+----------------------+----------------+
|  10002 | Bezalel Simmel       |          72527 |
|  10016 | Kazuhito Cappelletti |          77935 |
|  10041 | Uri Lenart           |          81705 |
|  10050 | Yinghua Dredge       |          97830 |
|  10053 | Sanjiv Zschoche      |          78478 |
+--------+----------------------+----------------+
5 rows in set (0.06 sec)

-- Example Query 3: Current salary of employees hired after 2000
SELECT  
    e.emp_no, 
    CONCAT(e.first_name, ' ', e.last_name) AS name, 
    e.hire_date,
    (SELECT salary  
     FROM salaries s  
     WHERE s.emp_no = e.emp_no  
       AND s.to_date > CURDATE()
    ) AS current_salary
FROM employees e
WHERE e.hire_date > '2000-01-01'
LIMIT 5;

mysql> SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS name, e.hire_date, (SELECT salary FROM salaries s WHERE s.emp_no = e.emp_no AND s.to_date > CURDATE()) AS current_salary FROM employees e WHERE e.hire_date > '2000-01-01' LIMIT 5;
+--------+----------------+------------+----------------+
| emp_no | name           | hire_date  | current_salary |
+--------+----------------+------------+----------------+
|  47291 | Ulf Flexer     | 2000-01-12 |          52206 |
|  60134 | Seshu Rathonyi | 2000-01-02 |           NULL |
|  72329 | Randi Luit     | 2000-01-02 |          44619 |
| 205048 | Ennio Alblas   | 2000-01-06 |          80596 |
| 222965 | Volkmar Perko  | 2000-01-13 |          52953 |
+--------+----------------+------------+----------------+
5 rows in set (0.28 sec)

