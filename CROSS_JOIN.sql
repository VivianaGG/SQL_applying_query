SELECT
	dm.*, d.*
FROM
	dept_manager dm
		CROSS JOIN
	departments d
ORDER BY dm.emp_no, d.dept_no;


SELECT
	dm.*, d.*
FROM
	dept_manager dm,
	departments d
ORDER BY dm.emp_no, d.dept_no;

SELECT
	dm.*, d.*
FROM
	dept_manager dm
		JOIN
	departments d
ORDER BY dm.emp_no, d.dept_no;

# CROSS JOIN + WHERE : specify that columns are not the same

SELECT
	dm.*, d.*
FROM
	departments d
		CROSS JOIN
	dept_manager dm
WHERE
	d.dept_no <> dm.dept_no
ORDER BY dm.emp_no, d.dept_no;

# CROSS JOIN MORE THAN TWO TABLES

SELECT
	e.*, d.*
FROM
	departments d
		CROSS JOIN
	dept_manager dm
    JOIN
    employees e ON dm.emp_no = e.emp_no
WHERE
	d.dept_no <> dm.dept_no
ORDER BY dm.emp_no, d.dept_no;

# Task 1
SELECT
	dm.*, d.*
FROM
	dept_manager dm
    CROSS JOIN
    departments d
WHERE d.dept_no = 'd009';

# Task 2 

SELECT
	e.*, d.*
FROM
	employees e
    CROSS JOIN
    departments d
    WHERE
    e.emp_no < 10011
    GROUP BY e.emp_no;
