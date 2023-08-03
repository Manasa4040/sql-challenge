
DROP TABLE departments cascade;
DROP TABLE dept_emp cascade;
DROP TABLE dept_manager cascade;
DROP TABLE employees cascade;
DROP TABLE salaries cascade;
DROP TABLE titles cascade;


-- departments table
create table departments(
	dept_no varchar(8) PRIMARY key NOT NULL,
	dept_name varchar(40) NOT NULL
	);
	
-- employees table
create table employees(
    emp_no INT PRIMARY key NOT NULL,
    emp_title varchar(40) NOT NULL,
    birth_date date NOT NULL,
    first_name varchar(40) NOT NULL,
    last_name varchar(40) NOT NULL,
    sex varchar(1) NOT NULL,
    hire_date date NOT NULL
);
-- dept_emp table
create table dept_emp(
    emp_no INT NOT NULL,
    dept_no varchar(8) NOT NULL,
    foreign key (dept_no) references departments (dept_no),
    foreign key (emp_no) references employees (emp_no),
    PRIMARY KEY (emp_no, dept_no)
);
-- dept_manager table
create table dept_manager(
    dept_no varchar(8) NOT NULL,
    emp_no INT NOT NULL,
    foreign key (dept_no) references departments (dept_no),
    foreign key (emp_no) references employees (emp_no),
    PRIMARY KEY (dept_no, emp_no)
);
-- salaries table
create table salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    PRIMARY KEY (emp_no)
);
--titles table
create table titles(
    title_id varchar(5) PRIMARY key NOT NULL,
    title varchar(40) NOT NULL
);
--test to see table values
SELECT * FROM departments;
select * from dept_emp; 
select * from dept_manager; 
select * from titles; 
select * from salaries; 
select * from employees; 