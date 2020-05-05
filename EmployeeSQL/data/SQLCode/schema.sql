--Create titles table first because employees has title foreign key
CREATE TABLE titles(
	title_id VARCHAR(10) PRIMARY KEY NOT NULL,
	title VARCHAR(64) NOT NULL)
	
--Check population of titles	
SELECT * FROM titles

--Create table for employee which multiple tables depend on
CREATE TABLE employee (
	emp_no int PRIMARY KEY NOT NULL,
	title_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (title_id) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(128) NOT NULL,
	last_name VARCHAR(128) NOT NULL,
	sex CHAR(1),
	hire_date DATE NOT NULL
	)

/*In loading employee we needed to re-formate birth date
because it had 2 digits for the year originally it loaded
everyone as born in 21st century.  Reformatted in Excel
before uploading employeesbirthfix which is included*/

--Check population of employee
SELECT * FROM employee

--Create department table which other tables have dept_no as foreign keys
CREATE TABLE department (
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(64) NOT NULL)
	
--Check population of department	
SELECT * FROM department

/*Create dept_emp relationship, included serial in case an employee changed
departments*/
CREATE TABLE dept_emp (
	id SERIAL PRIMARY KEY NOT NULL,
	emp_no int NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employee(emp_no),
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES department(dept_no))

--Check population of dept_emp
SELECT * FROM dept_emp

/*Create dept_emp relationship, included serial in case there was a change
in managers*/
CREATE TABLE dept_manager (
	id SERIAL PRIMARY KEY NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES department(dept_no),
	emp_no int NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employee(emp_no))
	
--Check population of dept_manager
SELECT * FROM dept_manager

/*Create salaries, included serial in case an employee had multiple
salaries in the 10 year span*/
CREATE TABLE salaries (
	id SERIAL PRIMARY KEY NOT NULL,
	emp_no int NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employee(emp_no),
	salary NUMERIC(18,2) NOT NULL)
	
--Check population of salaries
SELECT * FROM salaries