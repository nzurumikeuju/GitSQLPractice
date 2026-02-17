# GitSQLPractice (SSMS + VS Code + GitHub)
## Project Overview

This project demonstrates a professional SQL Server development workflow integrated with Git version control. It includes database schema creation, seed data management, analytical views, and stored procedures designed for reporting and business intelligence scenarios.

The project was developed using SSMS for database execution and VS Code for source control integration with GitHub.

## Tech Stack
- SQL Server / T-SQL (SSMS)
- VS Code + SQL Server (mssql) extension
- Git + GitHub

## Project Structure
database/
tables/ -- DDL scripts
data/ -- seed scripts
views/ -- staging + mart views
procedures/ -- stored procedures (portfolio focus)
migrations/ -- schema changes over time
docs/
---

## Database Setup Workflow

This project follows a structured SQL development workflow using 
Git version control and organized project folders.

### 1. Project Folder Organization

The project was created on the Desktop and structured as:

GitSQLPractice/
│
├── database/
│ ├── tables/ → Table creation scripts (DDL)
│ ├── data/ → Seed data scripts
│ ├── views/ → Reporting and staging views
│ ├── procedures/ → Stored procedures
│ ├── migrations/ → Schema evolution scripts
│
├── docs/ → Documentation and notes
├── README.md
├── .gitignore

This structure mirrors professional database DevOps workflows 
where database objects are version-controlled separately.

---

## 2. Table Creation Process

Tables were created using T-SQL scripts in SSMS and saved into:
database/tables/create_tables.sql

This ensures:

- Database schema reproducibility
- Version tracking of schema changes
- Easy deployment to new environments
- Collaboration readiness

Example:

```sql
CREATE TABLE dbo.Customers (
    CustomerID INT IDENTITY PRIMARY KEY,
    Email NVARCHAR(100),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    CreatedAt DATETIME DEFAULT GETDATE()
);
```
---
## 3. Integration with Git

<<<<<<< HEAD

After schema creation:Scripts were saved to organized folders
=======
After schema creation, Scripts were saved to organized folders
>>>>>>> e4a4c831b55c752c0626f2f2f5c6c7ceb290edda
Git was initialized locally
Commits tracked schema evolution
Repository pushed to GitHub

This demonstrates best practices for database version control.
---

## 4. Create a Stored Procedure
### dbo.usp_GetCustomerOrders
**Purpose:** Returns orders for a customer, with optional date filters and order totals.

**Example:**
```sql
EXEC dbo.usp_GetCustomerOrders @CustomerID = 1;
EXEC dbo.usp_GetCustomerOrders @CustomerID = 1, @StartDate='2026-02-01', @EndDate='2026-02-28';

```
---
## 5. Database Views (Analytics Layer)

This project includes SQL views designed for reporting, data cleaning, 
and analytics preparation. These demonstrate how raw transactional data 
can be transformed into business-ready datasets.

---

### 1. CREATE VIEW stg_customers_clean (Staging View)
Example:
```sql
CREATE VIEW stg.CustomersClean AS
SELECT
    CustomerID,
    LOWER(Email) AS Email,
    FirstName,
    LastName,
    CreatedAt
FROM dbo.Customers;
GO
```
Purpose:
- Clean and standardize customer data
- Prepare data for downstream reporting
- Remove inconsistencies before analytics
 
Use Case:
Data preprocessing
Data quality improvement
BI data staging

### 2. CREATE VIEW mart_monthly_sales (Data Mart View)

```sql
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
```
Result
```sql
SELECT * FROM mart.MonthlySales
ORDER BY SalesYear, SalesMonth;
```
Purpose:
Aggregate sales by month
Support business reporting and dashboards
Provide quick insights into sales performance

Use Case:
Power BI dashboards
Monthly reporting
Executive analytics summaries

---
## 6. Business Context (Simulated Scenario)

This project models a simple sales system:

- Customers place orders
- Orders contain multiple products
- Sales data is aggregated for reporting
- Views support analytics and dashboards

The structure reflects common enterprise data workflows:
Transactional Tables → Staging Views → Data Mart Views → Reports.

---
## 7. Key Learnings

- Version controlling SQL projects using Git
- Structuring database projects professionally
- Designing analytical SQL views
- Writing reusable stored procedures
- Integrating SSMS with VS Code workflows

This repository demonstrates a practical SQL DevOps workflow and is part of my data analytics and database development portfolio.
