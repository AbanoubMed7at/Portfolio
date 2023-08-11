-- Create Table dundermifflen.EmployeeDemographics 
-- (
-- EmployeeID int, 
-- FirstName varchar(50), 
-- LastName varchar(50), 
-- Age int, 
-- Gender varchar(50)
-- )

-- insert into dundermifflen.employeedemographics values
-- (1002, 'Pam', 'Beasley', 30, 'Female'),
-- (1003, 'Dwight', 'Schrute', 29, 'Male'),
-- (1004, 'Angela', 'Martin', 31, 'Female'),
-- (1005, 'Toby', 'Flenderson', 32, 'Male'),
-- (1006, 'Michael', 'Scott', 35, 'Male'),
-- (1007, 'Meredith', 'Palmer', 32, 'Female'),
-- (1008, 'Stanley', 'Hudson', 38, 'Male'),
-- (1009, 'Kevin', 'Malone', 31, 'Male');


-- insert into dundermifflen.employeedemographics values
-- (1010, 'Ryan', 'Howard', 26, 'Male'),
-- (1001, 'Jim', 'Halpert', 30, 'Male');

-- select * from dundermifflen.employeedemographics order by EmployeeID

-- DELETE FROM EmployeeDemographics WHERE EmployeeID = 101;

-- create table dundermifflen.EmployeeSalary
-- (
-- EmployeeID int,
-- JobTitle varchar(50),
-- Salary int
-- );

-- insert into dundermifflen.EmployeeSalary values
-- (1001, 'Salesman', 45000),
-- (1002, 'Receptionist', 36000),
-- (1003, 'Salesman', 63000),
-- (1004, 'Accountant', 47000),
-- (1005, 'HR', 50000),
-- (1006, 'Regional Manager', 65000),
-- (1007, 'Supplier Relations', 41000),
-- (1008, 'Salesman', 48000),
-- (1009, 'Accountant', 42000);

-- select * from dundermifflen.employeesalary

-- select top, distinct, COUNT, Count ... As, MAX, MIN, AVG (column_name)
-- from table_name

-- select COUNT(FirstName) as FirstNameCount
-- from EmployeeDemographics

-- select *
-- from EmployeeSalary

-- select Avg(Salary) As Avg_Salary
-- from EmployeeSalary


-- Where statement	
-- =, <> (does not equal), <, >, And, Or, is Null, is Not Null, In (multiple equal statements)

-- select *
-- from EmployeeDemographics
-- where Age >= 30 and Gender = 'Male'

-- select *
-- FROM [Dunder Mifflin].[dbo].[EmployeeDemographics]
-- where FirstName in ('Jim', 'Michael')


-- Group by, Order by

-- select Gender, COUNT (Gender) as Count_Person
-- from [Dunder Mifflin].[dbo].[EmployeeDemographics]
-- group by Gender
-- order by Gender desc


-- Inner Join

-- select EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
-- from [Dunder Mifflin].dbo.EmployeeDemographics
-- inner join [Dunder Mifflin].dbo.EmployeeSalary
-- on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
-- where FirstName <> 'Michael'
-- order by Salary desc

-- select JobTitle, avg(Salary) as AverageSalary
-- from [Dunder Mifflin].dbo.EmployeeDemographics
-- inner join [Dunder Mifflin].dbo.EmployeeSalary
-- on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
-- where JobTitle = 'Salesman'
-- group by JobTitle



-- Create Table dundermifflen.WareHouseEmployeeDemographics 
-- (EmployeeID int, 
-- FirstName varchar(50), 
-- LastName varchar(50), 
-- Age int, 
-- Gender varchar(50)
-- );


-- Insert into dundermifflen.WareHouseEmployeeDemographics VALUES
-- (1013, 'Darryl', 'Philbin', 35, 'Male'),
-- (1050, 'Roy', 'Anderson', 31, 'Male'),
-- (1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
-- (1052, 'Val', 'Johnson', 31, 'Female');

-- select * from dundermifflen.WareHouseEmployeeDemographics

-- Union

-- select * from [Dunder Mifflin].dbo.EmployeeDemographics
-- union
-- select * from WareHouseEmployeeDemographics


-- Case Statement


-- select FirstName, LastName, Age,
-- case
-- when Age > 30 then 'Old'
-- when Age between 27 and 30 then 'Young'
-- else 'Baby'
-- end as 'Young/Old'
-- from [Dunder Mifflin].dbo.EmployeeDemographics
-- order by Age


-- Having Clause

-- select JobTitle, COUNT(JobTitle) as JobTitle_Count
-- from [Dunder Mifflin].dbo.EmployeeSalary
-- group by JobTitle
-- having COUNT(JobTitle) > 1
-- order by JobTitle_Count desc

-- select * from [Dunder Mifflin].dbo.EmployeeDemographics


-- Update & Delete

-- update [Dunder Mifflin].dbo.EmployeeDemographics
-- set Age = 31
-- where EmployeeID = 1003

-- delete
-- from [Dunder Mifflin].dbo.EmployeeDemographics
-- where EmployeeID = 1010



-- [Aliasing]	...  as (alias)

-- select * from [Dunder Mifflin].dbo.EmployeeDemographics as Demo

-- select FirstName + '  ' + LastName as FullName
-- from [Dunder Mifflin].dbo.EmployeeDemographics