--Pattern Matching in SQL 
--In SQL, pattern matching is used to filter text-based data using the `LIKE` and `NOT LIKE` operators. 
--These are especially useful when you want to search for records that match a certain pattern, not just exact values.


--example To Find employees whose last names start with 'S' replace any alphabet in place of 's' for custom input
SELECT first_name, last_name FROM employees WHERE last_name LIKE 'S%' LIMIT 10;

+------------+------------+
| first_name | last_name  |
+------------+------------+
| Bezalel    | Simmel     |
| Mary       | Sluis      |
| Bader      | Swan       |
| Magy       | Stamatiou  |
| Moss       | Shanbhogue |
| Florian    | Syrotiuk   |
| Mayumi     | Schueller  |
| Kwee       | Schusler   |
| Claudi     | Stavenow   |
| Hironoby   | Sidou      |
+------------+------------+
--10 rows in set (0.00 sec)


--example To find employees whose names contain 'son' anywhere
SELECT first_name, last_name FROM employees WHERE last_name LIKE '%son%' LIMIT 10;

+------------+-------------+
| first_name | last_name   |
+------------+-------------+
| Hironobu   | Haraldson   |
| Domenick   | Peltason    |
| Nishit     | Casperson   |
| Yongmin    | Roison      |
| Dmitri     | Pearson     |
| Dzung      | Peltason    |
| Maris      | Haraldson   |
| Ramalingam | Gunderson   |
| Shuky      | Pearson     |
| Bezalel    | Katzenelson |
+------------+-------------+
--10 rows in set (0.00 sec)

--EXAMPLE to find employees with exactly 5-letter last names
  
SELECT first_name, last_name 
FROM employees 
WHERE last_name LIKE '_____' LIMIT 10;  -- 5 underscores = 5 letters


+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Mary       | Sluis     |
| Berni      | Genin     |
| Arif       | Merlo     |
| Huan       | Lortz     |
| Hidefumi   | Caine     |
| Satosi     | Awdeh     |
| Hironoby   | Sidou     |
| Mona       | Azuma     |
| Zhongwei   | Rosen     |
| Parviz     | Lortz     |
+------------+-----------+
--10 rows in set (0.00 sec)


--EXAMPLE to find employees whose names do NOT contain 'an'
SELECT first_name, last_name 
FROM employees 
WHERE first_name NOT LIKE '%an%' LIMIT 5;

+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Georgi     | Facello   |
| Bezalel    | Simmel    |
| Parto      | Bamford   |
| Kyoichi    | Maliniak  |
| Mary       | Sluis     |
+------------+-----------+
--5 rows in set (0.00 sec)

--EXAMPLE to find employees whose second letter in their name is 'e'

SELECT first_name, last_name 
FROM employees 
WHERE first_name LIKE '_e%';

+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Georgi     | Facello   |
| Bezalel    | Simmel    |
| Berni      | Genin     |
| Jeong      | Reistad   |
| Weiyi      | Meriste   |
+------------+-----------+
--5 rows in set (0.00 sec)
