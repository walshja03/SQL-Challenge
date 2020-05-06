
CREATE TABLE titles(
	title_id VARCHAR(10) PRIMARY KEY NOT NULL,
	title VARCHAR(64) NOT NULL)

CREATE TABLE employee (
	emp_no in PRIMARY KEY NOT NULL,
	title_id VARCHAR(10) NOT NULL
	FOREIGN KEY(title_id) titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(128) NOT NULL,
	last_name VARCHAR(128) NOT NULL,
	sex CHAR(1),
	hire_date DATE NOT NULL
	)

CREATE TABLE department (
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(64) NOT NULL)
	
CREATE TABLE dept_emp (
	id SERIAL PRIMARY KEY NOT NULL,
	emp_no int NOT NULL
	FOREIGN KEY(emp_no) employee(emp_no),
	dept_no VARCHAR(10) NOT NULL
	FOREIGN KEY(dept_no) department(dept_no))

CREATE TABLE dept_manager (
	id SERIAL PRIMARY KEY NOT NULL,
	dept_no VARCHAR(10) NOT NULL
	FOREIGN KEY(dept_no) department(dept_no),
	emp_no int NOT NULL
	FOREIGN KEY(emp_no) employee(emp_no))
	
CREATE TABLE salaries (
	id SERIAL PRIMARY KEY NOT NULL,
	emp_no int NOT NULL
	FOREIGN KEY(emp_no) employee(emp_no),
	salary NUMERIC(18,2) NOT NULL)

