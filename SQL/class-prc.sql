SHOW Databases;

CREATE DATABASE BankingDB1;
USE BankingDB1;

-- What is the difference between Tiny Int,Small INT,Big INT .
-- Tiny Int - 1 byte space,(-128,127) ranges hai
-- Small Int - 2 byte space (-32768,32767)
-- Big Int - 8 byte space  (-2^^63 to 2^^63 - 1)

CREATE TABLE Customers1(
	CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
); 

DESCRIBE Customers1;

CREATE Table Accounts1 (
	AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

DESC Accounts1;

CREATE TABLE Transactions1 (
	TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches1 (
	BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

DESC Branches1;

CREATE TABLE AccountBranches (
	Assignment DATE
);

CREATE TABLE Loans1 (
	LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

-- Alter Queries : Data control language
-- truncate function ka use puchna hai 
DESC customers1;

-- 1. columm add krne ke liye table me :  add use kia
ALTER TABLE customers1 
ADD DateOfBirth DATE; 

-- 2. Data type ki range badhani ho toh : modify use kia
ALTER TABLE customers1
MODIFY Phone VARCHAR(20);

DESC Customers1;

-- 3. Constraint add krna ho toh 
ALTER TABLE Accounts1
ADD CONSTRAINT chk_MinBalance
CHECK (Balance > 1000);
DESC Accounts1;

DROP Table AccountBranches;

-- 4.Adding a column 
ALTER TABLE accounts1
ADD CustomerID INT; 

-- Bina constraint use kie bhi kar skate the pr pata nhi kyu constraint use kiye 
ALTER TABLE accounts1
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers1(CustomerID);

DESC Accounts1;

ALTER TABLE Accounts1
ADD CONSTRAINT PK_AccountID PRIMARY KEY (AccountID);

DESC Customers1;

ALTER TABLE customers1
MODIFY FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Customers1
ADD CONSTRAINT uq_Email UNIQUE(Email);

DESC Branches1;

ALTER TABLE Branches1 
MODIFY BranchID INT PRIMARY KEY;

DESC Accounts1;

-- phele column banaya hamne  
ALTER TABLE accounts1
ADD BranchID INT;

ALTER TABLE Accounts1
DROP COLUMN BranchID;

ALTER TABLE Accounts1 
ADD CONSTRAINT FK_BranchID
FOREIGN KEY (BranchID)
REFERENCES Branches1(BranchID);

DESC Customers1;
DESC Branches1;
DESC Accounts1;
DESC Transactions1;

ALTER TABLE Transactions1
MODIFY TransactionID INT PRIMARY KEY;

ALTER TABLE Transactions1
ADD AccountID INT;

ALTER TABLE Accounts1
ADD CONSTRAINT PK_AccountID PRIMARY KEY(AccountID);

ALTER TABLE Transactions1
ADD CONSTRAINT FK_AccountID
FOREIGN KEY (AccountID)
REFERENCES Accounts1(AccountID);

-- How to check constraint Names 
SELECT
	CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'bankingdb1'
AND TABLE_NAME = 'Accounts1';

DESC Loans1;

ALTER TABLE Loans1
ADD CONSTRAINT PK_LoanID PRIMARY KEY(LoanID); 

ALTER TABLE loans1
ADD CustomerID INT;

ALTER TABLE Loans1
ADD CONSTRAINT FK_CustomerID
FOREIGN KEY (CustomerID)
REFERENCES Customers1(CustomerID);

-- Normalization and Denormalization :

INSERT INTO Customers1 
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','sharma','rahul@gmail.com','9876543210','1998-04-15'); 

INSERT INTO Customers1
VALUES
(102,'Ketan','Tiwari','ketan@gmail.com','8838938284','2026-08-04','2000-06-22');

INSERT INTO Customers1
VALUES
(105,'Pranav','Roy','pranav@gmail.com','9876549125','2026-07-23','2002-01-05');

SELECT * FROM Customers1;

INSERT INTO Accounts1
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

SELECT * FROM Accounts1;

INSERT INTO Customers1 
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(103,'Neha','Singh','neha@gmail.com','9277476727','2026-08-03','1992-07-03'),
(104,'Mukul','Jha','mukul@gmail.com','7929267534','2025-02-01','1995-11-06');

UPDATE Customers1
SET AccountCreationDate = '2025-06-29'
WHERE CustomerID = '101';

SELECT * FROM Customers1;

INSERT INTO branches1 
(BranchID, BranchName, BranchAddress, BranchPhone) 
VALUES 
(201, 'Principal Branch','Bajaj Nager',654321),
(202, 'Gulshan Branch','Dharampeth',543289),
(203, 'Dhantoli Branch','Sitabuldi',876549);

INSERT INTO Loans1 
(loanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID) 
VALUES
('20261239','150000.45', '00004.00', '2026-05-09', '2027-05-09', 102),
('20241235','10000000.34', '00005.00', '2024-10-02', '2034-10-02', 101),
('20261236','800000.21', '00003.00', '2026-02-04', '2027-02-04', 103),
('20261237','500000.64', '00002.00', '2026-01-29', '2028-01-29', 105),
('20261238','25000.12', '00001.00', '2026-03-02', '2026-8-02', 104);

SELECT * FROM Loans1;
SELECT * FROM Branches1;

INSERT INTO Transactions1 
(TransactionID,TransactionDate,Amount,TransactionType,AccountID) 
VALUES
(1001,'2026-08-04', 15000, 'Withdrawal',201);

INSERT INTO accounts1(AccountID, AccountType, Balance, CustomerID) VALUES
(202,'Current',50000,102),
(203,'Savings',45000,103),
(204,'Current',35000,104),
(205,'Savings',60000,105);

SELECT * FROM Accounts1;

INSERT INTO Transactions1 (TransactionID, TransactionDate, Amount, TransactionType, AccountID) 
VALUES
(1002, '2026-08-04', 20000, 'Deposit', 201),
(1003, '2026-08-05', 12000, 'Withdrawal', 202),
(1004, '2026-08-05', 16000, 'Deposit', 203),
(1005, '2026-08-06', 13000, 'Withdrawal', 204);

SELECT * FROM Transactions1;

UPDATE Accounts1
SET BranchID = '201'
WHERE AccountID = '101';

UPDATE Accounts1
SET BranchID = '202'
WHERE AccountID = '202';

UPDATE Accounts1
SET BranchID = '203'
WHERE AccountID = '203';

UPDATE Accounts1
SET BranchID = '202'
WHERE AccountID = '204';

UPDATE Accounts1
SET BranchID = '201'
WHERE AccountID = '205';

SELECT * FROM Accounts1;

UPDATE Accounts1
SET Balance = 80000
WHERE CustomerID = '101';

SELECT * FROM Customers1;

UPDATE accounts1
SET balance = balance + 2000
WHERE CustomerID = 101;

UPDATE Customers1
SET Email = 'rahulsharma@gmail.com',
	Phone = '7843017486'
WHERE CustomerID = '101';

SELECT customerID,firstName,Phone
FROM Customers1;

SELECT *
FROM Accounts1
WHERE AccountType != 'Savings';

SELECT * 
FROM accounts1
WHERE Balance <= 50000;

SELECT * FROM Accounts1
WHERE Balance > 50000 OR AccountType = 'Savings';

SELECT firstName,lastName,AccountCreationDate
FROM Customers1
WHERE AccountCreationDate > '2026-07-01';

-- Multiple customers data using phone numbers and in operator 
SELECT * FROM Customers1;
SELECT * FROM Accounts1;
SELECT * FROM Transactions1;
SELECT * FROM Loans1;
SELECT * FROM Branches1;

SELECT *
FROM Customers1
WHERE Phone IN ('8838938284','7929267534','7843017486');

-- IN ke alawa aur kis tarike se kar sakte hai 
SELECT *
FROM Customers1
WHERE Phone = '8838938284' OR Phone = '7929267534' OR Phone = '7843017486';

-- Between Operator : Print details of accounts in 20000 TO 50000.
SELECT * FROM Accounts1;
SELECT *
FROM Accounts1
WHERE Balance BETWEEN 20000 AND 50000;

-- Do the same above question using relational operators :
SELECT *
FROM Accounts1
WHERE Balance >= 20000 AND Balance <= 50000; 

-- LIKE OPERATOR used for pattern matching, % matches number of characters and even zero character
-- _ matches only one character

SELECT * FROM Customers1;

-- Q.1 Find the customers whose names starts with P.
SELECT FirstName
FROM Customers1
WHERE FirstName LIKE 'P%'; 

-- Q.2 Find the customers whose names starts with N.
SELECT FirstName
FROM Customers1
WHERE FirstName LIKE 'N%';

-- Find all the customers whose last name ends with a.
SELECT FirstName,LastName
FROM Customers1
WHERE LastName LIKE '%a';

-- Find the customers whose last name has exactly three characters : yeh question badhiya tha
SELECT FirstName,LastName
FROM Customers1
WHERE LastName LIKE '___';
 
-- Order By Clause :
-- sort the accounts according to customer balance :
SELECT AccountID,Balance 
FROM Accounts1
ORDER BY Balance DESC;

-- sort the branches table according to branchName.
SELECT *
FROM Branches1 
ORDER BY BranchName; 

-- Sort the accounts table according to customer balance from highest to lowest :
SELECT *
FROM Accounts1
ORDER BY Balance DESC;  

-- Sorting according to multiple columns :
-- Q.1 Sort the accounts table according to AccountType and Balance
SELECT AccountType,Balance
FROM Accounts1
ORDER BY AccountType,Balance DESC; 

-- LIMIT and OFFSET Pagination : Distinct 
-- Different types of Accounts :

SELECT DISTINCT AccountType
FROM Accounts1;

SELECT * 
FROM Transactions1;

SELECT DISTINCT TransactionType,AccountID
FROM Transactions1;

SELECT *
FROM transactions1
LIMIT 2;

-- Offset skip karta hai rows it always works with limit.
SELECT *
FROM Customers1
LIMIT 2 OFFSET 2;

-- Skip the first 2 customers from accounts when its in decreasing order.
SELECT * FROM Accounts1;

SELECT *
FROM Accounts1
ORDER BY Balance DESC;

SELECT CustomerID,Balance
FROM accounts1
ORDER BY Balance DESC
LIMIT 2 OFFSET 2; 

-- OR isi ko likhne ka ek aur tarika.

SELECT CustomerID,Balance
FROM Accounts1
ORDER BY Balance DESC
LIMIT 2,2; 

SELECT * FROM Customers1;

INSERT INTO Customers1
(CustomerID,FirstName,LastName,Email,Phone,AccountCreationDate,DateOfBirth)
VALUES
(106,'Priya','Patil','priya@gmail.com',NULL,'2026-08-01','2020-08-03'),
(107,'Amit','Verma','amit@gmail.com','7865433562','2026-08-03','2020-07-02'),
(108,'Sneha','Kulkarni','sneha@gmail.com',NULL,'2026-05-01','2020-10-03'),
(109,'Abhijeet','Sirsat','abhi@gmail.com',NULL,'2026-08-01','2020-08-03');

SELECT * 
FROM Customers1
WHERE Phone IS NULL;

SELECT *
FROM Customers1
WHERE Phone IS NOT NULL;

SELECT *
FROM Accounts1;

INSERT INTO Accounts1
(AccountID,AccountType,Balance,CustomerID,BranchID)
VALUES
(206,'Current',70000,106,201),
(207,'Savings',55000,107,203),
(208,'Current',25000,108,202),
(209,'Savings',40000,109,203);

SELECT * FROM Transactions1;
SELECT * FROM Loans1;

INSERT INTO Transactions1
(TransactionID,TransactionDate,Amount,TransactionType,AccountID)
VALUES
(1006,'2025-09-21',12000,'Deposit',206),
(1007,'2025-03-4',35000,'Withdrawal',207),
(1008,'2026-02-22',32000,'Deposit',208),
(1009,'2025-09-2',3000,'Withdrawal',209);

USE BankingDB1;

-- Case Statement :
SELECT CustomerID,Balance,
CASE 
	WHEN Balance >= 50000 THEN "High Value"
    ELSE "Low Value"
END AS Category 
FROM Accounts1;

-- Categorize the deposits in the transactions table as per conditions given :
-- if above 10000(included) High amount
-- if 5000(included) to 10000 Medium amount
-- if upto 500 Low Amount
-- For transaction type Withdrawal "Not Applicable"

SELECT * FROM Transactions1;

SELECT TransactionID,Amount,TransactionType,
CASE 
	WHEN Amount >= 15000 THEN "High Amount"
    WHEN Amount BETWEEN 10000 AND 15000 THEN "Medium Amount"
    WHEN Amount >= 5000 THEN "Low Amount"
    ELSE "Not Applicable"
END AS TransactionCategory
FROM Transactions1;

SELECT Amount
FROM Transactions1
WHERE Amount BETWEEN 16000 AND 20000;

-- Functions
-- Upper Function
SELECT UPPER(FirstName),UPPER(LastName)
FROM Customers1;

-- Lower Function
SELECT LOWER(FirstName),LOWER(LastName)
FROM Customers1;  

-- Length and char_length :
-- it counts the length of words because 1 character is equal to 1byte in english.

SELECT LastName,LENGTH(LastName)
FROM Customers1;  

-- ex:2
-- measures the string length in bytes, not the number of characters.
SELECT LENGTH("Nagpur") AS Characters;  -- gives output in number of bytes
SELECT LENGTH("नागपुर") AS Characters;  -- gives output in bytes
SELECT LENGTH("ナーグプル") AS Characters; -- gives output in bytes
 
SELECT CHAR_LENGTH("Nagpur") AS Characters; -- gives output in number of characters
SELECT CHAR_LENGTH("नागपुर") AS Characters; -- gives output in number of charcaters `
SELECT CHAR_LENGTH("ナーグプル") AS Characters;

-- concat function :
SELECT CustomerID,CONCAT(FirstName," ",LastName) AS FullName
FROM Customers1; 

-- substring :
SELECT SUBSTRING("Quadratically",5); 

SELECT SUBSTRING('Sakila',-3);

-- print from firstName first letter and fullstop and a surname :
SELECT CONCAT(SUBSTRING(FirstName,1,1),".",LastName) AS FullName
FROM Customers1; 

SELECT SUBSTRING("Sakila",-5,3);

-- Trim Function :  trailing means last space after the character
SELECT LENGTH("   Hello World   "); 
SELECT LENGTH(TRIM("   Hello World   "));

-- Replace Function :
SELECT replace("Mat mat","M","C");

-- Built in functions :
-- 1. Round
SELECT AccountType,ROUND(AVG(Balance),2)
FROM Accounts1  
-- WHERE AccountType = 'Savings'
GROUP BY AccountType
HAVING AccountType = 'Savings';

-- 2. Ceil or ceiling always gives output in higher side:
SELECT CEIL(ROUND(AVG(Balance),2))
FROM Accounts1
WHERE AccountType = 'Savings'; 

-- CEIL OR CEILING always gives output in higher side : Maximum integer value dega hamesha 
SELECT CEIL(6.76);
SELECT CEIL(6.34);
SELECT CEIL(-6.76);

-- Floor : Smallest value dega 
SELECT FLOOR(6.76); 
SELECT FLOOR(6.34);
SELECT FLOOR(-6.34);

SELECT FLOOR(AVG(Balance))
FROM Accounts1
WHERE AccountType = "Savings";

-- Withdrawal and AVG amount from transactions:
SELECT * FROM Transactions1;

SELECT AVG(Amount) 
FROM Transactions1
WHERE TransactionType = "Withdrawal";

-- Floor :
-- Use Floor upto 2 decimal places
SELECT FLOOR(AVG(Amount))
FROM Transactions1
WHERE TransactionType = "Withdrawal"; 

-- MOD values :
SELECT (7/3);
SELECT MOD(7,3);  

-- Power :
SELECT POWER(2,3);
SELECT POWER(1.5,3);

-- SQRT
SELECT sqrt(16);

-- Date and Time Functions :
SELECT NOW();
SELECT Current_date(); 
SELECT Current_time();

-- year,month,day :
SELECT CustomerID, YEAR(DATEOFBIRTH), MONTH(DATEOFBIRTH), DAY(DATEOFBIRTH)
FROM Customers1;

-- datediff to find the difference between 2 dates :
 
-- Display FullName and age in years from customers :
SELECT CONCAT(FirstName," ",LastName) AS FullName, FLOOR(DATEDIFF(current_date(),DATEOFBIRTH)/365) AS Age
FROM Customers1; 

-- date_add() -- expiry date findout krne ke liye karte hai
SELECT CONCAT(FirstName," ",LastName) AS FullName,
AccountCreationDate,
DATE_ADD(AccountCreationDate,INTERVAL 1 YEAR) AS KYCRenewal
FROM Customers1; 

-- Aggregate Functions :
-- 1. Count()
SELECT * FROM Customers1;

SELECT COUNT(Phone)
FROM Customers1;

SELECT COUNT(*)
FROM Customers1;

-- 2. Sum Function 
SELECT SUM(Balance) AS TotalBalance
FROM Accounts1; 

SELECT SUM(Balance) AS TotalSavBal
FROM Accounts1
WHERE AccountType = 'Savings';

-- MAX and MIN Functions :
SELECT MAX(Balance)
FROM Accounts1
WHERE AccountType = 'Current';

-- MIN Balance :
SELECT MIN(Balance)
FROM Accounts1
WHERE AccountType = 'Savings';

-- Group By Clause 
SELECT TransactionType,SUM(Amount)
FROM Transactions1
GROUP BY TransactionType;

-- Print the group according to AccountType on Sum of Balance and Average Balance and also specify
-- count on single group by condition :

SELECT AccountType,SUM(Balance) AS TotalBal,
AVG(Balance) AS AvgBal,
COUNT(*) AS NumOfAcc
FROM accounts1
GROUP BY AccountType;

-- Multiple GroupBy Conditions :
SELECT * FROM Accounts1;

-- Number of Accounts in Each Branch
SELECT BranchID,AccountType,COUNT(*) AS NumOfAcc
FROM Accounts1
GROUP BY BranchID,AccountType
ORDER BY BranchID;

-- Having Group by ke results ko filter kar raha hai 
 
 