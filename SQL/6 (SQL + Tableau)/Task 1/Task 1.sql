USE employees_mod;

select * from t_employees e join t_dept_emp d on e.emp_no = d.emp_no order by from_date desc;

# Number of Men and Women Working in the company each year starting from 1990
SELECT 
    YEAR(de.from_date) AS Calender_Year,
    e.gender,
    COUNT(e.emp_no) AS Number_of_Employees_Hired
FROM
    t_employees e
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no
GROUP BY Calender_Year , e.gender
HAVING Calender_Year >= '1990'
ORDER BY Calender_Year;