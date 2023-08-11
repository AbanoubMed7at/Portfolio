USE employees_mod;

# Compare the average salary of female versus male employees in the entire company [for each department (filter)] until the year 2002
SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 1) AS Average_Salary,
    YEAR(s.from_date) AS Calendar_Year
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no , e.gender , Calendar_Year
HAVING Calendar_Year <= 2002
ORDER BY d.dept_no;