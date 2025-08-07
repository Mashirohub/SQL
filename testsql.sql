--1
select * from Products
where UnitPrice = 15
--2
select * from Products
where UnitsInStock < 250
--3
select productID
from Products
where Discontinued = 0