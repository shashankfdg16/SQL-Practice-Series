-- Task 2 – Topic 1: Department Salary Summary
-- Objective: Show total employees, average, min, max salaries, and salary range per department

SELECT  
    d.dept_name AS Department, 
    COUNT(DISTINCT e.emp_no) AS Employees, 
    ROUND(AVG(s.salary), 2) AS Avg_Salary, 
    FORMAT(MIN(s.salary), 0) AS Min_Salary, 
    FORMAT(MAX(s.salary), 0) AS Max_Salary, 
    FORMAT(MAX(s.salary) - MIN(s.salary), 0) AS Salary_Range 
FROM departments d 
JOIN dept_emp de ON d.dept_no = de.dept_no 
JOIN employees e ON de.emp_no = e.emp_no 
JOIN salaries s ON e.emp_no = s.emp_no 
WHERE de.to_date > CURDATE()  
  AND s.to_date > CURDATE() 
GROUP BY d.dept_name 
ORDER BY Avg_Salary DESC;

mysql> SELECT d.dept_name AS Department, COUNT(DISTINCT e.emp_no) AS Employees, ROUND(AVG(s.salary), 2) AS Avg_Salary, FORMAT(MIN(s.salary), 0) AS Min_Salary, FORMAT(MAX(s.salary), 0) AS Max_Salary, FORMAT(MAX(s.salary) - MIN(s.salary), 0) AS Salary_Range FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN employees e ON de.emp_no = e.emp_no JOIN salaries s ON e.emp_no = s.emp_no WHERE de.to_date > CURDATE() AND s.to_date > CURDATE() GROUP BY d.dept_name ORDER BY Avg_Salary DESC;
+--------------------+-----------+------------+------------+------------+--------------+
| Department         | Employees | Avg_Salary | Min_Salary | Max_Salary | Salary_Range |
+--------------------+-----------+------------+------------+------------+--------------+
| Sales              |     37701 |   88852.97 | 39,426     | 158,220    | 118,794      |
| Marketing          |     14842 |   80058.85 | 39,821     | 145,128    | 105,307      |
| Finance            |     12437 |   78559.94 | 39,012     | 142,395    | 103,383      |
| Research           |     15441 |   67913.38 | 39,186     | 130,211    | 91,025       |
| Production         |     53304 |   67843.30 | 38,623     | 138,273    | 99,650       |
| Development        |     61386 |   67657.92 | 39,036     | 144,434    | 105,398      |
| Customer Service   |     17569 |   67285.23 | 39,373     | 144,866    | 105,493      |
| Quality Management |     14546 |   65441.99 | 38,942     | 132,103    | 93,161       |
| Human Resources    |     12898 |   63921.90 | 38,936     | 141,953    | 103,017      |
+--------------------+-----------+------------+------------+------------+--------------+
9 rows in set (19.98 sec)


--example to approximate median salary of all depts
SELECT * FROM (
  SELECT d.dept_name, s.salary,
         ROW_NUMBER() OVER (PARTITION BY d.dept_name ORDER BY s.salary) AS rn,
         COUNT(*) OVER (PARTITION BY d.dept_name) AS total
  FROM departments d
  JOIN dept_emp de ON d.dept_no = de.dept_no
  JOIN salaries s ON de.emp_no = s.emp_no
  WHERE s.to_date > CURDATE() AND de.to_date > CURDATE()
) AS ranked
WHERE rn IN (FLOOR(total/2), CEIL(total/2));

mysql> SELECT * FROM (SELECT d.dept_name, s.salary, ROW_NUMBER() OVER (PARTITION BY d.dept_name ORDER BY s.salary) AS rn, COUNT(*) OVER (PARTITION BY d.dept_name) AS total FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN salaries s ON de.emp_no = s.emp_no WHERE s.to_date > CURDATE() AND de.to_date > CURDATE()) AS ranked WHERE rn IN (FLOOR(total/2), CEIL(total/2));
+--------------------+--------+-------+-------+
| dept_name          | salary | rn    | total |
+--------------------+--------+-------+-------+
| Customer Service   |  65146 |  8784 | 17569 |
| Customer Service   |  65149 |  8785 | 17569 |
| Development        |  66449 | 30693 | 61386 |
| Finance            |  77852 |  6218 | 12437 |
| Finance            |  77858 |  6219 | 12437 |
| Human Resources    |  62810 |  6449 | 12898 |
| Marketing          |  79125 |  7421 | 14842 |
| Production         |  66725 | 26652 | 53304 |
| Quality Management |  64381 |  7273 | 14546 |
| Research           |  66664 |  7720 | 15441 |
| Research           |  66667 |  7721 | 15441 |
| Sales              |  88515 | 18850 | 37701 |
| Sales              |  88516 | 18851 | 37701 |
+--------------------+--------+-------+-------+
13 rows in set (10.87 sec)


--example Gender-Wise Salary Summary (Department + Gender)

SELECT d.dept_name AS Department, e.gender,
       COUNT(DISTINCT e.emp_no) AS Employees,
       ROUND(AVG(s.salary), 2) AS Avg_Salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN employees e ON de.emp_no = e.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE de.to_date > CURDATE() AND s.to_date > CURDATE()
GROUP BY d.dept_name, e.gender
ORDER BY d.dept_name, e.gender;

mysql> SELECT d.dept_name AS Department, e.gender, COUNT(DISTINCT e.emp_no) AS Employees, ROUND(AVG(s.salary), 2) AS Avg_Salary FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN employees e ON de.emp_no = e.emp_no JOIN salaries s ON e.emp_no = s.emp_no WHERE de.to_date > CURDATE() AND s.to_date > CURDATE() GROUP BY d.dept_name, e.gender ORDER BY d.dept_name, e.gender;
+--------------------+--------+-----------+------------+
| Department         | gender | Employees | Avg_Salary |
+--------------------+--------+-----------+------------+
| Customer Service   | M      |     10562 |   67202.79 |
| Customer Service   | F      |      7007 |   67409.49 |
| Development        | M      |     36853 |   67712.56 |
| Development        | F      |     24533 |   67575.85 |
| Finance            | M      |      7423 |   78433.30 |
| Finance            | F      |      5014 |   78747.42 |
| Human Resources    | M      |      7751 |   63777.10 |
| Human Resources    | F      |      5147 |   64139.95 |
| Marketing          | M      |      8978 |   80293.38 |
| Marketing          | F      |      5864 |   79699.77 |
| Production         | M      |     31911 |   67920.52 |
| Production         | F      |     21393 |   67728.11 |
| Quality Management | M      |      8674 |   65360.86 |
| Quality Management | F      |      5872 |   65561.84 |
| Research           | M      |      9260 |   67847.64 |
| Research           | F      |      6181 |   68011.86 |
| Sales              | M      |     22702 |   88864.20 |
| Sales              | F      |     14999 |   88835.96 |
+--------------------+--------+-----------+------------+
18 rows in set (19.11 sec)

--example Department-wise salary summary for employees hired after 1995

SELECT d.dept_name, COUNT(*) AS Employees, ROUND(AVG(s.salary), 2) AS Avg_Salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN employees e ON de.emp_no = e.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date > CURDATE() AND de.to_date > CURDATE() AND e.hire_date > '1995-01-01'
GROUP BY d.dept_name
ORDER BY Avg_Salary DESC;

mysql> SELECT d.dept_name, COUNT(*) AS Employees, ROUND(AVG(s.salary), 2) AS Avg_Salary FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN employees e ON de.emp_no = e.emp_no JOIN salaries s ON e.emp_no = s.emp_no WHERE s.to_date > CURDATE() AND de.to_date > CURDATE() AND e.hire_date > '1995-01-01' GROUP BY d.dept_name ORDER BY Avg_Salary DESC;
+--------------------+-----------+------------+
| dept_name          | Employees | Avg_Salary |
+--------------------+-----------+------------+
| Sales              |      4260 |   78797.04 |
| Marketing          |      1629 |   69928.26 |
| Finance            |      1407 |   68733.48 |
| Research           |      1771 |   58251.54 |
| Production         |      6069 |   57903.89 |
| Customer Service   |      1961 |   57615.97 |
| Development        |      6956 |   57551.74 |
| Quality Management |      1702 |   55870.76 |
| Human Resources    |      1443 |   54047.87 |
+--------------------+-----------+------------+
9 rows in set (2.40 sec)


--example Highest paid employee(s) in each department

SELECT dept_name, emp_no, salary
FROM (
  SELECT d.dept_name, s.emp_no, s.salary,
         RANK() OVER (PARTITION BY d.dept_name ORDER BY s.salary DESC) AS rnk
  FROM departments d
  JOIN dept_emp de ON d.dept_no = de.dept_no
  JOIN salaries s ON de.emp_no = s.emp_no
  WHERE s.to_date > CURDATE() AND de.to_date > CURDATE()
) AS ranked
WHERE rnk = 1;

mysql> SELECT dept_name, emp_no, salary FROM (SELECT d.dept_name, s.emp_no, s.salary, RANK() OVER (PARTITION BY d.dept_name ORDER BY s.salary DESC) AS rnk FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN salaries s ON de.emp_no = s.emp_no WHERE s.to_date > CURDATE() AND de.to_date > CURDATE()) AS ranked WHERE rnk = 1;
+--------------------+--------+--------+
| dept_name          | emp_no | salary |
+--------------------+--------+--------+
| Customer Service   |  18006 | 144866 |
| Development        |  13386 | 144434 |
| Finance            | 413137 | 142395 |
| Human Resources    | 421835 | 141953 |
| Marketing          | 466852 | 145128 |
| Production         | 430504 | 138273 |
| Quality Management | 472905 | 132103 |
| Research           | 425731 | 130211 |
| Sales              |  43624 | 158220 |
+--------------------+--------+--------+
9 rows in set (8.82 sec)
