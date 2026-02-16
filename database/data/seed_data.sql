USE GitSqlPractice;
GO

INSERT INTO dbo.Customers (Email, FirstName, LastName)
VALUES
('okeke@email.com','Okeke','Uju'),
('igwe@email.com','Igwe','Mary'),
('abiodu@email.com','Abiodu','Alex'),
('linda@email.com','Lynda','Nzuru');
GO

INSERT INTO dbo.Products (SKU, ProductName, UnitPrice)
VALUES
('SKU001','Laptop',1200.00),
('SKU002','Mouse',25.50),
('SKU003','Keyboard',45.00),
('SKU004','Monitor',300.00);
GO

INSERT INTO dbo.Orders (CustomerID, OrderDate, Status)
VALUES
(1,'2026-02-01','Completed'),
(2,'2026-02-03','Completed'),
(1,'2026-02-08','Pending'),
(3,'2026-02-10','Completed');
GO

INSERT INTO dbo.OrderItems (OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1,1,1,1200.00),
(1,2,2,25.50),
(2,4,1,300.00),
(3,3,1,45.00),
(4,2,3,25.50);
GO
