select EmployeeID, FirstName, LastName 
from Employees
where City = 'London'

--เเสดงชื่อเมือง เเละประเทส
select City, Country from Customers


select distinct city, country from customers


select * from Customers where city = 'London' or City ='Vancouver'
select * from Products where Unitprice > 200

select * from Customers where Country = 'USA' or City = 'Vancouver'

select * from Products where UnitPrice >=50 and UnitsInStock <20 

--เเสดงข้อมูลสินค้าที่มีจำนวนคงเหลือตำ่กว่า 20 หรือ น้อยกว่าระดับการสังชื้อ
select * from Products
where UnitsInStock<20 or UnitsInStock <= ReorderLevel

--เปรียบเทียบ เเสดงข้อมูลสินค้า มีค่า500-100
select * from Products where UnitPrice Between 50 and 100

select * from Products where UnitPrice >= 50 and UnitPrice <= 100

select * from Customers where country in ('Brazill','Argentina','Mexico')

select * from Customers where Country = 'Brazill'
or Country = 'Argentina'
or Country = 'Mexico'
--การเปรียบเทียบเงื่อนไข โดยใช้ LIKE
SELECT *
FROM Employees
WHERE FirstName LIKE 'N%'
--ต้องการข้อมูลลูกค้าชื่อต้น A
SELECT *
FROM Customers
WHERE CompanyName LIKE 'A%'
--ต้องการข้อมูลลูกค้า] ลงท้ายด้วย Y
SELECT *
FROM Customers
WHERE CompanyName LIKE '%Y'
--ต้องการชื่อ นามสกุล พนักงานที่มีชื่อ 'an'
select firstname, lastname from Employees
where FirstName Like '%an%'
--ต้องการชื่อบริษัทลูกค้าที่มีตัวอักษรที่2 เป็น 'A'
select companyName from customers
where CompanyName like '_A'
--การเปรียบเทียบเงื่อนไข โดยใช้ LIKE
select * from Employees where FirstName Like'_____'
--การจัดเรียงข้อมูล(ORDER BY)
select ProductID,ProductName,UnitPrice
from Products
Order by UnitPrice --DSCE
--การจัดเรียงข้อมูล โดยใช้ ORDER BY , ASC
select CompanyName,ContactName
from Customers
order by ContactName ASC
--ต้องการชื่อ ราคาสินค้า จำนวนตงเหลือ ที่มีจำนวนคงเหลือสูงสุด 10 อันดับเเรก
select top 10 Productname,UnitPrice,UnitsInStock
from Products
order by UnitsInStock desc
--การจัดเรียงข้อมูล โดยใช้ORDER BY, ASC/DESC
select CategoryID, ProductName, UnitPrice
from Products
Order by CategoryID asc, UnitPrice desc
