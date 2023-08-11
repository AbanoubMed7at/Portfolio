USE employees_mod;

# Stored Procedures for the average male and female salary per department within a certain salary range
DROP PROCEDURE IF EXISTS filter_salary;

DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
SELECT
	e.gender, d.dept_name, ROUND(AVG(s.salary), 1) AS Average_Salary
FROM
	t_salaries s
		JOIN
	t_employees e ON s.emp_no = e.emp_no
		JOIN
	t_dept_emp de ON de.emp_no = e.emp_no
		JOIN
	t_departments d on d.dept_no = de.dept_no
	WHERE s.salary BETWEEN p_min_salary AND p_max_salary
GROUP BY d.dept_no, e.gender;
END$$

DELIMITER ;

CALL filter_salary(50000, 90000);