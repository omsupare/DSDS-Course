-- SHOW DATABASES;

CREATE DATABASE BankingDB;

USE BankingDB;

-- DOUBLE CLICK KARKE BHI USE KAR SKTE HAI

-- DataTypes :
-- cloud or aws , mysql official documentation
-- 1. Tiny int
-- 2. Small Int
-- 3. Big Int

CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);

DESCRIBE Customers;

SELECT * FROM Customers;

-- INSERT (CustomerID) VALUES INTO Customers ;

CREATE TABLE Accounts (
	AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

DESC Accounts;

CREATE TABLE Transactions (
	TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

DESC Transactions;

CREATE TABLE Branches (
	BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

DESC Branches;

CREATE TABLE AccountBranches (
	AssignmentDate DATE
);

CREATE TABLE Loans (
	LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

ALTER TABLE Customers
ADD DateOfBirth DATE;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

DESCRIBE Customers;

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (BALANCE >= 1000);

DESCRIBE Accounts;

DROP TABLE Accountbranches;

ALTER TABLE Accounts
ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Accounts
ADD CONSTRAINT PK_AccountID PRIMARY KEY(AccountID);

Desc Accounts;

ALTER TABLE customers
MODIFY FirstName VARCHAR(50) NOT NULL;

DESC customers;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE(Email);

ALTER TABLE Branches
MODIFY BranchID VARCHAR(100) PRIMARY KEY;

ALTER TABLE Accounts
ADD BranchID VARCHAR(100);

ALTER TABLE Accounts DROP COLUMN BranchID;

ALTER TABLE Accounts
ADD CONSTRAINT FK_BranchID
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);

DESC Branches;
DESC accounts;
DESC Transactions;

ALTER TABLE Transactions
MODIFY TransactionID INT PRIMARY KEY;

-- OR

-- ALTER TABLE Transactions
-- ADD CONSTRAINT PK_Transactions
-- PRIMARY KEY (TransactionID);

ALTER TABLE transactions
ADD AccountID INT;

ALTER TABLE Transactions
ADD CONSTRAINT FK_AccountID
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

-- HOW TO CHECK IF WHAT IS THE CONSTRAINT NAME AND ITS TYPE
SELECT
	CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'bankingdb'
AND TABLE_NAME = 'Accounts';

DESC Loans;

ALTER TABLE loans
ADD CONSTRAINT PK_LoanID
PRIMARY KEY (LoanID);

ALTER TABLE Loans
ADD customerID INT;

ALTER TABLE Accounts DROP FOREIGN KEY FK_CustomerID;

ALTER TABLE Accounts
DROP COLUMN CustomerID;

ALTER TABLE Loans
ADD CONSTRAINT FK_CustomerID
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

-- Normalization and Denormalization important for interviews :
-- Normalization process of removing duplicate
-- divide large table into smaller table

INSERT INTO Customers 
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','sharma','rahul@gmail.com','9876543210','1998-04-15');

INSERT INTO Customers
VALUES
(102,'Ketan','Tiwari','ketan@gmail.com','8838938284','2026-08-04','2000-06-22');

INSERT INTO Customers
VALUES
(105,'Pranav','Roy','pranav@gmail.com','9876549125','2026-07-23','2002-01-05');


SELECT * FROM Customers;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

SELECT * FROM Accounts;

INSERT INTO Customers 
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(103,'Neha','Singh','neha@gmail.com','9277476727','2026-08-03','1992-07-03'),
(104,'Mukul','Jha','mukul@gmail.com','7929267534','2025-02-01','1995-11-06');

UPDATE customers 
SET 
    AccountCreationDate = '2025-06-29'
WHERE
    CustomerID = '101';   -- without this condition sab me update hojata
    
SELECT * FROM branches;

INSERT INTO branches 
(BranchID, BranchName, BranchAddress, BranchPhone) 
VALUES 
(201, 'Principal Branch','Bajaj Nager',654321),
(202, 'Gulshan Branch','Dharampeth',543289),
(203, 'Dhantoli Branch','Sitabuldi',876549);

SELECT * FROM Loans;

INSERT INTO Loans 
(loanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID) 
VALUES
('20261239','150000.45', '00004.00', '2026-05-09', '2027-05-09', 102),
('20241235','10000000.34', '00005.00', '2024-10-02', '2034-10-02', 101),
('20261236','800000.21', '00003.00', '2026-02-04', '2027-02-04', 103),
('20261237','500000.64', '00002.00', '2026-01-29', '2028-01-29', 105),
('20261238','25000.12', '00001.00', '2026-03-02', '2026-8-02', 104);

SELECT * FROM Transactions;

INSERT INTO Transactions 
(TransactionID,TransactionDate,Amount,TransactionType,AccountID) 
VALUES
(1001,'2026-08-04', 30.00, 'Net Banking',201);

INSERT INTO Transactions (TransactionID, TransactionDate, Amount, TransactionType, AccountID) 
VALUES
(1002, '2026-08-04', 150.00, 'UPI', 201),
(1003, '2026-08-05', 45.50, 'Debit Card', 202),
(1004, '2026-08-05', 1200.00, 'Credit', 203),
(1005, '2026-08-06', 85.25, 'Net Banking', 204);


SELECT * FROM customers;
SELECT * FROM Loans;
SELECT * FROM Transactions; 
SELECT * FROM Accounts;
SELECT * FROM Branches;

UPDATE Accounts 
SET 
    BranchID = '201'
WHERE
    AccountID = '201';
    
UPDATE Accounts 
SET 
    BranchID = '202'
WHERE
    AccountID = '202';
    
UPDATE Accounts 
SET 
    BranchID = '203'
WHERE
    AccountID = '203';
    
UPDATE Accounts 
SET 
    BranchID = '202'
WHERE
    AccountID = '204';
    
UPDATE Accounts 
SET 
    BranchID = '201'
WHERE
    AccountID = '205';

INSERT INTO accounts(AccountID, AccountType, Balance, CustomerID) VALUES
(202,'Current',50000,102),
(203,'Savings',45000,103),
(204,'Current',35000,104),
(205,'Savings',60000,105);

UPDATE Accounts
SET Balance = 80000
WHERE CustomerId = 101;

UPDATE Accounts
SET Balance = balance + 2000
WHERE CustomerId = 101;

UPDATE Customers
SET 
	email = 'rahulsharma@gmail.com',
    phone = '7854321045'
WHERE 
	CustomerId = 101;
    
SELECT 
    customerID, firstname,phone
FROM
    Customers;

SELECT * FROM Accounts
WHERE AccountType != 'Savings';


SELECT * FROM Accounts
WHERE Balance <= 50000;

SELECT * FROM Accounts
WHERE AccountType = 'Savings' OR Balance > 50000;


-- In Operator  01-07-26 ke baad

SELECT firstname, lastname, accountcreationdate
FROM Customers
WHERE AccountcreationDate > '2026-07-01';

-- Multiple customers by phone numbers using IN operator

SELECT * FROM Customers;

SELECT firstname,lastname,phone
FROM Customers
WHERE Phone IN (7854321045,9277476727,9876549125);

SELECT firstname,lastname,phone
FROM Customers
WHERE Phone = '7854321045' OR Phone = '9277476727' OR Phone = '9876549125';

-- BETWEEN OPERATOR

SELECT * FROM Accounts;

SELECT CustomerID, AccountType, Balance 
FROM Accounts
WHERE BALANCE BETWEEN '20000' AND '50000';  -- the values specified in range are included in the result

SELECT CustomerID, AccountType, Balance 
FROM Accounts
WHERE BALANCE >= 20000 AND BALANCE <= 50000;   -- using comparison operators 

-- LIKE OPERATOR : Used for pattern matching, % matches any number of charcater and even zero characters, _ matches only one character

SELECT * FROM Customers;

SELECT * 
FROM Customers 
WHERE FirstName LIKE 'K%';

SELECT * FROM Accounts;

SELECT * 
FROM Accounts
WHERE AccountType LIKE 'S%';

SELECT * 
FROM Customers 
WHERE FirstName LIKE 'K%';

-- Find all customers whose lastname ends with letter 'a' :

SELECT * 
FROM Customers 
WHERE LastName LIKE '%a';

-- Find all customers whose last name has exactly 3 chracters, not that much used
SELECT * 
FROM Customers
WHERE LastName LIKE '___';

-- Order By Clause :
-- sort accounts table according to customer balance.
SELECT customerID,Balance
FROM Accounts
ORDER BY Balance;

-- sort the branches table according to the branch name
SELECT BranchID, BranchName 
FROM Branches
ORDER BY BranchName;

-- sort accounts table according to customer balance from highest to lowest
SELECT accountID, Balance
FROM Accounts
ORDER BY Balance DESC;

-- SORTING ACCORDING TO MULTIPLE COLUMNS:
-- Sort accounts table according to the accounttype and balance
SELECT CustomerID,AccountID,AccountType, Balance
FROM Accounts
ORDER BY AccountType DESC, Balance DESC;

-- LIMIT AND OFFSET PAGINATION : DISTINCT

-- Different types of accounts 

SELECT DISTINCT AccountType
FROM Accounts;

SELECT * FROM Transactions;

SELECT DISTINCT TransactionType, AccountID
FROM Transactions;

SELECT * 
FROM TRANSACTIONS
LIMIT 2;

-- OFFSET skip karta hai rows it works with limit
SELECT * 
FROM Customers
LIMIT 2 OFFSET 2;

SELECT customerID,Balance 
FROM Accounts
ORDER BY BALANCE DESC
LIMIT 1 OFFSET 2;

-- OR
SELECT customerID,Balance
FROM Accounts
ORDER BY BALANCE DESC
LIMIT 2,1;   -- HERE 2 specifies the rows to skip and 1 specifies no. of rows to return

SELECT * FROM Accounts;

SELECT * FROM customers;

INSERT INTO Customers
(CustomerID,FirstName,LastName,Email,Phone,AccountCreationDate,DateOfBirth)
VALUES
(106,'Priya','Patil','priya@gmail.com',NULL,'2026-08-01','2020-08-03'),
(107,'Amit','Verma','amit@gmail.com','7865433562','2026-08-03','2020-07-02'),
(108,'Sneha','Kulkarni','sneha@gmail.com',NULL,'2026-05-01','2020-10-03'),
(109,'Abhijeet','Sirsat','abhi@gmail.com',NULL,'2026-08-01','2020-08-03');

SELECT *
FROM Customers
WHERE Phone IS NULL;

SELECT *
FROM Customers
WHERE Phone IS NOT NULL;

SELECT * FROM Accounts;

SELECT * FROM Branches;

INSERT INTO Accounts
(AccountID,AccountType,Balance,CustomerID,BranchID)
VALUES
(106,'Current',70000,106,201),
(107,'Savings',55000,107,203),
(108,'Current',25000,108,202),
(109,'Savings',40000,109,203);

SELECT * FROM Accounts;

INSERT INTO Transactions
(TransactionID,TransactionDate,Amount,TransactionType,AccountID)
VALUES
(1006,'2025-09-21',1200,'Debit Card',106),
(1007,'2025-03-4',2500,'UPI',107),
(1008,'2026-02-22',3000,'Net Banking',108),
(1009,'2025-09-2',4000,'UPI',109);

SELECT * FROM Transactions;

-- INSERT INTO Loans
-- (LoanID,LoanAmount,InterestRate,StartDate,EndDate,CustomerID)
-- VALUES
-- (),
-- (),
-- (1008,'2026-02-22',3000,'Net Banking',108),
-- (1009,'2025-09-2',4000,'UPI',109);

SELECT * FROM Loans;

-- CASE STATEMENT :
SELECT * FROM Accounts;

SELECT CustomerID,Balance,
CASE
	WHEN Balance >= 50000 THEN "High Value"
    ELSE "Low Value"
END AS Category
FROM Accounts;

-- Categorize the deposits in the transactions table as per conditions given :
-- if above 10000(included) High amount
-- if 5000(included) to 10000 Medium amount
-- if upto 500 Low Amount
-- For transaction type Withdrawal "Not Applicable"

SELECT * 
FROM Transactions;

SELECT TransactionID, Amount,
CASE
	WHEN Amount >= 1000 THEN "High amount"
    WHEN Amount BETWEEN 500 AND 1000 THEN "Medium amount"
    WHEN Amount >= 500 THEN "Low amount"
    ELSE "Not Applicable"
END AS Category
FROM Transactions;

SELECT *
FROM transactions;

-- Functions
-- upper function 
SELECT UPPER(FirstName),UPPER(LastName)
FROM customers;

-- lower function
SELECT LOWER(FirstName),LOWER(LastName)
FROM customers;

-- Length Function and char-length
-- it is counting the bytes because one english character is equals to 1 byte:
SELECT LastName, LENGTH(LastName) FROM Customers;

-- ex:2 
SELECT length("Nagpur") AS characters;  -- gives o/p in no. of bytes
SELECT length("नागपुर");     -- gives o/p in no. of bytes
SELECT length("ナーグプル");   -- gives o/p in no. of bytes

SELECT length("Nagpur");   -- gives o/p in no. of characters
SELECT char_length("ナーグプル");   -- gives o/p in no. of characters

-- concat
SELECT customerID,CONCAT(FirstName," ",LastName) AS FullName,phone FROM Customers;

-- substring 
SELECT SUBSTRING('Quadratically',5);

SELECT CustomerID, concat(substring(FirstName,1,1),".",LastName) AS FullName,phone
FROM Customers;

-- Trim Function :
SELECT LENGTH("  Hello World  ");   -- without trim
SELECT LENGTH(TRIM("  Hello World  "));  -- with trim
SELECT LENGTH(TRIM(SUBSTRING("Hello World",6)));

-- Replace Function :
SELECT replace("MAT mat","M","C");   -- case sensitive hai

 -- Built in Functions
-- 1. Round
SELECT * FROM Accounts;

SELECT ROUND(AVG(Balance),2)
FROM Accounts
WHERE AccountType = 'Savings';

-- 2. CEIL OR CEILING : always gives output in higher side
SELECT CEIL(ROUND(AVG(Balance),2))
FROM Accounts
WHERE AccountType = 'Savings';

-- 3. Floor : returns value smaller
SELECT FLOOR(ROUND(AVG(Balance),2))
FROM Accounts
WHERE AccountType = 'Current';

SELECT *
FROM Transactions;

-- UPI AND AVG Amount from Transactions 
SELECT ROUND(AVG(Amount),2)
FROM Transactions
WHERE TransactionType = 'UPI';

-- USE Floor 
SELECT FLOOR(ROUND(AVG(Amount),2))
FROM Transactions
WHERE TransactionType = 'UPI';


-- MOD Values  -->gives us remainder after division
SELECT (7/3);
SELECT MOD(7,3);

-- POWER()
SELECT POWER(2,3); 
SELECT POWER(1.5,3);

-- SQRT()
SELECT sqrt(16);

-- DATE Functions AND TIME 
-- NOW Functions

SELECT NOW();  
SELECT current_date();
SELECT current_time();

-- YEAR,MONTH,DAY
SELECT * FROM customers;
SELECT YEAR(DateOfBirth),MONTH(DateOfBirth) ,DAY(DateOfBirth) 
FROM customers;

-- datediff : to find difference between the two dates
SELECT *
FROM Customers;

-- Display FullName, and age in years from customers
SELECT CONCAT(FirstName," ",LastName) AS FullName,DateOfBirth,floor(datediff(current_date(),dateofbirth)/365) as age
FROM customers;

-- date_add() -- expiry date
SELECT CONCAT(FirstName," ",LastName) AS FullName,
AccountCreationDate,
DATE_ADD(AccountCreationDate,INTERVAL 1 YEAR) AS KYCRenewal
FROM Customers;

-- Aggregate Functions 
-- 1.Count Function
SELECT *
FROM Customers;

SELECT COUNT(*) AS TotalCustomers 
FROM Customers;

SELECT COUNT(phone) AS TotalCustomers 
FROM Customers;

-- 2. Sum Function
SELECT * 
FROM Accounts;

SELECT SUM(Balance) AS TotalBalance
FROM Accounts;

SELECT SUM(Balance) AS SavingsBalance
FROM Accounts
WHERE AccountType = 'Savings';

-- AVG() Function
SELECT * 
FROM Accounts;

SELECT AVG(Balance) AS AvgAmountTransactions
FROM Accounts;
 
SELECT AVG(Balance) AS AvgAmountDeposited
FROM Accounts
WHERE AccountType = 'Savings';

-- MAX() AND MIN()
SELECT * 
FROM Accounts;

SELECT MAX(BALANCE)
FROM Accounts
WHERE AccountType = 'Savings';

SELECT MIN(BALANCE)
FROM Accounts
WHERE AccountType = 'Savings';

-- GROUP BY CLAUSE
SELECT * FROM Transactions;

SELECT TransactionType,ROUND(SUM(Amount)) AS TotalAmount
FROM Transactions
GROUP BY(TransactionType);

SELECT * FROM Accounts;

-- Print the group according to AccountType on SUM of balance and avg balance and also specify the count 
-- single group by condition 
SELECT AccountType,COUNT(*),
SUM(Balance) AS TotalBalance,
AVG(Balance) AS AvgBalance
FROM Accounts
GROUP BY(AccountType);

SELECT * FROM BRANCHES;

-- Multiple Group By conditions 
SELECT * FROM Accounts;
SELECT branchID,AccountType,COUNT(AccountType) AS NoOfAccounts
FROM Accounts
GROUP BY branchID,accountType
ORDER BY BranchID;

-- Having  group by ke results ko filter kar rahe hai
SELECT branchID,AccountType,COUNT(AccountType) AS NoOfAccounts
FROM Accounts
GROUP BY branchID,accountType
HAVING NoOfAccounts >= 2 AND AccountType = 'Savings';



SELECT * FROM customers;

-- Find No. of accounts creation in specific years
SELECT YEAR(AccountCreationDate) AS Years,
COUNT(YEAR(AccountCreationDate)) AS NoOfAccCreation
FROM Customers
GROUP BY YEAR(AccountCreationDate)
ORDER BY Years;

-- Joins 

SELECT * FROM Loans;
SELECT * FROM Customers;

-- Find all customers having loans with their names

SELECT c.customerID,c.FirstName,c.LastName,l.LoanAmount,l.InterestRate
FROM Customers c
INNER JOIN loans l
ON
c.CustomerID = l.CustomerID;

-- Find BranchNames for all the Accountids savepoint
-- include accountid,accountype and branchname,branchaddress

SELECT * FROM Branches;
SELECT * FROM Accounts;

SELECT a.AccountId,a.AccountType,b.BranchName,b.BranchAddress
FROM Accounts a
INNER JOIN Branches b
ON
a.BranchId = b.BranchId
WHERE AccountType = 'Savings';

SELECT * FROM Transactions;
SELECT * FROM Accounts;

-- Find all the customers name,phone,accounttype,balance where account type is savings
 
SELECT c.FirstName,c.LastName,c.Phone,a.AccountType,a.Balance
FROM Customers c
INNER JOIN Accounts a
ON
c.CustomerId = a.CustomerId
WHERE AccountType = 'Savings';