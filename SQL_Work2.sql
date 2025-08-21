SELECT 
    o.OrderID AS รหัสใบสั่งซื้อ,
    c.CompanyName AS ชื่อลูกค้า,
    e.FirstName + ' ' + e.LastName AS ชื่อพนักงาน,
    o.OrderDate AS วันที่สั่งซื้อ,
    s.CompanyName AS ชื่อบริษัทข่นส่ง,
    o.ShipCity AS เมือง,
    o.ShipCountry AS ประเทศ,
    ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS ยอดเงินรวม
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN Shippers s ON o.ShipVia = s.ShipperID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, c.CompanyName, e.FirstName, e.LastName, o.OrderDate, s.CompanyName, o.ShipCity, o.ShipCountry
ORDER BY o.OrderID


--10.  จงแสดงชื่อสกุลพนักงานในคอลัมน์เดียวกัน ยอดขายสินค้าประเภท Beverage ที่แต่ละคนขายได้ ในปี 1996
SELECT e.FirstName  AS ชื่อพนักงาน,
ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS ยอดขาย_Beverages
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName = 'Beverages'
  AND YEAR(o.OrderDate) = 1996
GROUP BY e.FirstName

--11จงแสดงชื่อประเภทสินค้า รหัสสินค้า ชื่อสินค้า ยอดเงินที่ขายได้(หักส่วนลดด้วย) ในเดือนมกราคม - มีนาคม 2540 โดย มีพนักงานผู้ขายคือ Nancy
SELECT c.CategoryName AS ชื่อประเภทสินค้า, p.ProductID AS รหัสสินค้า, p.ProductName AS ชื่อสินค้า,
ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS ยอดขาย
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE e.FirstName = 'Nancy'
AND e.LastName = 'Davolio'
AND o.OrderDate BETWEEN '1997-01-01' AND '1997-03-31'
GROUP BY c.CategoryName, p.ProductID, p.ProductName
ORDER BY c.CategoryName, p.ProductID;
--12  จงแสดงชื่อบริษัทลูกค้าที่ซื้อสินค้าประเภท Seafood ในปี 1997
SELECT DISTINCT c.CompanyName AS ชื่อลูกค้า
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID
WHERE cat.CategoryName = 'Seafood'
AND YEAR(o.OrderDate) = 1997
ORDER BY c.CompanyName;
