-- Example 1: Increase salary by 10%
SELECT emp_no, salary, salary * 1.1 AS increased_salary FROM salaries LIMIT 10;

+--------+--------+------------------+
| emp_no | salary | increased_salary |  -- Output of above query from Mysql cli
+--------+--------+------------------+
|  10001 |  60117 |          66128.7 |
|  10001 |  62102 |          68312.2 |
|  10001 |  66074 |          72681.4 |
|  10001 |  66596 |          73255.6 |
|  10001 |  66961 |          73657.1 |
|  10001 |  71046 |          78150.6 |
|  10001 |  74333 |          81766.3 |
|  10001 |  75286 |          82814.6 |
|  10001 |  75994 |          83593.4 |
|  10001 |  76884 |          84572.4 |
+--------+--------+------------------+
--10 rows in set (0.01 sec)

-------------------------------------------------------------------------------------------------------------------------------------

-- Example 2: Calculate years of service (approximate)
SELECT emp_no, hire_date, YEAR(CURDATE()) - YEAR(hire_date) AS years_of_service FROM employees LIMIT 10;

+--------+------------+------------------+
| emp_no | hire_date  | years_of_service |    -- Output of above query from Mysql cli
+--------+------------+------------------+
|  10001 | 1986-06-26 |               39 |
|  10002 | 1985-11-21 |               40 |
|  10003 | 1986-08-28 |               39 |
|  10004 | 1986-12-01 |               39 |
|  10005 | 1989-09-12 |               36 |
|  10006 | 1989-06-02 |               36 |
|  10007 | 1989-02-10 |               36 |
|  10008 | 1994-09-15 |               31 |
|  10009 | 1985-02-18 |               40 |
|  10010 | 1989-08-24 |               36 |
+--------+------------+------------------+
--10 rows in set (0.05 sec)

-----------------------------------------------------------------------------------------------------------------------------------------------

-- Example 3: Convert salary to monthly
SELECT emp_no, salary, salary / 12 AS monthly_salary FROM salaries LIMIT 10;

+--------+--------+----------------+
| emp_no | salary | monthly_salary |  -- Output of above query from Mysql cli
+--------+--------+----------------+
|  10001 |  60117 |      5009.7500 |
|  10001 |  62102 |      5175.1667 |
|  10001 |  66074 |      5506.1667 |
|  10001 |  66596 |      5549.6667 |
|  10001 |  66961 |      5580.0833 |
|  10001 |  71046 |      5920.5000 |
|  10001 |  74333 |      6194.4167 |
|  10001 |  75286 |      6273.8333 |
|  10001 |  75994 |      6332.8333 |
|  10001 |  76884 |      6407.0000 |
+--------+--------+----------------+
--10 rows in set (0.00 sec)

--------------------------------------------------------------------------------------------------------------------------------------

  -- Example 4: Concatenate first and last name as full_name
SELECT emp_no, 
       CONCAT(first_name, ' ', last_name) AS full_name
FROM employees LIMIT 10;

+--------+--------------------+
| emp_no | full_name          |  -- Output of above query from Mysql cli
+--------+--------------------+
|  10001 | Georgi Facello     |
|  10002 | Bezalel Simmel     |
|  10003 | Parto Bamford      |
|  10004 | Chirstian Koblick  |
|  10005 | Kyoichi Maliniak   |
|  10006 | Anneke Preusig     |
|  10007 | Tzvetan Zielinski  |
|  10008 | Saniya Kalloufi    |
|  10009 | Sumant Peac        |
|  10010 | Duangkaew Piveteau |
+--------+--------------------+
--10 rows in set (0.00 sec)

-----------------------------------------------------------------------------------------------------------------------------------------

-- Example 5: Add label based on gender
SELECT emp_no, gender,
       CASE gender     -- Using CASE to create calculated logic-based columns
            WHEN 'M' THEN 'Male'
            WHEN 'F' THEN 'Female'
       END AS gender_label
FROM employees
LIMIT 5;

-- SAME QUERY CAN ALSO BE GIVEN AS BELOW IN MYSQL CLI
SELECT emp_no, gender, CASE gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS gender_label FROM employees LIMIT 5;

+--------+--------+--------------+
| emp_no | gender | gender_label |    -- Output of above query from Mysql cli
+--------+--------+--------------+
|  10001 | M      | Male         |
|  10002 | F      | Female       |
|  10003 | M      | Male         |
|  10004 | M      | Male         |
|  10005 | M      | Male         |
+--------+--------+--------------+
--5 rows in set (0.00 sec)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

