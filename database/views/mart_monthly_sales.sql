CREATE VIEW mart.MonthlySales AS
SELECT
    YEAR(o.OrderDate)  AS SalesYear,
    MONTH(o.OrderDate) AS SalesMonth,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalSales
FROM dbo.Orders o
JOIN dbo.OrderItems oi
    ON o.OrderID = oi.OrderID
WHERE o.Status = 'Completed'
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate);
GO

SELECT * FROM mart.MonthlySales
ORDER BY SalesYear, SalesMonth;

