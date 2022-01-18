SELECT
	*
FROM
	Salaries
ORDER BY salary DESC
LIMIT 10;

SELECT
	COUNT(DISTINCT from_date)
FROM 
	salaries;
    
SELECT
	COUNT(*)
FROM 
	salaries;
    
SELECT
	COUNT(DISTINCT dept_no)
FROM 
	dept_emp;
    
SELECT DISTINCT
	dept_no
FROM
	dept_emp
ORDER BY dept_no;
--------------
SELECT
	from_date
FROM 
	salaries
WHERE from_date > '1997-01-01';

SELECT
	SUM(salary)
FROM 
	salaries
WHERE 
	from_date > '1997-01-01';
-----------------    
SELECT
	MAX(salary)
FROM
	salaries;
    
SELECT
	MIN(salary)
FROM
	salaries;
------------
SELECT
	AVG(salary)
FROM
	salaries;
    
SELECT
	ROUND(AVG(salary),2)
FROM
	salaries
WHERE 
	from_date > '1997-01-01';

-------

SELECT
	*
FROM
	departments_dup;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

INSERT INTO departments_dup (dept_no)
VALUES ('d010'), ('d011');

SELECT 
	*
FROM 
	departments_dup
ORDER BY dept_no ASC;

ALTER TABLE departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

SELECT 
	*
FROM 
	departments_dup
ORDER BY dept_no ASC;

COMMIT;

SELECT 
	dept_no,
	IFNULL(dept_name, 'Department name not provided')
FROM
	departments_dup;

SELECT 
	dept_no,
	COALESCE(dept_name, 'Department name not provided') AS dept_name
FROM
	departments_dup;
    
SELECT 
	dept_no,
    dept_name,
	COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
	departments_dup
ORDER BY dept_no ASC;

SELECT
	dept_no,
    dept_name,
	COALESCE('Department name not provided') AS fake_col
FROM
	departments_dup;
    
SELECT
	dept_no,
    dept_name,
	IFNULL(dept_no, dept_name) AS dept_info
FROM
	departments_dup
    ORDER BY dept_no ASC;
    
SELECT
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;    
    

SELECT
	IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name, 'Department name not provided') AS dept_name,

COALESCE(dept_no, dept_name) AS dept_info
FROM
	departments_dup
ORDER BY dept_no ASC;    