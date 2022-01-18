# This is my second local commit
SELECT
	emp_no,
    first_name,
    last_name,
    CASE
		WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
	END AS gender
FROM
	employees;
    
#Another way to do that CASE Statement
SELECT
	emp_no,
    first_name,
    last_name,
    CASE gender
		WHEN 'M' THEN 'Male'
        ELSE 'Female'
	END AS gender
FROM
	employees;
    
SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    CASE
		WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
	END AS is_manager
FROM
	employees e
    LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
    WHERE e.emp_no > 109990
    ;
    
    
SELECT
	emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') AS gender
FROM
	employees;
    
    
SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
		WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than $30,000'
		WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 30000 AND 30000 THEN 
											'Salary was raised by more than $20,000 but less than $30,000'
        ELSE 'Salary was raised by less than $20,000'
	END AS salary_increase
FROM
	dept_manager dm
    JOIN
    employees e ON e.emp_no = dm.emp_no
    JOIN
    salaries s ON s.emp_no = e.emp_no
GROUP BY s.emp_no;


---

SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    CASE
		WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
	END AS current_employee
FROM
	employees e
    JOIN
    dept_emp de ON e.emp_no = de.emp_no
GROUP BY de.emp_no 
LIMIT 100;


SELECT
	*
FROM
	dept_emp
WHERE emp_no = 10010;