USE employees_mod;

# Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990
SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.Year_of_Hiring,
    CASE
        WHEN
            YEAR(dm.to_date) >= e.Year_of_Hiring
                AND YEAR(dm.from_date) <= e.Year_of_Hiring
        THEN
            1
        ELSE 0
    END AS Active
FROM
    (SELECT 
        YEAR(hire_date) AS Year_of_Hiring
    FROM
        t_employees
    GROUP BY Year_of_Hiring) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
        JOIN
    t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no , Year_of_Hiring;