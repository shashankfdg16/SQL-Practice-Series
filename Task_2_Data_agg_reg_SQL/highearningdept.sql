
High-Earning Departments (Using HAVING)
----------------------------------------------
--In SQL, the HAVING clause is used to filter groups after aggregation.
--It is different from WHERE, which filters rows before grouping.
--This query finds departments with an average salary above 70,000
--and more than 10,000 current employees.
  
  
  -- Example Query 1: Basic HAVING usage

SELECT  
    d.dept_name, 
    ROUND(AVG(s.salary)) AS avg_salary, 
    COUNT(*) AS employees
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE s.to_date > CURDATE()
GROUP BY d.dept_name
HAVING AVG(s.salary) > 70000;

mysql> SELECT d.dept_name, ROUND(AVG(s.salary)) AS avg_salary, COUNT(*) AS employees FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN salaries s ON de.emp_no = s.emp_no WHERE s.to_date > CURDATE() GROUP BY d.dept_name HAVING AVG(s.salary) > 70000;
+-----------+------------+-----------+
| dept_name | avg_salary | employees |
+-----------+------------+-----------+
| Sales     |      88842 |     42000 |
| Marketing |      80015 |     16252 |
| Finance   |      78645 |     13850 |
+-----------+------------+-----------+
3 rows in set (6.37 sec)

-- Example Query 2: Multiple conditions in HAVING
SELECT  
    d.dept_name, 
    ROUND(AVG(s.salary)) AS avg_salary, 
    COUNT(*) AS employees
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE s.to_date > CURDATE()
GROUP BY d.dept_name
HAVING AVG(s.salary) > 70000 
   AND COUNT(*) > 10000
ORDER BY avg_salary DESC;

mysql> SELECT d.dept_name, ROUND(AVG(s.salary)) AS avg_salary, COUNT(*) AS employees FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN salaries s ON de.emp_no = s.emp_no WHERE s.to_date > CURDATE() GROUP BY d.dept_name HAVING AVG(s.salary) > 70000 AND COUNT(*) > 10000 ORDER BY avg_salary DESC;
+-----------+------------+-----------+
| dept_name | avg_salary | employees |
+-----------+------------+-----------+
| Sales     |      88842 |     42000 |
| Marketing |      80015 |     16252 |
| Finance   |      78645 |     13850 |
+-----------+------------+-----------+
3 rows in set (6.04 sec)
