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

--ต้องการรหัสสินค้า ซื่อสินค้า ที่ nancy ขายได้ ทั้งหมด เรียงตามลำดับสินค้า


SELECT DISTINCT
    p.ProductID   AS รหัสสินค้า,
    p.ProductName AS ชื่อสินค้า
FROM Employees e
JOIN Orders o 
    ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON p.ProductID = od.ProductID
WHERE e.FirstName = 'Nancy'
ORDER BY p.ProductID;

---ต้องการชื่อบริษัทลูกค้าชื่อ Around the horn ชื่อสินค้ามาจากประเทศอะไรบ้าง

select distinct
    s.Country        as ประเทศที่มาของสินค้า
from Customers c
JOIN Orders o on c.CustomerID = o.CustomerID
JOIN [Order Details] od on o.OrderID = od.OrderID
JOIN Products p on p.ProductID = od.ProductID
JOIN Suppliers s on s.SupplierID = p.SupplierID
WHERE c.CompanyName = 'Around the Horn'

--บริษัทลูกค้าชื่อ Around the horn ซื้อสินค้าอะไรบ้าง จำนวนเท่าใด

SELECT p.ProductID   AS ชื่อลูกค้า, p.ProductName   AS ชื่อสินค้า, SUM(od.Quantity) AS จำนวนที่ซื้อ
from Customers c 
join Orders o on c.CustomerID = o.CustomerID 
join [Order Details] od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
WHERE c.CompanyName = 'Around the Horn'
GROUP BY c.CompanyName, p.ProductID, p.ProductName
ORDER BY p.ProductID

--ต้องการหมายเลขใบสั่งซื้อ ชื่อพนักงาน เเละยอดขายในใบสั่งซื้อนั้น
SELECT o.OrderID      AS หมายเลขใบสั่งซื้อ, e.FirstName + ' ' + e.LastName AS ชื่อพนักงาน,
round(sum(od.Quantity * od.UnitPrice * (1 - od.Discount)),2) TotalCash
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, e.FirstName, e.LastName
ORDER BY o.OrderID
