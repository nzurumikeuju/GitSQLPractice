CREATE VIEW stg.CustomersClean AS
SELECT
    CustomerID,
    LOWER(Email) AS Email,
    FirstName,
    LastName,
    CreatedAt
FROM dbo.Customers;
GO
