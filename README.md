# GitSQLPractice (SSMS + VS Code + GitHub)

A hands-on T-SQL project to practice **Git version control** with **SQL Server** using **SSMS for execution** and **VS Code for source control**.

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


## Stored Procedures (Portfolio)
### 1) dbo.usp_GetCustomerOrders
**Purpose:** Returns orders for a customer, with optional date filters and order totals.

**Example:**
```sql
EXEC dbo.usp_GetCustomerOrders @CustomerID = 1;
EXEC dbo.usp_GetCustomerOrders @CustomerID = 1, @StartDate='2026-02-01', @EndDate='2026-02-28';
