-- Selection of only 1 column 
SELECT emp_no FROM employees LIMIT 10; --Ex: emp_no from db
+--------+                  -- ^ set limit to display only a small, manageable set of rows from a huge table — especially useful in large datasets like this one with 300,000+ employees.
| emp_no | --output for above query From MYSQL CLI 
+--------+
|  10001 |
|  10002 |
|  10003 |
|  10004 |
|  10005 |
|  10006 |
|  10007 |
|  10008 |
|  10009 |
|  10010 |
+--------+
SELECT first_name FROM employees LIMIT 5; --Ex: first_name from db
+------------+
| first_name | ----output for above query From MYSQL CLI 
+------------+
| Georgi     |
| Bezalel    |
| Parto      |
| Chirstian  |
| Kyoichi    |
+------------+

-----------------------------------------------------------------------------------

--Selection of 2 or more columns from given
-- Example 2: Select emp_no and first_name
SELECT emp_no, first_name FROM employees LIMIT 10; --Ex:Selection emp_no and first_name from db

+--------+------------+
| emp_no | first_name | -- Output of above query from Mysql cli
+--------+------------+
|  10001 | Georgi     |
|  10002 | Bezalel    |
|  10003 | Parto      |
|  10004 | Chirstian  |
|  10005 | Kyoichi    |
|  10006 | Anneke     |
|  10007 | Tzvetan    |
|  10008 | Saniya     |
|  10009 | Sumant     |
|  10010 | Duangkaew  |
+--------+------------+
 --10 rows in set (0.00 sec)
  
SELECT first_name, last_name FROM employees LIMIT 15;

+------------+-----------+
| first_name | last_name |   -- Output of above query from Mysql cli
+------------+-----------+
| Georgi     | Facello   |
| Bezalel    | Simmel    |
| Parto      | Bamford   |
| Chirstian  | Koblick   |
| Kyoichi    | Maliniak  |
| Anneke     | Preusig   |
| Tzvetan    | Zielinski |
| Saniya     | Kalloufi  |
| Sumant     | Peac      |
| Duangkaew  | Piveteau  |
| Mary       | Sluis     |
| Patricio   | Bridgland |
| Eberhardt  | Terkki    |
| Berni      | Genin     |
| Guoxiang   | Nooteboom |
+------------+-----------+
  --15 rows in set (0.00 sec)

SELECT first_name , hire_date FROM employees LIMIT 15;

+------------+------------+
| first_name | hire_date  |  -- Output of above query from Mysql cli
+------------+------------+
| Georgi     | 1986-06-26 |
| Bezalel    | 1985-11-21 |
| Parto      | 1986-08-28 |
| Chirstian  | 1986-12-01 |
| Kyoichi    | 1989-09-12 |
| Anneke     | 1989-06-02 |
| Tzvetan    | 1989-02-10 |
| Saniya     | 1994-09-15 |
| Sumant     | 1985-02-18 |
| Duangkaew  | 1989-08-24 |
| Mary       | 1990-01-22 |
| Patricio   | 1992-12-18 |
| Eberhardt  | 1985-10-20 |
| Berni      | 1987-03-11 |
| Guoxiang   | 1987-07-02 |
+------------+------------+
 --15 rows in set (0.00 sec)

-------------------------------------------------------------------------------------------------------------

-- some more examples on column selection  
SELECT first_name AS fname, last_name AS lname FROM employees LIMIT 10;

+-----------+-----------+
| fname     | lname     |  -- Output of above query from Mysql cli
+-----------+-----------+
| Georgi    | Facello   |
| Bezalel   | Simmel    |
| Parto     | Bamford   |
| Chirstian | Koblick   |
| Kyoichi   | Maliniak  |
| Anneke    | Preusig   |
| Tzvetan   | Zielinski |
| Saniya    | Kalloufi  |
| Sumant    | Peac      |
| Duangkaew | Piveteau  |
+-----------+-----------+
--10 rows in set (0.00 sec)

---------------------------------------------------------------------------------------------------

-- Employee + Department (join)
SELECT e.emp_no, e.first_name, d.dept_no FROM employees e JOIN dept_emp d ON e.emp_no = d.emp_no LIMIT 10;

+--------+------------+---------+
| emp_no | first_name | dept_no |  -- Output of above query from Mysql cli
+--------+------------+---------+
|  10017 | Cristinel  | d001    |
|  10055 | Georgy     | d001    |
|  10058 | Berhard    | d001    |
|  10108 | Lunjin     | d001    |
|  10140 | Yucel      | d001    |
|  10175 | Aleksandar | d001    |
|  10208 | Xiping     | d001    |
|  10228 | Karoline   | d001    |
|  10239 | Nikolaos   | d001    |
|  10259 | Susanna    | d001    |
+--------+------------+---------+
--10 rows in set (0.05 sec)

-----------------------------------------------------------------------------------------------

-- Example emp_no and salary from salaries table
SELECT emp_no, salary FROM salaries LIMIT 10;

+--------+--------+
| emp_no | salary |  -- Output of above query from Mysql cli
+--------+--------+
|  10001 |  60117 |
|  10001 |  62102 |
|  10001 |  66074 |
|  10001 |  66596 |
|  10001 |  66961 |
|  10001 |  71046 |
|  10001 |  74333 |
|  10001 |  75286 |
|  10001 |  75994 |
|  10001 |  76884 |
+--------+--------+
--10 rows in set (0.00 sec)
