--1.List the employee number, last name, first name, sex, and salary of each employee..
select salaries.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
inner join salaries 
on salaries.emp_no = employees.emp_no
order by employees.emp_no; 

--2. List the first name, last name, and hire date for the employees who were hired in 1986
select employees.emp_no, employees.last_name, employees.first_name, employees.hire_data
from employees
where extract(year from hire_date) = 1986; 

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
select distinct on (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager 
inner join departments 
on dept_manager.dept_no= departments.dept_no
inner join employees 
on dept_manager.emp_no = employees.emp_no
order by dept_manager.dept_no DESC; 

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select distinct on (employees.emp_no) employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
left join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
order by employees.emp_no DESC;

--5.List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select employees.last_name, employees.first_name
from employees
where (employees.first_name = 'Hercules') and (lower(employees.last_name)like 'b%' )
order by employees.last_name;

-- need to first create table with combined information to pull from 
select distinct on (emp_no) *
into combo_emp_dept
from dept_emp
order by emp_no DESC;

--6. List each employee in the Sales department, including their employee number, last name, and first name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join combo_emp_dept
on employees.emp_no = combo_emp_dept.emp_no
inner join departments
on combo_emp_dept.dept_no = departments.dept_no 
where lower(departments.dept_name) = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join combo_emp_dept
on combo_emp_dept.emp_no = employees.emp_no
inner join departments
on departments.dept_no = combo_emp_dept.dept_no
where (lower(departments.dept_name) = 'Sales') or (lower(departments.dept_name)= 'Development');

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name,count(last_name) as frequency 
from employees 
group by last_name
order by frequency desc;