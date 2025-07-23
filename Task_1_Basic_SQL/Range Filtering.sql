-- The BETWEEN operator is used to filter rows based on whether a column’s value
-- falls within a specified lower and upper bound (inclusive).

-- Syntax: column_name BETWEEN lower_bound AND upper_bound

-- It improves readability when checking if a value lies in a specific range, 
-- especially for numeric, date, and even character-based columns.

-----------------------------------------------------------------------------------------------------------------------------------

-- Example 1: Employees with salary between 60000 and 65000
SELECT emp_no, salary FROM salaries WHERE salary BETWEEN 60000 AND 65000 LIMIT 10;

+--------+--------+
| emp_no | salary | -- Output of above query from Mysql cli
+--------+--------+
|  10001 |  60117 |
|  10001 |  62102 |
|  10004 |  60770 |
|  10004 |  62566 |
|  10004 |  64340 |
|  10006 |  60098 |
|  10007 |  60740 |
|  10007 |  62745 |
|  10007 |  63475 |
|  10007 |  63208 |
+--------+--------+
--10 rows in set (0.00 sec)

------------------------------------------------------------------------------------------------------------------------------------------------

-- Example 2: Employees hired between 1990 and 1995
SELECT emp_no, hire_date FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1995-12-31' LIMIT 10;

+--------+------------+
| emp_no | hire_date  |    -- Output of above query from Mysql cli
+--------+------------+
|  10008 | 1994-09-15 |
|  10011 | 1990-01-22 |
|  10012 | 1992-12-18 |
|  10016 | 1995-01-27 |
|  10017 | 1993-08-03 |
|  10020 | 1991-01-26 |
|  10022 | 1995-08-22 |
|  10026 | 1995-03-20 |
|  10028 | 1991-10-22 |
|  10030 | 1994-02-17 |
+--------+------------+
--10 rows in set (0.00 sec)
