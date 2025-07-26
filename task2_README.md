# Task 2 – Data Aggregation & Reporting with Real Dataset

This folder includes SQL queries and output screenshots for **Task 2** of the SQL Practice Series.  
The focus of this task is on analyzing employee salary and hiring data using aggregation, grouping, and window functions in SQL.

---

## 📘 Topics Covered

- Department-wise Salary Summary  
- Year-over-Year Hiring Trends  
- Identifying High-Earning Departments using `HAVING`  
- Salary Distribution Bucket Report  
- Validation Queries & Grouping Logic

---

## 🗃️ Dataset Source

This task uses the official **MySQL Employees Sample Database** from [DataCharmer/test_db](https://github.com/datacharmer/test_db).  
Primary tables used:  
`employees`, `salaries`, `departments`, `dept_emp`

---

## 🛠️ How to Run

- Clone and set up the [test_db](https://github.com/datacharmer/test_db) in your MySQL instance.
- Run each `.sql` file inside this folder via **MySQL CLI** or **Workbench**.
- Screenshots of query outputs are available in the `task2screenshots/` folder.

---

## 📂 Files Included

| File                                | Description                          |
|-------------------------------------|--------------------------------------|
| `Department_Salary_Summary.sql`     | Exercise 1 – Avg, Min, Max salaries per dept |
| `Yearly_Hiring_Trends.sql`          | Exercise 2 – Hiring counts + growth rate |
| `High_Earning_Departments.sql`      | Exercise 3 – Departments with avg salary > 70K |
| `Salary_Distribution_Report.sql`    | Exercise 4 – Salary bucket counts for Sales dept |
| `task2screenshots/`                 | Folder containing CLI/Workbench outputs |

---

## ✅ Task Status: **COMPLETED**
