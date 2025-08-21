--1
select c.CategoryName, p.ProductName, p.UnitPrice
from Products as p, Categories as c
where p.CategoryID=c.CategoryID
--2
select CategoryName, ProductName, UnitPrice
from Products Join Categories
on Products.CategoryID=Categories.CategoryID

select c.CategoryName, p.ProductName, p.UnitPrice
from Products as p, Categories as c
where p.CategoryID=c.CategoryID
and CategoryName = 'seafood'

select c.CategoryName,p. ProductName, p.UnitPrice
from p.Products Join c.Categories
on p.Products=c.CategoryID

select CompanyName, OrderID
from Orders, Shippers
where Shippers.ShipperID = Orders.ShipVia

select CompanyName, OrderID
from Orders join Shippers
on Shippers.ShipperID = Orders.ShipVia

select CompanyName, OrderID
from Orders,Shippers
where Shippers.ShipperID = Orders.ShipVia

select CompanyName, OrderID
from Orders,Shippers
where Shippers.ShipperID = Orders.ShipVia
and OrderID = 10275

select CompanyName, OrderID
from Orders join Shippers
on Shippers.ShipperID = Orders.ShipVia
where OrderID = 10275
