/*
Project - SQL Challenge
Author - Matheus Gratz
Contact - matheusgratz@gmail.com
*/

-- List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	e.sex,
	s.salary
FROM employees AS e
INNER JOIN salary AS s
ON e.emp_no = s.emp_no;


-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT 
	e.first_name,
	e.last_name,
	e.hire_date
FROM employees AS e
WHERE e.hire_date >= '1986-01-01'
AND   e.hire_date <= '1986-12-31';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT
	d.dept_no,
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
FROM employees AS e

INNER JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no

INNER JOIN departments AS d
ON dm.dept_no = d.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees AS e

INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no

INNER JOIN departments AS d
ON de.dept_no = d.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT 
	e.first_name,
	e.last_name,
	e.sex
FROM employees AS e

WHERE 1=1
AND e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees AS e

INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no

INNER JOIN departments AS d
ON de.dept_no = d.dept_no

WHERE d.dept_name = 'Sales';


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees AS e

INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no

INNER JOIN departments AS d
ON de.dept_no = d.dept_no

WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT
	e.last_name,
	COUNT(e.emp_no) AS "Number of Employees"
FROM employees AS e
GROUP BY e.last_name
ORDER BY "Number of Employees" DESC;
