--�	Create a new database named "CompanyDB."--
CREATE DATABASE CompanyDB

--�	Create a schema named "Sales" within the "CompanyDB" database.--
CREATE SCHEMA Sales

--�	Create a table named "employees" with columns: employee_id (INT), first_name (VARCHAR), last_name (VARCHAR), and salary (DECIMAL) within the "Sales" schema.--
CREATE SEQUENCE Sales.i
AS INT 
START WITH 1 
INCREMENT BY 1;

CREATE TABLE Sales.employees(
employee_id INT PRIMARY KEY DEFAULT(NEXT VALUE FOR Sales.i),
first_name varchar(20),
last_name varchar(20),
salary decimal
);

--�	Alter the "employees" table to add a new column named "hire_date" with the data type DATE.--
ALTER TABLE Sales.employees
ADD hire_date DATE

--�	Select all columns from the "employees" table.--
select *
from Sales.employees

--�	Retrieve only the "first_name" and "last_name" columns from the "employees" table.--
select first_name , last_name
from Sales.employees

--�	Retrieve �full name� as a one column from "first_name" and "last_name" columns from the "employees" table.--
select first_name+' '+last_name as 'full name'
from Sales.employees

--�	Show the average salary of all employees.--
select avg(salary) as 'average salary'
from Sales.employees

--�	Select employees whose salary is greater than 50000.--
select *
from Sales.employees
where salary>50000
order by salary

--�	Retrieve employees hired in the year 2020.--
select *
from Sales.employees
where year(hire_date)=2020

--�	List employees whose last names start with 'S.'--
select *
from Sales.employees
where last_name like 's%';

--�	Display the top 10 highest-paid employees.--
select top(20)*
from Sales.employees
order by salary DESC

--�	Find employees with salaries between 40000 and 60000.--
select *
from Sales.employees
where salary between 40000 and 60000
order by salary

--�	Show employees with names containing the substring 'man.'--
select *
from Sales.employees
where first_name like '%man%' or last_name like '%man%'

--�	Display employees with a NULL value in the "hire_date" column.--
select*
from Sales.employees
where hire_date is null

--�	Select employees with a salary in the set (40000, 45000, 50000).--
select*
from Sales.employees
where salary in (40000,45000,50000)
order by salary

--�	Retrieve employees hired between '2020-01-01' and '2021-01-01.'--
select *
from Sales.employees
where year(hire_date) between 2020 and 2021

--�	List employees with salaries in descending order.--
select*
from Sales.employees
order by salary DESC

--�	Show the first 5 employees ordered by "last_name" in ascending order.--
select top(5)*
from Sales.employees
where last_name is not null
order by last_name asc 

--�	Display employees with a salary greater than 55000 and hired in 2020.--
select *
from Sales.employees
where salary>55000 and year(hire_date)=2020

--�	Select employees whose first name is 'John' or 'Jane.'--
select*
from Sales.employees
where first_name like 'john' or first_name like 'jane'

--�	List employees with a salary less than or equal to 55000 and a hire date after '2022-01-01.'--
select*
from Sales.employees
where salary<=55000 and hire_date>'2022-01-01'
order by hire_date

--�	Retrieve employees with a salary greater than the average salary.--
select*
from Sales.employees
where salary > (select avg(salary) from Sales.employees);

--�	Display the 3rd to 7th highest-paid employees.--
select *
from Sales.employees
order by salary desc
offset 3 rows
fetch next 7 rows only

--�	List employees hired after '2021-01-01' in alphabetical order.--
select*
from Sales.employees
where hire_date>'2021-01-01'
order by first_name asc , last_name asc

--�	Retrieve employees with a salary greater than 50000 and last name not starting with 'A.'--
select * 
from Sales.employees
where salary>50000 and last_name not like 'A%'

--�	Display employees with a salary that is not NULL.--
select*
from Sales.employees
where salary is not null

--�	Show employees with names containing 'e' or 'i' and a salary greater than 45000.--
select* 
from Sales.employees
where first_name like'%e%' or last_name like '%e%' or first_name like '%i%' or last_name like '%i%' and salary>45000