-- Q.1 Display customers who do not have a Current account.
USE Bankingdb;
SELECT *
FROM Customers;

SELECT * FROM Accounts;


SELECT c.customerId,CONCAT(c.FirstName," ",c.LastName) AS FullName,a.AccountType
FROM Customers c 
INNER JOIN Accounts a 
ON
c.CustomerId = a.CustomerId
WHERE AccountType != 'Current';

-- Q.2 Display Customername,Accountcreation date,Accounttype,Balancefor customers whose account was created in 2025.
SELECT CONCAT(c.FirstName," ",c.LastName) AS FullName,c.AccountCreationDate,
a.AccountType,a.Balance
FROM Customers c 
INNER JOIN Accounts a
ON 
c.CustomerId = a.CustomerId
WHERE YEAR(c.AccountCreationDate) > '2025';

-- Q.3 Display:Customername,Accountcreation date,Accounttype and calculate the number of days since account creation.
SELECT CONCAT(c.FirstName," ",c.LastName) AS FullName,
c.AccountCreationDate,a.AccountType,DATEDIFF(NOW(),c.AccountCreationDate) AS NumOfDays
FROM Customers c 
INNER JOIN Accounts a
ON
c.CustomerId = a.CustomerId;

-- Q.4 Find the number of accounts held by each customer. Doubt
-- left,right,inner tino bhi try kia 
SELECT * FROM Customers;
SELECT * FROM Accounts;

SELECT c.CustomerId,CONCAT(c.FirstName," ",c.LastName) AS FullName,
COUNT(a.AccountType)
FROM Customers c 
RIGHT JOIN Accounts a 
ON
c.CustomerId = a.CustomerId
GROUP BY a.AccountType
ORDER BY a.CustomerId;   

SELECT a.AccountType,COUNT(a.AccountType),a.customerId
FROM Accounts a
INNER JOIN Customers c 
ON
a.CustomerId = c.CustomerId
GROUP BY AccountType;

-- Q.5  Find the total balance held by each customer.       DOUBT
SELECT * FROM Accounts;
SELECT CONCAT(c.FirstName," ",c.LastName) AS FullName,
a.balance
FROM Customers c 
INNER JOIN Accounts a 
ON
c.CustomerId = a.CustomerId;

-- Q.6  Find the number of customers for each account type.

-- Q.7 Find the total balance for each account type.
SELECT *
FROM Accounts
ORDER BY CustomerId; 

SELECT customerId,SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY customerId
ORDER BY customerId;

-- Q.8  Find the highest balance held by each account type.
SELECT CustomerId,MAX(Balance) AS HighestBalance    -- account type nhi display hoga
FROM Accounts
GROUP BY CustomerId;

-- Q.9  Find the number of customers for each branch.
SELECT *
FROM Accounts
ORDER BY CustomerId;

SELECT COUNT(DISTINCT CustomerId) AS NumOfCust    -- distinct bahar likha tha toh use nhi huya isiye parenthesis ke ander likha
FROM Accounts;

SELECT BranchName,COUNT(DISTINCT CustomerId)
FROM Accounts a
INNER JOIN Branches b                                             -- 107 me bhi different branch hai not just savings or current ki baat hai
ON
a.BranchId = b.BranchId
GROUP BY BranchName,customerId
ORDER BY CustomerId;

SELECT * FROM Branches;

SELECT BranchName,COUNT(DISTINCT CustomerId) AS TotalNumCust
FROM Branches b 
INNER JOIN Accounts a 
ON
b.BranchId = a.BranchId
GROUP BY BranchName;

-- Q.10 Find customers whose total account balance is greater than ₹40,000.
SELECT * FROM Accounts;

SELECT a.CustomerId,CONCAT(c.FirstName," ",c.LastName) AS FullName,a.Balance
FROM Accounts a
INNER JOIN Customers c 
ON 
a.CustomerId = c.CustomerId
WHERE Balance > 40000
ORDER BY CustomerId;

-- Q.11 Find customers who have more than one account.

SELECT *
FROM Accounts;

SELECT CustomerId,COUNT(AccountType) AS NumOfAcc
FROM Accounts
GROUP BY CustomerId;

SELECT CustomerId,COUNT(AccountType) AS NumOfAcc
FROM Accounts
GROUP BY CustomerId
HAVING NumOfAcc > 1;

SELECT a.CustomerId,CONCAT(c.FirstName," ",c.LastName) AS FullName,
COUNT(a.AccountType) AS NumOfAcc
FROM Accounts a 
INNER JOIN Customers c 
ON
a.CustomerId = c.CustomerId
GROUP BY CustomerId
HAVING NumOfAcc > 1;

-- Q.12  Find customers who do not have an account.
SELECT *                     -- isme samjha left join kaha pr use hota hai,aur having ka bhi use samjha
FROM Accounts;

SELECT * FROM Customers;

SELECT c.CustomerId,COUNT(a.CustomerId)
FROM Customers c
LEFT JOIN Accounts a 
ON 
c.CustomerId = a.CustomerId
GROUP BY c.CustomerID;

SELECT c.CustomerId,CONCAT(c.FirstName," ",c.LastName) AS FullName,
COUNT(a.CustomerId) AS NumOfAcc
FROM Customers c
LEFT JOIN Accounts a 
ON 
c.CustomerId = a.CustomerId
GROUP BY c.CustomerID
HAVING NumOfAcc < 1;

-- Q. 13 Find customers who do not have any loan.
SELECT * FROM Loans;
SELECT * FROM Customers;

SELECT c.CustomerId,
CONCAT(FirstName," ",LastName) AS FullName,
COUNT(l.CustomerId) AS NumOfLoans
FROM Customers c 
LEFT JOIN Loans l 
ON
c.CustomerId = l.CustomerId
GROUP BY c.CustomerId
HAVING NumOfLoans < 1;

-- Q.14 Find customers who have never performed a transaction.
SELECT * FROM Customers;

SELECT * FROM Transactions;
																-- triple joins use hoga
SELECT c.CustomerId,COUNT(TransactionType)
FROM Customers c 
LEFT JOIN Transactions t 
ON
c.Customer = t.accountId;   -- matching nhi hai

-- Q. 15 Display all branches and their account count, including branches that have zero accounts.

SELECT * FROM Branches;
SELECT * FROM Accounts;

SELECT b.BranchId,b.BranchName,COUNT(AccountId) AS NumOfAcc         
FROM Branches b
LEFT JOIN Accounts a 
ON 
b.BranchId = a.BranchId
GROUP BY BranchId;

-- Q. 4 Find the number of accounts held by each customer.
SELECT CONCAT(c.FirstName," ",c.LastName) AS FullName,
COUNT(a.AccountId) AS NumOfAcc
FROM Customers c 
LEFT JOIN Accounts a 
ON
c.CustomerId = a.CustomerId
GROUP BY c.CustomerID;

-- Q.5 Find the total balance held by each customer.
SELECT * FROM Accounts;
SELECT c.CustomerId,CONCAT(c.FirstName," ",c.LastName) AS FullName,
SUM(a.Balance) AS TotalBalance 
FROM Customers c
LEFT JOIN Accounts a 
ON 
c.CustomerId = a.CustomerID
GROUP BY c.CustomerId;


--  Q.6 Find the number of customers for each account type.
SELECT * FROM Accounts;
SELECT AccountType,COUNT(CustomerID) AS NumOFCust
FROM Accounts
GROUP BY AccountType;