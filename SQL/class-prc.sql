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

-- Find no. of accounts created in specific year :
SELECT * FROM Customers;

SELECT YEAR(AccountCreationDate) AS Years,
COUNT(*) AS NoOfAccCreated
FROM Customers
GROUP BY Years
ORDER BY Years;

-- 1. UPI AND AVG Amount from Transactions 
SELECT * FROM Transactions;
SELECT TransactionType,ROUND(AVG(Amount),2)
FROM Transactions
WHERE TransactionType = 'UPI';
 
-- 2. USE Floor
SELECT Transactiontype,FLOOR(AVG(Amount))
FROM Transactions
WHERE TransactionType = 'UPI';  

-- 3. MOD Values
SELECT (7/3) AS Division;
SELECT MOD(7,3) AS Remainder;

-- 4. Power
SELECT power(2,3); 
SELECT POWER(1.5,3);

-- 5. SQRT
SELECT SQRT(16) AS SquartRoot; 

-- 6. Date And Time Functions 
SELECT NOW();
SELECT current_date();
SELECT current_time();

-- 7. Year,Month,Day
SELECT * FROM customers;
SELECT YEAR(AccountCreationDate),MONTH(AccountCreationDate),DAY(AccountCreationDate)
FROM Customers; 

-- 8. Datediff
-- Display FullName, and age in years from customers

SELECT * FROM Customers;
SELECT CONCAT(FirstName,' ',LastName) AS FullName,
DateOfBirth,
FLOOR(datediff(current_date(),DateOfBirth)/365) AS Age
FROM Customers; 
