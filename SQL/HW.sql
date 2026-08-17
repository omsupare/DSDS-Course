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

-- Q.20 Display first 3 Savings accounts having balance greater than ₹25,000.
 SELECT AccountID,AccountType,Balance
 FROM Accounts
 WHERE AccountType = 'Savings' AND Balance >= 25000
 LIMIT 3;
 
 -- Intermediate level 
 -- Q.21  Display customers whose FirstName starts with 'P' and Phone IS NULL.
 SELECT * FROM Customers;
 SELECT FirstName,Phone
 FROM Customers
 WHERE FirstName LIKE "P%" AND Phone IS NULL;
 
 -- Q.22 Display accounts whose balance is NOT BETWEEN ₹20,000 and ₹50,000.
 SELECT AccountId,Balance
 FROM Accounts
 WHERE Balance BETWEEN 20000 AND 50000;
 
 -- Q.23 Display customers whose CustomerID is NOT IN (101,102,103).
 SELECT CustomerID,FirstName,LastName
 FROM Customers
 WHERE CustomerId NOT IN (101,102,103);
 
 -- Q.24 Display transactions that are Withdrawal and amount is less than ₹5000.
 -- Modification
 -- Display transactions that are UPI and amount is less than ₹5000.
 SELECT * FROM Transactions;
 
 SELECT TransactionId,TransactionType,Amount
 FROM Transactions
 WHERE TransactionType = 'UPI' AND Amount < 5000;
 
 -- Q.25 Display customers whose email ends with gmail.com and phone number is available.
 SELECT FirstName,LastName,Email,Phone
 FROM Customers
 WHERE Email LIKE "%@gmail.com" AND Phone IS NOT NULL;
 
 -- Q.26  Display distinct transaction types whose amount is greater than ₹5000.
 -- Modification
 -- Q.26  Display distinct transaction types whose amount is greater than ₹500.
 SELECT *
 FROM Transactions;
 
SELECT DISTINCT TransactionType,Amount
FROM Transactions
WHERE Amount > 500;

-- Q.27 Display all Savings accounts belonging to Branch 1 or Branch 3.
SELECT *
FROM Accounts;

SELECT AccountType,BranchID
FROM Accounts
WHERE AccountType = 'Savings' AND (BranchID = 201 OR BranchID = 203);

-- Q.28 Display customers whose first name contains 'ha' and DateOfBirth is after 1997.
-- Modification
-- Q.28 Display customers whose first name contains 'Pr' and DateOfBirth is after 2025.
SELECT *
FROM Customers;  

SELECT FirstName,DateOfBirth
FROM Customers
WHERE FirstName LIKE 'Pr%' AND DateOfBirth > 2025;

-- Q.29 Display accounts whose balance is greater than ₹30,000 but less than ₹80,000.
SELECT AccountID,Balance
FROM Accounts
WHERE Balance >= 30000 AND Balance <= 80000; 

-- Q.30 Display first 4 Deposit transactions after skipping first 2 deposits.
-- Data is not like this 

-- Q.31 Display customer names whose phone number is NULL OR email starts with s.
SELECT * 
FROM Customers;

SELECT FirstName,LastName,Email,Phone
FROM Customers
WHERE Phone IS NULL OR Email LIKE "s%";

-- Q.32 Display Savings accounts having balance greater than ₹10,000 AND belonging to Branch 1.

SELECT *
FROM Accounts;

SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE AccountType = 'Savings' AND Balance > 10000 AND BranchID = 201;  

-- Q.33 Display Current accounts having balance between ₹40,000 and ₹1,00,000.
SELECT *
FROM Accounts;

SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE AccountType = 'Current' AND BALANCE BETWEEN 40000 AND 100000; 

-- Q.34 Display customers whose last name starts with S and were created after 2024.
SELECT  FirstName,LastName,AccountCreationDate
FROM Customers
WHERE LastName LIKE "s%" AND YEAR(AccountCreationDate) > 2024;

-- Q.35 Display transactions whose amount is IN (2000,3000,5000,7000).
SELECT *
FROM Transactions;

SELECT TransactionID,Amount
FROM Transactions
WHERE Amount IN (2000,3000,5000,7000);  

-- Q.36 Display customers whose first name starts with R or P, phone number is available and CustomerID is greater than 103.

SELECT * FROM Customers;

SELECT FirstName,Phone,CustomerID
FROM Customers
WHERE (FirstName LIKE 'R%' OR FirstName LIKE 'P%') AND (Phone IS NOT NULL) AND (CustomerID > 103); 
 
-- Q.37 Display distinct balances greater than ₹15,000.

SELECT *
FROM Accounts;

SELECT DISTINCT AccountID,Balance
FROM Accounts
WHERE Balance > 15000; 

-- Q.38 Display all accounts except Savings accounts having balance above ₹25,000.
SELECT *
FROM Accounts;

SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE AccountType != 'Savings' AND
Balance > 25000;

-- Q.39 Display customers whose email contains gmail but phone number is missing.
SELECT *
FROM Customers;

SELECT FirstName,LastName,Email,Phone
FROM Customers
WHERE Email LIKE "%gmail.com" AND Phone IS NULL; 

-- Q.40 Display accounts whose balance is between ₹15,000 and ₹90,000 and AccountType is not Salary
SELECT *
FROM Accounts;

SELECT AccountID,AccuntType,Balance
FROM Accounts
WHERE AccountType != 'Salary' AND Balance BETWEEN 15000 AND 90000;

-- Level 5 (Challenge Questions)
 
 