-- ------------------------------------------------------------
-- LEFT JOIN — Employees with Manager Info
-- ------------------------------------------------------------
-- This section demonstrates how to use LEFT JOIN to retrieve
-- employees along with their manager's information.
-- LEFT JOIN ensures that employees without a manager record
-- are still included in the result.

-- Example Query 1: Basic LEFT JOIN with current manager info
SELECT  
    e.emp_no, 
    CONCAT(e.first_name, ' ', e.last_name) AS employee, 
    CONCAT(m.first_name, ' ', m.last_name) AS manager 
FROM employees e 
LEFT JOIN dept_manager dm 
    ON dm.dept_no = (
        SELECT dept_no  
        FROM dept_emp  
        WHERE emp_no = e.emp_no  
          AND to_date > CURDATE() 
    ) 
LEFT JOIN employees m 
    ON dm.emp_no = m.emp_no 
WHERE dm.to_date > CURDATE() 
LIMIT 5;

mysql> SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS employee, CONCAT(m.first_name, ' ', m.last_name) AS manager FROM employees e LEFT JOIN dept_manager dm ON dm.dept_no = (SELECT dept_no FROM dept_emp WHERE emp_no = e.emp_no AND to_date > CURDATE()) LEFT JOIN employees m ON dm.emp_no = m.emp_no WHERE dm.to_date > CURDATE() LIMIT 5;
+--------+-------------------+-----------------+
| emp_no | employee          | manager         |
+--------+-------------------+-----------------+
|  10001 | Georgi Facello    | Leon DasSarma   |
|  10002 | Bezalel Simmel    | Hauke Zhang     |
|  10003 | Parto Bamford     | Oscar Ghazalie  |
|  10004 | Chirstian Koblick | Oscar Ghazalie  |
|  10005 | Kyoichi Maliniak  | Karsten Sigstam |
+--------+-------------------+-----------------+
5 rows in set (0.09 sec)

-- Example Query 2: Employees without a manager assigned
SELECT  
    e.emp_no, 
    CONCAT(e.first_name, ' ', e.last_name) AS employee, 
    IFNULL(CONCAT(m.first_name, ' ', m.last_name), 'No Manager') AS manager 
FROM employees e 
LEFT JOIN dept_manager dm 
    ON dm.dept_no = (
        SELECT dept_no  
        FROM dept_emp  
        WHERE emp_no = e.emp_no  
          AND to_date > CURDATE() 
    ) 
LEFT JOIN employees m 
    ON dm.emp_no = m.emp_no 
WHERE dm.to_date IS NULL 
LIMIT 5;

mysql> SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS employee, IFNULL(CONCAT(m.first_name, ' ', m.last_name), 'No Manager') AS manager FROM employees e LEFT JOIN dept_manager dm ON dm.dept_no = (SELECT dept_no FROM dept_emp WHERE emp_no = e.emp_no AND to_date > CURDATE()) LEFT JOIN employees m ON dm.emp_no = m.emp_no WHERE dm.to_date IS NULL LIMIT 5;
+--------+--------------------+------------+
| emp_no | employee           | manager    |
+--------+--------------------+------------+
|  10008 | Saniya Kalloufi    | No Manager |
|  10011 | Mary Sluis         | No Manager |
|  10015 | Guoxiang Nooteboom | No Manager |
|  10021 | Ramzi Erde         | No Manager |
|  10025 | Prasadram Heyers   | No Manager |
+--------+--------------------+------------+
5 rows in set (0.05 sec)

-- Example Query 3: Current employees with manager info in 'Sales'
SELECT  
    e.emp_no, 
    CONCAT(e.first_name, ' ', e.last_name) AS employee, 
    CONCAT(m.first_name, ' ', m.last_name) AS manager, 
    d.dept_name
FROM employees e 
LEFT JOIN dept_manager dm 
    ON dm.dept_no = (
        SELECT dept_no  
        FROM dept_emp  
        WHERE emp_no = e.emp_no  
          AND to_date > CURDATE() 
    ) 
LEFT JOIN employees m 
    ON dm.emp_no = m.emp_no 
LEFT JOIN departments d 
    ON dm.dept_no = d.dept_no
WHERE dm.to_date > CURDATE()
  AND d.dept_name = 'Sales'
LIMIT 5;

mysql> SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS employee, CONCAT(m.first_name, ' ', m.last_name) AS manager, d.dept_name FROM employees e LEFT JOIN dept_manager dm ON dm.dept_no = (SELECT dept_no FROM dept_emp WHERE emp_no = e.emp_no AND to_date > CURDATE()) LEFT JOIN employees m ON dm.emp_no = m.emp_no LEFT JOIN departments d ON dm.dept_no = d.dept_no WHERE dm.to_date > CURDATE() AND d.dept_name = 'Sales' LIMIT 5;
+--------+----------------------+-------------+-----------+
| emp_no | employee             | manager     | dept_name |
+--------+----------------------+-------------+-----------+
|  10002 | Bezalel Simmel       | Hauke Zhang | Sales     |
|  10016 | Kazuhito Cappelletti | Hauke Zhang | Sales     |
|  10041 | Uri Lenart           | Hauke Zhang | Sales     |
|  10050 | Yinghua Dredge       | Hauke Zhang | Sales     |
|  10053 | Sanjiv Zschoche      | Hauke Zhang | Sales     |
+--------+----------------------+-------------+-----------+
5 rows in set (0.00 sec)
