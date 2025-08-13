/*Salary Distribution Report
---------------------------------
This query groups salaries into fixed ranges ("buckets") to understand
how employees are distributed across pay bands. It uses FLOOR() to
bucketize salaries, a window function to calculate percentage distribution,
and LPAD() for formatting alignment.
*/

-- Example Query 1: Salary distribution for Sales department
SELECT  
    d.dept_name,  
    FLOOR(s.salary/10000)*10000 AS Salary_Bucket,  
    COUNT(*) AS Employees,  
    LPAD(
        CONCAT(ROUND(100*COUNT(*)/SUM(COUNT(*)) OVER (PARTITION BY d.dept_name), 1), '%'),
        6,
        ' '
    ) AS Distribution  
FROM departments d  
JOIN dept_emp de ON d.dept_no = de.dept_no  
JOIN salaries s ON de.emp_no = s.emp_no  
WHERE s.to_date > CURDATE()  
  AND d.dept_name = 'Sales'  
GROUP BY d.dept_name, Salary_Bucket  
ORDER BY Salary_Bucket;

mysql> SELECT d.dept_name, FLOOR(s.salary/10000)*10000 AS Salary_Bucket, COUNT(*) AS Employees, LPAD(CONCAT(ROUND(100*COUNT(*)/SUM(COUNT(*)) OVER (PARTITION BY d.dept_name), 1), '%'), 6, ' ') AS Distribution FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN salaries s ON de.emp_no = s.emp_no WHERE s.to_date > CURDATE() AND d.dept_name = 'Sales' GROUP BY d.dept_name, Salary_Bucket ORDER BY Salary_Bucket;
+-----------+---------------+-----------+--------------+
| dept_name | Salary_Bucket | Employees | Distribution |
+-----------+---------------+-----------+--------------+
| Sales     |         30000 |         1 |   0.0%       |
| Sales     |         40000 |       446 |   1.1%       |
| Sales     |         50000 |      1642 |   3.9%       |
| Sales     |         60000 |      4141 |   9.9%       |
| Sales     |         70000 |      7126 |  17.0%       |
| Sales     |         80000 |      8959 |  21.3%       |
| Sales     |         90000 |      8485 |  20.2%       |
| Sales     |        100000 |      6116 |  14.6%       |
| Sales     |        110000 |      3334 |   7.9%       |
| Sales     |        120000 |      1290 |   3.1%       |
| Sales     |        130000 |       375 |   0.9%       |
| Sales     |        140000 |        70 |   0.2%       |
| Sales     |        150000 |        15 |   0.0%       |
+-----------+---------------+-----------+--------------+
13 rows in set (3.85 sec)

-- Example Query 2: Salary distribution for Marketing department
SELECT  
    d.dept_name,  
    FLOOR(s.salary/10000)*10000 AS Salary_Bucket,  
    COUNT(*) AS Employees,  
    LPAD(CONCAT(ROUND(100*COUNT(*)/SUM(COUNT(*)) OVER (PARTITION BY d.dept_name), 1), '%'), 5, ' ') AS Distribution  
FROM departments d  
JOIN dept_emp de ON d.dept_no = de.dept_no  
JOIN salaries s ON de.emp_no = s.emp_no  
WHERE s.to_date > CURDATE()  
  AND d.dept_name = 'Marketing'  
GROUP BY d.dept_name, Salary_Bucket  
ORDER BY Salary_Bucket;


mysql> SELECT d.dept_name, FLOOR(s.salary/10000)*10000 AS Salary_Bucket, COUNT(*) AS Employees, LPAD(CONCAT(ROUND(100*COUNT(*)/SUM(COUNT(*)) OVER (PARTITION BY d.dept_name), 1), '%'), 5) AS Distribution FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN salaries s ON de.emp_no = s.emp_no WHERE s.to_date > CURDATE() AND d.dept_name = 'Marketing' GROUP BY d.dept_name, Salary_Bucket ORDER BY Salary_Bucket;
ERROR 1582 (42000): Incorrect parameter count in the call to native function 'LPAD'
mysql> SELECT d.dept_name, FLOOR(s.salary/10000)*10000 AS Salary_Bucket, COUNT(*) AS Employees, LPAD(CONCAT(ROUND(100*COUNT(*)/SUM(COUNT(*)) OVER (PARTITION BY d.dept_name), 1), '%'), 5, ' ') AS Distribution FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN salaries s ON de.emp_no = s.emp_no WHERE s.to_date > CURDATE() AND d.dept_name = 'Marketing' GROUP BY d.dept_name, Salary_Bucket ORDER BY Salary_Bucket;
+-----------+---------------+-----------+--------------+
| dept_name | Salary_Bucket | Employees | Distribution |
+-----------+---------------+-----------+--------------+
| Marketing |         30000 |         3 |  0.0%        |
| Marketing |         40000 |       524 |  3.2%        |
| Marketing |         50000 |      1590 |  9.8%        |
| Marketing |         60000 |      2798 | 17.2%        |
| Marketing |         70000 |      3577 | 22.0%        |
| Marketing |         80000 |      3102 | 19.1%        |
| Marketing |         90000 |      2485 | 15.3%        |
| Marketing |        100000 |      1360 |  8.4%        |
| Marketing |        110000 |       592 |  3.6%        |
| Marketing |        120000 |       181 |  1.1%        |
| Marketing |        130000 |        33 |  0.2%        |
| Marketing |        140000 |         7 |  0.0%        |
+-----------+---------------+-----------+--------------+
12 rows in set (0.46 sec)
