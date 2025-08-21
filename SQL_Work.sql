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
--ยังไม่เสร็จ


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

--USA UK
select p.ProductID   AS รหัสสินค้า,p.ProductName AS ชื่อสินค้า ,s.CompanyName AS บริษัทผู้จำหน่าย, s.Country AS ประเทศ
from Products as p join Suppliers AS s
ON s.SupplierID = p.SupplierID
where Country in ('USA', 'UK')

SELECT e.EmployeeID   AS รหัสพนักงาน,e.FirstName ,o.OrderID      AS รหัสใบสั่งซื้อ
FROM Employees e JOIN Orders o
ON e.EmployeeID = o.EmployeeID
ORDER BY e.EmployeeID, o.OrderID;
--
select O.OrderID เลขใบสั่งซื้อ, C.CompanyName ลูกค้า
from Orders O, Customers C, Employees E
where O.CustomerID=C.CustomerID
and O.EmployeeID=E.EmployeeID
--
SELECT O.OrderID เลขใบสั่งซื้อ, C.CompanyName ลูกค้า,
E.FirstName พนักงาน, O.ShipAddress ส่งไปที่

FROM Orders O

join Customers C on O.CustomerID=C.CustomerID

join Employees E on O.EmployeeID=E.EmployeeID
--

select e.EmployeeID, FirstName , count(*) as [จ านวน order]

, sum(freight) as [Sum of Freight]

from Employees e join Orders o on e.EmployeeID = o.EmployeeID

where year(orderdate) = 1998

group by e.EmployeeID, FirstName


--

SELECT 
    s.CompanyName,
    COUNT(*) AS จำนวนOrders
FROM Shippers AS s
JOIN Orders AS o
    ON s.ShipperID = o.ShipVia
GROUP BY s.CompanyName
ORDER BY COUNT(*) DESC;
--
SELECT p.ProductID     AS รหัสสินค้า, p.ProductName   AS ชื่อสินค้า,  SUM(od.Quantity) AS จำนวนที่ขายได้ทั้งหมด
FROM Products AS p
JOIN [Order Details] AS od
ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY SUM(od.Quantity) DESC;
