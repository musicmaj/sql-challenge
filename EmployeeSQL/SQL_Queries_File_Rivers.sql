/* 1. employee number, last name, first name, sex, and salary of each employee */
SELECT
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.sex,
	sal.salary
FROM
	employees emp 
LEFT JOIN salaries sal ON emp.emp_no = sal.emp_no
Order by
	emp.last_name;

/* 2. first name, last name, and hire date for the employees who were hired in 1986 */
SELECT
	emp.first_name,
	emp.last_name,
	emp.hire_date
	FROM
	employees emp
WHERE EXTRACT('year' from hire_date) = 1986

/* 3. manager of each department along with their department number, department name, employee number, last name, and first name */
	SELECT 
	man.dept_no,
	dept.dept_name,
	man.emp_no,
	emp.last_name,
	emp.first_name
FROM dept_manager man
NATURAL JOIN employees emp 
NATURAL JOIN departments dept 
Order by
	man.dept_no;

/* 4. department number, employee number, last name, first name, and department name */
SELECT
	de.dept_no,
	de.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
FROM dept_emp de
NATURAL JOIN employees emp
NATURAL JOIN departments dept
Order by
	de.dept_no;

/* 5. first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B */
SELECT
	emp.first_name,
	emp.last_name,
	emp.sex
FROM employees emp
WHERE emp.first_name = 'Hercules' and emp.last_name like 'B%';
	
/* 6. each employee in the Sales department, including their employee number, last name, and first name */
SELECT
	de.dept_name,
	dept.emp_no,
	emp.last_name,
	emp.first_name
FROM dept_emp dept
NATURAL JOIN departments de
NATURAL JOIN employees emp
WHERE de.dept_name = 'Sales'
Order by 
	emp.last_name,
	emp.first_name;

/* 7. each employee in the Sales and Development departments, including their employee number, last name, first name, and department name */
SELECT
	dept.emp_no,
	emp.last_name,
	emp.first_name,
	de.dept_name
FROM dept_emp dept
NATURAL JOIN departments de
NATURAL JOIN employees emp
WHERE de.dept_name = 'Sales' 
OR de.dept_name = 'Development'
Order by 
	de.dept_name DESC,
	emp.last_name,
	emp.first_name;

/* 8. the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) */
SELECT
	emp.last_name,
	count(emp.emp_no) as freq_name
FROM employees emp
Group by emp.last_name
Order by emp.last_name DESC;
