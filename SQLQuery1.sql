--1.
select EmployeeID, TitleOfCourtesy,FirstName,LastName
from Employees
where country = 'usa'
--2.
select *
from products
where CategoryID in (1,2,3) and UnitPrice BETWEEN 100 and 200
--3.
select country, city, CompanyName, ContactName, Phone
from customers
where Region = 'WA' or Region = 'WY'
--4.
select *
from Products
where (CategoryID=1 and UnitPrice<=20)
    or(CategoryID=8 and UnitPrice>=150)
--5.
select  CompanyName
from Customers
where fax is Null
order by CompanyName
--6.
select *
from Customers
where CompanyName like '%come'



