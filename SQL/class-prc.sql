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

-- INNER Join :
-- Find all the customers having with the loans :
SELECT * FROM Customers;
SELECT * FROM Loans;

SELECT  c.FirstName,c.LastName,l.loanAmount,l.InterestRate
FROM Customers c
JOIN Loans l
ON
c.customerId = l.customerId;

--  Find BranchNames for all the Accountids
--  Include accountid,accountype and branchname,branchaddress  

SELECT * FROM Branches;
SELECT * FROM Accounts;

SELECT a.AccountId,a.AccountType,b.BranchName,b.BranchAddress
FROM Accounts a
JOIN Branches b
ON
a.BranchId = b.BranchId
WHERE AccountType = 'Savings';

-- Find all the customers name,phone,accounttype,balance where account type is savings
SELECT FirstName,LastName,Phone,AccountType,Balance
FROM Customers c
JOIN Accounts a 
ON
c.customerId = a.customerID
Where AccountType = 'Savings';

-- Sub Queries :
-- AccountIDs having avg balance greater than savings accounts
SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE AccountType = 'Savings' AND Balance > (
	SELECT AVG(Balance) FROM Accounts
);

-- Find the accounts having highest balance :
SELECT AccountID,Balance
FROM Accounts 
WHERE Balance = (
	SELECT MAX(Balance) FROM Accounts
); 

-- Find customers whose year of birth is earlier than the average year of birth of all customers.
SELECT *
FROM Customers; 

SELECT CONCAT(FirstName," ",LastName) AS FullName,YEAR(DateOfBirth)
FROM Customers
WHERE YEAR(DateOfBirth) < (
	SELECT FLOOR(AVG(YEAR(DateOfBirth))) FROM Customers
);

SELECT FLOOR(AVG(YEAR(DateOfBirth))) AS YearOfBirth 
FROM Customers;

-- Multi - Row SubQuery :
-- Q.1 Find all customers who have taken at least one loan.  
SELECT *
FROM Customers
WHERE CustomerID IN (
	SELECT CustomerID FROM Loans
); 
SELECT * FROM Loans;

-- Q.2 Find all customers who have not taken any loan. 
SELECT * FROM Loans;
SELECT *
FROM Customers
WHERE CustomerID NOT IN (
	SELECT CustomerId FROM Loans
);

-- Q.3 Find all customers who have at least one Savings account.
SELECT *
FROM Customers;

SELECT *
FROM Accounts;

SELECT *
FROM Customers
WHERE CustomerID IN(
	SELECT CustomerID
	FROM Accounts
	WHERE AccountType = 'Savings' 
);

SELECT CustomerID,AccountType
FROM Accounts
WHERE AccountType = 'Savings';

-- Q.4 Find all customers who have an account in BranchID = 201.
SELECT *
FROM Accounts;

SELECT *
FROM Branches;

SELECT *
FROM Accounts
WHERE BranchID IN(
	SELECT BranchID 
	FROM Branches 
	WHERE BranchID = 201
);

SELECT BranchID 
FROM Branches 
WHERE BranchID = 201;

-- Q.5 Find all accounts whose balance is greater than any account in BranchID = 201.  (ANY-OR)  --> minimum value
SELECT *
FROM Accounts
WHERE Balance > ANY (
	SELECT Balance
    FROM Accounts
    WHERE BranchID = 201
);

SELECT AccountID,Balance
    FROM Accounts
    WHERE BranchID = 201;
    
-- Q.6 Find the branch with highest average account balance.
SELECT * FROM Accounts;
SELECT AVG(Balance) AS AverageBal,BranchID
FROM Accounts
GROUP BY BranchID
ORDER BY AverageBal DESC
LIMIT 1;

SELECT * FROM Accounts;

SELECT BranchID,Balance
FROM Accounts
WHERE Balance > ALL (
	SELECT AVG(Balance) AS AverageBal               -- 56000 Average bal tha toh usse bade vals
	FROM Accounts
);

SELECT AVG(Balance),BranchID AS AverageBal
FROM Accounts
GROUP BY BranchID;

-- Q.7 Find accounts whose balance is greater than the average
-- balance of their respective branch

SELECT *
FROM Accounts;

SELECT a.AccountID,a.Balance,a.BranchID
FROM Accounts a
WHERE a.Balance > (
	SELECT AVG(a2.Balance)
    FROM Accounts a2
    WHERE a2.BranchID = a.BranchID
);  

SELECT AVG(a2.Balance),a2.BranchID
    FROM Accounts a2
    GROUP BY a2.BranchID;
    
-- Q.8 Find Employees whose salary is greater than average salary of their respective department
SELECT *
FROM Employees;

SELECT e.EmployeeID,e.EmployeeName,e.Salary
FROM Employees e
WHERE e.Salary > (
	SELECT AVG(Salary)
    FROM Employees e2 
    WHERE e2.Department = e.Department
);

-- Q.9 Find Customers who have more than one Account.
SELECT c.CustomerID,c.FirstName,c.LastName
FROM Customers c
WHERE (
	SELECT COUNT(*)
    FROM Accounts a
    WHERE a.CustomerID = c.CustomerID
) > 1 ;