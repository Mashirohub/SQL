--หาข้อมูลnancy
select title from Employees where FirstName = 'nancy'
--หาข้อมูลที่มีตำเเหน่งเดี่ยวกัน
select * from Employees where Title = (select title from Employees where FirstName = 'nancy')
--ต้องการชื่อนามสกุลมากที่สุด
select Firstname, Lastname from Employees
where BirthDate = (select min(BirthDate)from Employees)
--
select ProductName from Products
where unitprice > (select UnitPrice from Products where ProductName = 'Ikura')
--
select CompanyName from Customers
where city = (select City from Customers where CompanyName = 'Around the Horn')
--
select FirstName, LastName from Employees
where HireDate = (select max(HireDate)from Employees)
--
select * from Orders
where ShipCountry not in (select distinct country from Suppliers)
--สินค้าราคาน้อยกว่า 50
select  ROW_NUMBER() over (order by unitprice desc) AS RowNum,
ProductName, UnitPrice from Products where UnitPrice < 50