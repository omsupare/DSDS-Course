USE BankingDb;

-- Aggregate Functions :
-- 1. Count  it counts all of the rows and even missing values but when we give specific column name it skips its.
SELECT *
FROM Customers;

SELECT COUNT(*) AS TotalCustomers
FROM Customers; 

-- 2. Sum Function :
SELECT * 
FROM Accounts;

SELECT SUM(balance) AS TotalBalance
FROM Accounts; 

SELECT SUM(balance) AS Savings_Balance
FROM Accounts
WHERE AccountType = 'Savings';

-- 3. Avg Function :
SELECT *
FROM Accounts;

SELECT ROUND(AVG(Balance),2) AS AvgAmountTransactions
FROM Accounts; 

SELECT ROUND(AVG(balance),2) AS AvgAmountDeposited
FROM Accounts
WHERE AccountType = 'Savings';

-- MAX and MIN
SELECT *
FROM Accounts;

SELECT MAX(Balance)
FROM Accounts
WHERE AccountType = 'Savings';

SELECT MIN(Balance)
FROM Accounts
WHERE AccountType = 'Savings';

-- Group By 
SELECT *
FROM Transactions;

SELECT TransactionType,ROUND(SUM(Amount)) AS TotalAmount
FROM Transactions
GROUP BY TransactionType;

SELECT TransactionType,COUNT(*) AS NoOfTransactions,
SUM(Amount) AS TotalAmount,
AVG(Amount) AS AvgAmount
FROM Transactions
GROUP BY TransactionType;

SELECT * FROM Branches;

SELECT BranchId,AccountType,COUNT(*) AS NoOfAccounts
FROM Accounts
GROUP BY BranchId,AccountType
ORDER BY BranchId;

-- Having Clause is used to filter the results of group by clause
SELECT BranchID,AccountType,COUNT(*) AS NoOfAccounts
FROM Accounts
GROUP BY BranchId,AccountType
HAVING  NoOfAccounts >= 2 AND AccountType = 'Savings';

-- Function  511 line
 