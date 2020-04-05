
-- Data Analysis


-- Check that tables imported properly
SELECT * FROM department;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;


-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender,salaries.salary
FROM employees
JOIN salaries
ON (employees.emp_no = salaries.emp_no);


-- 2. List employees who were hired in 1986.
-- use YYYY-MM-DD form

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';


-- 3. List the manager of each department with the following information: department number, 
--    department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT department.dept_no, department.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM department
JOIN dept_manager
ON department.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;


-- 4. List the department of each employee with the following information:
--  employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN department
ON dept_emp.dept_no = department.dept_no;


-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- 6. List all employees in the Sales department, including their employee number, 
--    last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN department
ON dept_emp.dept_no = department.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN department
ON dept_emp.dept_no = department.dept_no
WHERE department.dept_name = 'Sales'
OR department.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names,
--    i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "last name frequency"
FROM employees
GROUP BY last_name
ORDER BY "last name frequency" DESC;
