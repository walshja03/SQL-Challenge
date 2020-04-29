--1. List details of each employee
SELECT e.emp_no,
	last_name,
	first_name,
	sex,
	s.salary
FROM employee e
inner JOIN salaries s on e.emp_no = s.emp_no

--2. List first name, last name, and hire date for employee who were hired in 1986
Select first_name,
	last_name,
	hire_date
FROM employee
WHERE Extract(year from hire_date) = 1986

--3. List the manager of each department
SELECT dm.dept_no,
	dept_name,
	dm.emp_no,
	last_name,
	first_name
FROM dept_manager dm
left join employee e
on dm.emp_no = e.emp_no
left join department d
on dm.dept_no = d.dept_no

--4. List the department of each employee with...
SELECT e.emp_no,
	last_name,
	first_name,
	d.dept_name
FROM employee e
inner join dept_emp de
ON e.emp_no = de.emp_no
inner join department d
ON de.dept_no = d.dept_no

--5. List first, last, sex for employees first name is Hercules and last name begin with B
SELECT first_name,
	last_name,
	sex
FROM employee
WHERE first_name = 'Hercules' AND last_name like 'B%'

--6. List all employees from the Sales Department
SELECT e.emp_no,
	last_name,
	first_name,
	d.dept_name
FROM employee e
inner join dept_emp de
ON e.emp_no = de.emp_no
inner join department d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'

--7. List all employees from Sales and Development
SELECT e.emp_no,
	last_name,
	first_name,
	d.dept_name
FROM employee e
inner join dept_emp de
ON e.emp_no = de.emp_no
inner join department d
ON de.dept_no = d.dept_no
WHERE d.dept_name in ('Sales','Development')
SELECT * FROM dept_manager

--8. Descending order, list the frequency count of employee last names
SELECT last_name,
	COUNT(last_name)
FROM employee
GROUP BY last_name
ORDER BY last_name desc

--Curious about the number of distinct last names
SELECT COUNT(Distinct last_name)
FROM employee