-- List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no AS "Emp No", employees.last_name AS "Last Name", employees.first_name AS "First Name", employees.sex AS "Sex", salaries.salary AS "Salary"
FROM employees 
JOIN salaries ON employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT  first_name AS "First Name", last_name AS "Last Name", hire_date AS "Hire Date"
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT departments.dept_no AS "Dept No", departments.dept_name AS "Dept Name", dept_manager.emp_no "Mgr Emp No", employees.last_name AS "Mgr Last Name", employees.first_name AS "Mgr First Name"
FROM departments
LEFT JOIN dept_manager 
ON departments.dept_no=dept_manager.dept_no
LEFT JOIN employees 
ON dept_manager.emp_no=employees.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT departments.dept_no,employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees 
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names
SELECT employees.last_name as "Last Name", COUNT(employees.emp_no) as "Total Employees"
FROM employees
GROUP BY employees.last_name ORDER BY "Total Employees" DESC;