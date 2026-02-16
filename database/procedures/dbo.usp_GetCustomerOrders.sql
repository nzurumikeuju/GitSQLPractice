USE GitSqlPractice;
GO

CREATE OR ALTER PROCEDURE dbo.usp_GetCustomerOrders
    @CustomerID INT,
    @StartDate  DATE = NULL,
    @EndDate    DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        o.OrderID,
        o.OrderDate,
        o.Status,
        SUM(oi.Quantity * oi.UnitPrice) AS OrderTotal
    FROM dbo.Orders o
    JOIN dbo.OrderItems oi
        ON oi.OrderID = o.OrderID
    WHERE o.CustomerID = @CustomerID
      AND (@StartDate IS NULL OR o.OrderDate >= @StartDate)
      AND (@EndDate   IS NULL OR o.OrderDate <= @EndDate)
    GROUP BY o.OrderID, o.OrderDate, o.Status
    ORDER BY o.OrderDate DESC, o.OrderID DESC;
END;
GO


EXEC dbo.usp_GetCustomerOrders @CustomerID = 1;


