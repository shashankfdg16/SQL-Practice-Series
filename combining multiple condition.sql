--Combining Multiple Conditions in SQL (`AND` / `OR`)

--In SQL, we often need to **filter data based on multiple conditions**.
--This is where `AND` and `OR` come in:

-- `AND` returns rows **only if all conditions are true**
-- `OR` returns rows **if at least one condition is true**

--You can also combine `AND` and `OR` together using **parentheses** `()` to control the logic and avoid ambiguity.

--EXAMPLE to find Employees with gender 'F' OR first name ending with 'a' 

SELECT first_name, last_name, gender FROM employees WHERE gender = 'F' OR first_name LIKE '%a' LIMIT 5;

+------------+-----------+--------+
| first_name | last_name | gender |
+------------+-----------+--------+
| Bezalel    | Simmel    | F      |
| Anneke     | Preusig   | F      |
| Tzvetan    | Zielinski | F      |
| Saniya     | Kalloufi  | M      |
| Sumant     | Peac      | F      |
+------------+-----------+--------+
--5 rows in set (0.00 sec)

--EXAMPLE to find Employees hired before 2005 OR with salary over 80000

mysql> 
SELECT e.first_name, e.hire_date, s.salary FROM employees e JOIN salaries s ON e.emp_no = s.emp_no WHERE e.hire_date < '2005-01-01' OR s.salary > 80000 LIMIT 5;
+------------+------------+--------+
| first_name | hire_date  | salary |
+------------+------------+--------+
| Georgi     | 1986-06-26 |  60117 |
| Georgi     | 1986-06-26 |  62102 |
| Georgi     | 1986-06-26 |  66074 |
| Georgi     | 1986-06-26 |  66596 |
| Georgi     | 1986-06-26 |  66961 |
+------------+------------+--------+
5 rows in set (0.00 sec)

mysql> 
SELECT e.first_name, e.hire_date, s.salary FROM employees e JOIN salaries s ON e.emp_no = s.emp_no WHERE (e.hire_date < '2005-01-01' OR s.salary > 80000) AND s.to_date = (SELECT MAX(to_date) FROM salaries WHERE emp_no = e.emp_no) LIMIT 5;
+------------+------------+--------+
| first_name | hire_date  | salary |
+------------+------------+--------+
| Georgi     | 1986-06-26 |  88958 |
| Bezalel    | 1985-11-21 |  72527 |
| Parto      | 1986-08-28 |  43311 |
| Chirstian  | 1986-12-01 |  74057 |
| Kyoichi    | 1989-09-12 |  94692 |
+------------+------------+--------+
5 rows in set (0.00 sec)

