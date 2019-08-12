----DATA ANALYSIS
----List the following details of each employee: employee number, last name, first name, gender, and salary.
Select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
From "Salaries" as s
Inner Join "Employees" As e ON
s.emp_no = e.emp_no
Order by e.emp_no Asc;

----List employees who were hired in 1986. --https://stackoverflow.com/questions/35704412/postgresql-query-current-year
Select * From "Employees"
Where Date_part('year', hire_date) = 1986;

----List the manager of each department with the following information: department number, department name,
----the manager's employee number, last name, first name, and start and end employment dates.
Select d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
From "Departments" As d
Inner Join "Dept_manager" As m On
m.dept_no = d.dept_no
Join "Employees" AS e ON
e.emp_no = m.emp_no;

----List the department of each employee with the following information: employee number, last name,
----first name, and department name
Select e.emp_no, e.last_name, e.first_name, d.dept_name
From "Employees" AS e
Inner Join "Dept_emp" AS de ON
e.emp_no = de.emp_no
Inner Join "Departments" AS d ON
de.dept_no = d.dept_no
Order by e.emp_no Asc;

----List all employees whose first name is "Hercules" and last names begin with "B."
Select * From "Employees"
Where first_name Like 'Hercules'
And last_name Like 'B%';

----List all employees in the Sales department, including their employee number, last name,
----first name, and department name.
Select e.emp_no, e.last_name, e.first_name, d.dept_name
From "Employees" As e
Inner Join "Dept_emp" As de ON
e.emp_no = de.emp_no
Inner Join "Departments" As d ON
de.dept_no = d.dept_no
Where d.dept_name Like 'Sales';

----List all employees in the Sales and Development departments, 
----including their employee number, last name, first name, and department name.
Select e.emp_no, e.last_name, e.first_name, d.dept_name
From "Employees" As e
Inner Join "Dept_emp" As de ON
e.emp_no = de.emp_no
Inner Join "Departments" As d ON
de.dept_no = d.dept_no
Where d.dept_name Like 'Sales'
OR d.dept_name LIKE  'Development';

----In descending order, list the frequency count of employee last names, 
----i.e., how many employees share each last name.
Select last_name, 
Count(*) As Frequency
From "Employees"
Group By last_name
Order by Frequency DESC;