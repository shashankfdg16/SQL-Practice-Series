-- ------------------------------------------------------------
-- Duplicate Handling — Unique Current Job Titles
-- ------------------------------------------------------------
-- This section demonstrates how to handle duplicates when
-- retrieving records. We use DISTINCT to get only unique
-- job titles for current assignments.

-- Example Query 1: Unique current job titles
SELECT DISTINCT  
    t.title AS unique_title
FROM titles t 
WHERE t.to_date > CURDATE();

-- Example Query 2: Unique job titles for employees in 'Development'
SELECT DISTINCT  
    t.title AS unique_title
FROM titles t
JOIN dept_emp de 
    ON t.emp_no = de.emp_no
JOIN departments d 
    ON de.dept_no = d.dept_no
WHERE t.to_date > CURDATE()
  AND de.to_date > CURDATE()
  AND d.dept_name = 'Development';

-- Example Query 3: Count of unique job titles currently in the company
SELECT  
    COUNT(DISTINCT t.title) AS total_unique_titles
FROM titles t
WHERE t.to_date > CURDATE();
