--Yearly Hiring Trends

--This file has SQL queries to check how many employees were hired each year using the [MySQL Employees Sample Database](https://github.com/datacharmer/test_db).

--Syntax Used

--`YEAR()` to get year from hire_date
--`COUNT(*)` to count rows
--`GROUP BY` and `ORDER BY`
--`WHERE` to filter years
--`LAG()` for comparing with previous year
--`ROUND()` and `CONCAT()` for % growth


--example to get year from hire_date
SELECT emp_no, hire_date, YEAR(hire_date) AS hire_year
FROM employees
LIMIT 5;

mysql> SELECT emp_no, hire_date, YEAR(hire_date) AS hire_year FROM employees LIMIT 5;
+--------+------------+-----------+
| emp_no | hire_date  | hire_year |
+--------+------------+-----------+
|  10001 | 1986-06-26 |      1986 |
|  10002 | 1985-11-21 |      1985 |
|  10003 | 1986-08-28 |      1986 |
|  10004 | 1986-12-01 |      1986 |
|  10005 | 1989-09-12 |      1989 |
+--------+------------+-----------+
5 rows in set (0.01 sec)


--example – to count rows
SELECT COUNT(*) AS total_employees
FROM employees;

mysql> SELECT COUNT(*) AS total_employees FROM employees;
+-----------------+
| total_employees |
+-----------------+
|          300024 |
+-----------------+
1 row in set (0.13 sec)

--example GROUP BY and ORDER BY
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS hires
FROM employees
GROUP BY hire_year
ORDER BY hire_year ASC;


mysql> SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS hires FROM employees GROUP BY hire_year ORDER BY hire_year ASC;
+-----------+-------+
| hire_year | hires |
+-----------+-------+
|      1985 | 35316 |
|      1986 | 36150 |
|      1987 | 33501 |
|      1988 | 31436 |
|      1989 | 28394 |
|      1990 | 25610 |
|      1991 | 22568 |
|      1992 | 20402 |
|      1993 | 17772 |
|      1994 | 14835 |
|      1995 | 12115 |
|      1996 |  9574 |
|      1997 |  6669 |
|      1998 |  4155 |
|      1999 |  1514 |
|      2000 |    13 |
+-----------+-------+
16 rows in set (0.52 sec)

--example WHERE – to filter years
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS hires
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 1995
GROUP BY hire_year;

mysql> SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS hires FROM employees WHERE YEAR(hire_date) BETWEEN 1990 AND 1995 GROUP BY hire_year;
+-----------+-------+
| hire_year | hires |
+-----------+-------+
|      1994 | 14835 |
|      1990 | 25610 |
|      1992 | 20402 |
|      1995 | 12115 |
|      1993 | 17772 |
|      1991 | 22568 |
+-----------+-------+
6 rows in set (0.38 sec)


--example LAG() – to compare with previous year
SELECT 
  YEAR(hire_date) AS hire_year,
  COUNT(*) AS hires,
  COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY YEAR(hire_date)) AS YoY_Change
FROM employees
GROUP BY hire_year
ORDER BY hire_year;

mysql> SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS hires, COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY YEAR(hire_date)) AS YoY_Change FROM employees GROUP BY hire_year ORDER BY hire_year;
+-----------+-------+------------+
| hire_year | hires | YoY_Change |
+-----------+-------+------------+
|      1985 | 35316 |       NULL |
|      1986 | 36150 |        834 |
|      1987 | 33501 |      -2649 |
|      1988 | 31436 |      -2065 |
|      1989 | 28394 |      -3042 |
|      1990 | 25610 |      -2784 |
|      1991 | 22568 |      -3042 |
|      1992 | 20402 |      -2166 |
|      1993 | 17772 |      -2630 |
|      1994 | 14835 |      -2937 |
|      1995 | 12115 |      -2720 |
|      1996 |  9574 |      -2541 |
|      1997 |  6669 |      -2905 |
|      1998 |  4155 |      -2514 |
|      1999 |  1514 |      -2641 |
|      2000 |    13 |      -1501 |
+-----------+-------+------------+
16 rows in set (0.52 sec)

--example ROUND() and CONCAT() – to format % growth
  SELECT 
  YEAR(hire_date) AS hire_year,
  COUNT(*) AS hires,
  CONCAT(ROUND(
    100.0 * (COUNT(*) - LAG(COUNT(*)) OVER ()) / NULLIF(LAG(COUNT(*)) OVER (), 0), 1), '%'
  ) AS growth_rate
FROM employees
GROUP BY hire_year
ORDER BY hire_year;

mysql> SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS hires, CONCAT(ROUND(100.0 * (COUNT(*) - LAG(COUNT(*)) OVER ()) / NULLIF(LAG(COUNT(*)) OVER (), 0), 1), '%') AS growth_rate FROM employees GROUP BY hire_year ORDER BY hire_year;
+-----------+-------+-------------+
| hire_year | hires | growth_rate |
+-----------+-------+-------------+
|      1985 | 35316 | -2.3%       |
|      1986 | 36150 | NULL        |
|      1987 | 33501 | 64.2%       |
|      1988 | 31436 | 39.3%       |
|      1989 | 28394 | -19.6%      |
|      1990 | 25610 | 72.6%       |
|      1991 | 22568 | 1390.6%     |
|      1992 | 20402 | -20.3%      |
|      1993 | 17772 | 46.7%       |
|      1994 | 14835 | -47.8%      |
|      1995 | 12115 | -63.8%      |
|      1996 |  9574 | 43.6%       |
|      1997 |  6669 | -78.8%      |
|      1998 |  4155 | -56.6%      |
|      1999 |  1514 | -91.5%      |
|      2000 |    13 | -99.7%      |
+-----------+-------+-------------+
16 rows in set (0.51 sec)

