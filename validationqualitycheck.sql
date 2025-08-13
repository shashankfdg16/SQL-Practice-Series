/*
Topic: Validation & Quality Checks
-----------------------------------
These queries help verify the accuracy of reports and detect possible data issues.
They are typically run after generating reports to ensure consistency between 
aggregated results and source data.
*/

-- 1. Verify total current employees in salaries table
SELECT COUNT(DISTINCT emp_no) AS Total_Current_Employees
FROM salaries
WHERE to_date > CURDATE();

mysql> SELECT COUNT(DISTINCT emp_no) AS Total_Current_Employees FROM salaries WHERE to_date > CURDATE();
+-------------------------+
| Total_Current_Employees |
+-------------------------+
|                  240124 |
+-------------------------+
1 row in set (2.06 sec)

-- 2. Check for null department assignments in dept_emp
SELECT COUNT(*) AS Null_Department_Records
FROM dept_emp
WHERE dept_no IS NULL;

mysql> SELECT COUNT(*) AS Null_Department_Records FROM dept_emp WHERE dept_no IS NULL;
+-------------------------+
| Null_Department_Records |
+-------------------------+
|                       0 |
+-------------------------+
1 row in set (0.04 sec)

-- 3. Cross-check total employees in reports with base table
-- (Replace <total_from_report> with your calculated total from reports)
SELECT <total_from_report> AS Report_Total,
       COUNT(DISTINCT emp_no) AS Source_Total
FROM salaries
WHERE to_date > CURDATE();

mysql> SELECT 198000 AS Report_Total, COUNT(DISTINCT emp_no) AS Source_Total FROM salaries WHERE to_date > CURDATE();
+--------------+--------------+
| Report_Total | Source_Total |
+--------------+--------------+
|       198000 |       240124 |
+--------------+--------------+
1 row in set (2.02 sec)
