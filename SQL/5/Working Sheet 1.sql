SET @@global.max_connections = 1;

USE employees;

SELECT * FROM employees;


SELECT 
    first_name, last_name
FROM
    employees
WHERE
    gender = 'F';
    

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';


SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' OR first_name = 'Elvis';


SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND (gender = 'M' OR gender = 'F');
    

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');
    

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar%');
    

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar_');


SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01'
ORDER BY hire_date;


SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;

SELECT DISTINCT
    gender
FROM
    employees;

# Aggregate Functions
SELECT 
    COUNT(gender) AS Males
FROM
    employees
WHERE
    gender = 'M';


SELECT DISTINCT
    first_name, last_name
FROM
    employees
WHERE
    gender = 'M'
ORDER BY first_name , last_name ASC;


SELECT 
    first_name, COUNT(first_name) AS Count_Name
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

# 10 Highest Paid Employees
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO employees
(
	emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
) VALUES
(
	500000,
    '1982-05-05',
    'John',
    'Smith',
    'M',
    '2011-04-03'
);

UPDATE employees 
SET 
    birth_date = '1986-06-06',
    first_name = 'Stella',
    last_name = 'Parkinson',
    gender = 'F'
WHERE
    emp_no = 500000;
    

DELETE FROM employees 
WHERE
    emp_no = 500000;
    
COMMIT;
ROLLBACK;

SELECT 
    *
FROM
    departments
ORDER BY dept_no;

COMMIT;

DELETE FROM departments;

ROLLBACK;

# Drop 		-> remove table
# Delete 	-> delete values inserted in a table
# Truncate 	-> delete [values inserted in a table + Auto_Increment values] (much quicker than delete)

# Aggregate Functions: COUNT(), SUM(), MIN(), MAX(), AVG()

SELECT 
    COUNT(*) 						-- wildcard (*) goes only with the aggregate function COUNT()
FROM
    salaries;

SELECT 
    SUM(salary) AS Total_Salary_after_the_1st_of_January_1997
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
SELECT MAX(salary) FROM salaries;	# Highest Salary ($158,220/year)
SELECT MIN(salary) FROM salaries;	# Lowests Salary ($38,735/year)

SELECT MAX(emp_no) FROM salaries;	# Last Employee ID		(201771)
SELECT MIN(emp_no) FROM salaries;	# First Employee ID		(10001)

SELECT ROUND(AVG(salary),1) FROM salaries;	# Average Salary ($63,761.2/year)

SELECT 
    dept_no as Department_Number, IFNULL(dept_name, 'Not Provided') as Department_Name
FROM
    departments
ORDER BY dept_no;


# Inner Join 3 tables (employees, dept_emp, departments)
SELECT 
    t1.emp_no,
    t1.first_name,
    t1.last_name,
    t2.dept_no,
    t3.dept_name,
    t2.from_date
FROM
    employees t1
        JOIN
    dept_emp t2 ON t1.emp_no = t2.emp_no
        JOIN
    departments t3 ON t2.dept_no = t3.dept_no
ORDER BY dept_no;

# Inner Join with 2 tables (employees & salaries) with salary more than $145,000
SELECT 
    e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000
ORDER BY s.salary;
    
select * from dept_emp;

# Left Join
SELECT 
    t1.emp_no,
    t1.first_name,
    t1.last_name,
    t2.dept_no,
    t2.from_date
FROM
    employees t1
        LEFT JOIN
    dept_emp t2 ON t1.emp_no = t2.emp_no;


# Right Join
SELECT 
    t1.emp_no,
    t1.first_name,
    t1.last_name,
    t2.dept_no,
    t2.from_date
FROM
    employees t1
        RIGHT JOIN
    dept_emp t2 ON t1.emp_no = t2.emp_no;


# Cross Join
SELECT 
    DM.*, Dep.*
FROM
    dept_manager DM
        CROSS JOIN
    departments Dep
ORDER BY DM.emp_no , Dep.dept_no;


# The Average Salary of Men & Women in the Company	(Males: $63,755.9 / Females: $63,769.1)	[Joins + Aggregate Functions]
SELECT 
    e.gender, ROUND(AVG(s.salary), 1) AS Average_Salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;


# The Average Salary for each department in the Company listed from Highest to Lowest	(Highest: Marketing / Lowest: Customer Service)
SELECT 
    d.dept_name as Department_Name, ROUND(AVG(s.salary), 1) AS Average_Salary
FROM
    departments d
        JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
        JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY d.dept_name
-- Having Average_Salary > 60000
ORDER BY Average_Salary DESC;


# Names of Managers (using IN & sub query / inner query / nested query)
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
            

# Names of Managers Ascendingly (using Exists & sub query)
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            e.emp_no = dm.emp_no)
ORDER BY e.first_name , e.last_name;


# Stored Proceduresk [Drop / Create / Call (Invoke)]
DROP PROCEDURE IF EXISTS select_employees;
DROP PROCEDURE IF EXISTS select_salaries;

DELIMITER $$ 
CREATE PROCEDURE select_employees()
BEGIN
		SELECT * FROM employees
        LIMIT 1000;
END $$ 
DELIMITER ;

CALL employees.select_employees();
CALL employees.select_salaries();


# Stored Procedures with an Input Parameter for [Employee's Salary Timeline]
DROP PROCEDURE IF EXISTS emp_salary;

DELIMITER $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
		SELECT
			e.first_name, e.last_name, e.gender, s.salary, s.from_date, s.to_date 
        FROM
			employees e
        JOIN
			salaries s ON e.emp_no = s.emp_no
		WHERE 
			e.emp_no = p_emp_no
		ORDER BY s.from_date DESC;
END $$
DELIMITER ;

CALL employees.emp_salary(11300);



# Stored Procedures with an Input Parameter for [Employee's Average Salary]
DROP PROCEDURE IF EXISTS emp_salary;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER)
BEGIN
		SELECT
			e.first_name, e.last_name, ROUND(AVG(s.salary), 1) AS Employee_Average_Salary
        FROM
			employees e
        JOIN
			salaries s ON e.emp_no = s.emp_no
		WHERE 
			e.emp_no = p_emp_no
		GROUP BY e.first_name, e.last_name;
END $$
DELIMITER ;

CALL employees.emp_avg_salary(11300);


# Function [return an output for an employee's average salary]
DROP FUNCTION IF EXISTS emp_avg_salary_out;

DELIMITER $$
CREATE FUNCTION emp_avg_salary_out (p_emp_no INTEGER) RETURNS DECIMAL(15, 1)
DETERMINISTIC
BEGIN

	DECLARE v_avg_salary DECIMAL(15, 1);
    
SELECT 
    ROUND(AVG(s.salary), 1) AS Employee_Average_Salary
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
		
    RETURN v_avg_salary;
    
END $$
DELIMITER ;

SELECT employees.emp_avg_salary_out(11300) AS Employee_Average_Salary_Output;


# Case Statement	(multiple conditions)
SELECT 
    emp_no,
    first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
    END As Gender
FROM
    employees;


SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
    END AS Current_Employee
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
GROUP BY de.emp_no
LIMIT 100;


# IF Statement	(one condition only)
SELECT 
    emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') AS Gender
FROM
    employees;