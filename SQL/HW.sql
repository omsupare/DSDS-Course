-- Practice Questions :

SELECT * FROM customers;

-- Q.1 AccountCraetionDate after 2025-01-01
SELECT CustomerID,FirstName,Email
FROM customers
WHERE AccountCreationDate > '2025-01-01';

-- Q.2 Balance > 20,000
SELECT AccountID, AccountType
FROM Accounts
WHERE AccountType = 'Savings' AND Balance > 20000;

-- Q.3 Phone Numbers Null
SELECT * FROM Customers;

SELECT CustomerID, FirstName, LastName, Phone
FROM Customers
WHERE Phone = NULL;

-- Q.4 Distinct AccountType in Accounts Table :
SELECT DISTINCT AccountType
FROM Accounts;

-- Q.5 Customers FirstName Starts with R
SELECT FirstName
FROM Customers
WHERE FirstName = 'R';

-- Q.6 Accounts --> Balance between 20000 AND 60000

SELECT AccountID,Balance
FROM Accounts
WHERE Balance BETWEEN 20000 AND 60000;

-- Q.7 Deposit Transactions greater than 3000.
SELECT * FROM Transactions;

SELECT TransactionID,Amount
FROM Transactions
WHERE Amount >= 3000;

-- Q.8 CustomerID IN
SELECT CustomerID, FirstName, LastName
FROM Customers 
WHERE CustomerID IN (101,103,106,109);

-- Q.9 Display first 5 customers ordered by CustomerID.
SELECT FirstName, LastName, CustomerID
FROM Customers
LIMIT 5;

-- Q.10 Display customers after skipping first 3 records.
SELECT * FROM Customers;
SELECT FirstName, LastName
FROM Customers
LIMIT 6 OFFSET 3;

-- Level 2 Medium 
-- Q.11 Display Savings accounts having balance between ₹20,000 and ₹80,000.
SELECT * FROM Accounts;

SELECT AccountID, AccountType,Balance
FROM Accounts
WHERE AccountType = 'Savings' AND Balance BETWEEN '20000' AND '80000';

-- Q.12 Display customer names whose phone number is NULL and account was created after 2025-01-01.
SELECT * FROM Customers;

SELECT FirstName,LastName
FROM Customers
WHERE Phone = 'NULL' AND AccountCreationDate > 2025-01-01;

-- Q.13 Display all customers whose FirstName starts with 'A' OR LastName starts with 'S'.
SELECT FirstName,LastName
FROM Customers
WHERE FirstName LIKE 'A%' OR LastName LIKE '%s';

-- Q.14 Display all accounts whose AccountType is Savings or Salary and balance is greater than ₹10,000.
SELECT *
FROM Accounts
WHERE AccountType = 'Savings';

-- Q.15 Display customers whose CustomerID is IN (101,102,105,109) and phone number is not NULL.
SELECT *
FROM Customers;

SELECT CustomerID,Phone
FROM customers
WHERE CustomerID IN (101,102,105,109) AND Phone != '';

-- Q.16 Display transactions whose Amount is between ₹2,000 and ₹8,000 and TransactionType is Deposit.  changes according to data 'UPI' and amount between '100' to '200'
SELECT * 
FROM Transactions;

SELECT TransactionType,Amount
FROM Transactions
WHERE TransactionType = 'UPI' AND Amount BETWEEN 100 AND 200;

-- Q.17 Display distinct BranchIDs from Accounts where balance is greater than ₹30,000.
SELECT *
FROM Accounts;

SELECT DISTINCT BranchID
FROM Accounts
WHERE Balance > 30000;

-- Q.18 Display customers whose email contains gmail and first name ends with a.
SELECT *
FROM Customers;

SELECT Email,FirstName
FROM Customers
WHERE Email LIKE '%gmail%' AND FirstName LIKE '%a';

-- Q.19 Display customers whose DateOfBirth is between 1995 and 2000.
SELECT *
FROM Customers;

SELECT FirstName,LastName
FROM Customers
WHERE DATEOFBIRTH BETWEEN 1995 AND 2000; 