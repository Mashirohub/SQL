--1
select * from Products
where UnitPrice = 15
--2
select * from Products
where UnitsInStock < 250
--3
select productID,ProductName
from Products
where Discontinued = 1
--4
select productID, ProductName,UnitPrice 
from Products
where UnitPrice > 100 
--5
select productID,UnitPrice
from Products
where ProductName
like'%ยงลบ%'
--6
select ReceiptID, ReceiptDate,TotalCash
from Receipts
where ReceiptDate < '2023-02-15'
--7
select productID,ProductName,UnitsInStock
from Products
where UnitsInStock >=400
--8
select productID,ProductName,UnitPrice, UnitsInStock 
from Products
where ProductName in  ('เเชมพู', 'ดินสอ', 'เเป้งเด็ก', 'ยางลบ')
--9
select CategoryID, CategoryName[Decription]
from Categories
where CategoryName = 'เครื่องสำอาง'
--10
select Title,FirstName,LastName
from Employees
where [Position] = 'Sale Representative'
--11
select Title,FirstName+space(1),LastName, Empname, UserName
from Employees
--12
select username, password  
from Employees
where FirstName = 'ก้องนิรันดร์'
--13
select EmployeeID 
from Receipts
where ReceiptID = 3
--14
select productID, ProductName,UnitPrice
from Products
where CategoryID = 2
--15
select productID,ProductName,UnitPrice 
from Products
where CategoryID in (2,4)
