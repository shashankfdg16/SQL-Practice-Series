-- EQUALITY AND INEQUALITY OPERATORS 
--   =   (equal to)
--   !=  (not equal to)
--   >   (greater than)
--   >=  (greater than or equal to)
--   <   (less than)
--   <=  (less than or equal to)
--
-- These operators are used in the WHERE clause to filter rows 
-- based on specific conditions. Examples include checking for 
-- salary ranges, hire dates, exact name matches, and excluding 
-- certain genders.
--
-- Practical examples follow below using real employee data.


-----------------------------------------------------------------------------------------------------------------------------------------------

-- Example 1: Employees hired after 1995
SELECT emp_no, first_name, hire_date FROM employees WHERE hire_date > '1995-01-01' LIMIT 10;

+--------+------------+------------+
| emp_no | first_name | hire_date  | -- Output of above query from Mysql cli
+--------+------------+------------+
|  10016 | Kazuhito   | 1995-01-27 |
|  10019 | Lillian    | 1999-04-30 |
|  10022 | Shahaf     | 1995-08-22 |
|  10024 | Suzette    | 1997-05-19 |
|  10026 | Yongqiao   | 1995-03-20 |
|  10054 | Mayumi     | 1995-03-13 |
|  10084 | Tuval      | 1995-12-15 |
|  10093 | Sailaja    | 1996-11-05 |
|  10105 | Hironoby   | 1999-03-23 |
|  10120 | Armond     | 1996-07-06 |
+--------+------------+------------+
--10 rows in set (0.05 sec)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Example 2: Employees hired on or before 1990
SELECT emp_no, first_name, hire_date FROM employees WHERE hire_date <= '1990-12-31' LIMIT 10;

+--------+------------+------------+
| emp_no | first_name | hire_date  |  -- Output of above query from Mysql cli
+--------+------------+------------+
|  10001 | Georgi     | 1986-06-26 |
|  10002 | Bezalel    | 1985-11-21 |
|  10003 | Parto      | 1986-08-28 |
|  10004 | Chirstian  | 1986-12-01 |
|  10005 | Kyoichi    | 1989-09-12 |
|  10006 | Anneke     | 1989-06-02 |
|  10007 | Tzvetan    | 1989-02-10 |
|  10009 | Sumant     | 1985-02-18 |
|  10010 | Duangkaew  | 1989-08-24 |
|  10011 | Mary       | 1990-01-22 |
+--------+------------+------------+
--10 rows in set (0.00 sec)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Example 3: Gender not equal to M
SELECT emp_no, gender FROM employees WHERE gender != 'M' LIMIT 10;

+--------+--------+
| emp_no | gender |  -- Output of above query from Mysql cli
+--------+--------+
|  10002 | F      |
|  10006 | F      |
|  10007 | F      |
|  10009 | F      |
|  10010 | F      |
|  10011 | F      |
|  10017 | F      |
|  10018 | F      |
|  10023 | F      |
|  10024 | F      |
+--------+--------+
--10 rows in set (0.00 sec)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Example 4: Salary between 60000 and 65000
SELECT emp_no, salary FROM salaries WHERE salary >= 60000 AND salary <= 65000 LIMIT 10;

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

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Example 5: First name is exactly 'Mary'
SELECT emp_no, first_name FROM employees WHERE first_name = 'Mary' LIMIT 10;

+--------+------------+
| emp_no | first_name | -- Output of above query from Mysql cli
+--------+------------+
|  10011 | Mary       |
|  10532 | Mary       |
|  11821 | Mary       |
|  12334 | Mary       |
|  13562 | Mary       |
|  13881 | Mary       |
|  13924 | Mary       |
|  16021 | Mary       |
|  20819 | Mary       |
|  20863 | Mary       |
+--------+------------+
--10 rows in set (0.01 sec)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
