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
SELECT BranchID,AccountType,COUNT(*) NumOfAcc
FROM Accounts1
GROUP BY BranchID,AccountType
HAVING NumOfAcc > 2 AND AccountType = "Savings";

-- Find the Number of AccountCreation in specific years.
SELECT (YEAR(AccountCreationDate)) AS Years,
COUNT(Year(AccountCreationDate)) AS NumOfAcc
FROM Customers1
GROUP BY Years;

-- Joins 
-- Find all the Customers having loans with their names.
SELECT * FROM Loans1;
SELECT * FROM Customers1;

SELECT c.CustomerID,CONCAT(c.FirstName," ",c.LastName) AS FullName,l.LoanAmount
FROM Customers1 c 
INNER JOIN Loans1 l
ON c.CustomerID = l.CustomerID;

-- Find BranchNames for all the Accountids savepoint
-- include accountid,accountype and branchname,branchaddress

SELECT * FROM Branches1;
SELECT * FROM Accounts1;

SELECT a.AccountID,a.AccountType,b.BranchName,b.BranchAddress
FROM Accounts1 a 
INNER JOIN Branches1 b 
ON a.branchID = b.branchID
WHERE AccountType = "Savings"
ORDER BY AccountID;

-- Find all the customers name,phone,accounttype,balance where account type is savings
SELECT * FROM Customers1;

SELECT CONCAT(c.FirstName," ",c.LastName) AS FullName,
c.Phone,a.AccountType,a.Balance
FROM Customers1 c 
INNER JOIN Accounts1 a 
ON c.CustomerID = a.CustomerID
WHERE a.AccountType = "Savings";

-- Left Join 
INSERT INTO Customers1(CustomerId,FirstName,LastName,Email,Phone,AccountCreationDate,DateOfBirth)
VALUES
	(110,'Vikram','Joshi','vikram@gmail.com',9765439765,'2026-05-12','2003-03-03'),
    (111,'Ronit','Parmar','ronit@gmail.com',NULL,'2026-04-10','2001-07-01'),
    (112,'Ayush','Bhel','ayush@gmail.com',8786757657,'2024-01-23','2002-08-29');
    
-- Find the all the customers name and its acountType and Balance : 
SELECT c.CustomerID,CONCAT(c.FirstName," ",c.LastName) AS FullName,
a.AccountType,a.Balance 
FROM Customers1 c
LEFT JOIN Accounts1 a 
ON c.CustomerID = a.CustomerID;

-- Yeh Sirf common wle dega 
SELECT c.CustomerID,CONCAT(c.FirstName," ",c.LastName) AS FullName,
a.AccountType,a.Balance
FROM Customers1 c 
JOIN Accounts1 a 
ON c.CustomerID = a.CustomerID;

-- Right Join Second table will be the preference :
INSERT INTO Branches1
VALUES
(204,'Nashik Branch','College Road,Nashik','464645');

SELECT * FROM Branches1;

SELECT * 
FROM Accounts1
ORDER BY AccountID;

INSERT INTO Accounts1(AccountID,AccountType,Balance,CustomerId,BranchId)
VALUES
(210,'Savings',56000,111,204),
(211,'Current',92000,112,202);

SELECT * FROM Transactions1;
INSERT INTO Transactions1(TransactionId,TransactionDate,Amount,TransactionType,AccountId)
VALUES
(1010,'2025-03-10',8000,'Deposit',206),
(1011,'2025-03-15',1500,'Withdrawal',207),
(1012,'2025-03-20',12000,'Deposit',208),
(1013,'2025-04-05',4000,'Withdrawal',209),
(1014,'2025-04-10',7000,'Deposit',201),
(1015,'2025-04-15',2500,'Withdrawal',202),
(1016,'2025-05-01',6000,'Deposit',203),
(1017,'2025-05-10',2000,'Deposit',204);

INSERT INTO Transactions1(TransactionId,TransactionDate,Amount,TransactionType,AccountId)
VALUES 
(1018,'2025-04-19',3000,'Withdrawal',205);

-- Right Join Ka koi aaisa example nhi diya hai sir ne --> itna usefull nhi hai
SELECT c.customerID,CONCAT(c.FirstName," ",c.LastName) AS FullName,
a.AccountID,a.AccountType,a.Balance 
FROM Customers1 c 
INNER JOIN Accounts1 a 
ON c.CustomerID = a.CustomerID
ORDER BY a.AccountID;

SELECT c.customerID,CONCAT(c.FirstName," ",c.LastName) AS FullName,
a.AccountID,a.AccountType,a.Balance 
FROM Customers1 c 
INNER JOIN Accounts1 a 
ON c.CustomerID = a.CustomerID
ORDER BY c.CustomerID;

-- Full Outer Join : one upon each other na dete huye ham ise side by side dere hai
USE BankingDB1;

SELECT *
FROM Customers1 c 
LEFT JOIN Accounts1 a
ON c.CustomerID = a.CustomerID
UNION
SELECT *
FROM Customers1 c 
RIGHT JOIN Accounts1 a
ON c.CustomerID = a.CustomerID;

-- Cross Join :
SELECT *
FROM Customers1 c 
CROSS JOIN Accounts1 a;

-- Self Join :
CREATE TABLE Employees1(
	  EmployeeID INT PRIMARY KEY,
      EmployeeName VARCHAR(50) NOT NULL,
      ManagerID INT,
      Department VARCHAR(50),
	  Salary DECIMAL(10,2),
      JoiningDate DATE,
      BranchID INT,
     
     FOREIGN KEY (ManagerID)
     REFERENCES Employees1(EmployeeID),
    
     FOREIGN KEY (BranchID)
     REFERENCES Branches1(BranchID)
 ); 
 
INSERT INTO Employees1
    (EmployeeID, EmployeeName, ManagerID, Department, Salary, JoiningDate, BranchID)
VALUES
    (1, 'Rajesh Sharma', NULL, 'Management', 120000.00, '2018-04-15', 201),
    (2, 'Priya Patel', 1, 'Human Resources', 75000.00, '2019-06-10', 202),
    (3, 'Amit Kumar', 1, 'Finance', 82000.00, '2020-01-20', 203),
    (4, 'Sneha Verma', 1, 'IT', 95000.00, '2019-09-05', 204),
    (5, 'Rahul Singh', 1, 'Sales', 78000.00, '2021-03-12', 205),
    (6, 'Neha Joshi', 2, 'Human Resources', 55000.00, '2021-07-19', 201),
    (7, 'Vikas Gupta', 2, 'Human Resources', 52000.00, '2022-02-14', 202),
    (8, 'Pooja Mehta', 3, 'Finance', 60000.00, '2021-11-08', 203),
    (9, 'Suresh Yadav', 3, 'Finance', 58000.00, '2022-05-16', 204),
    (10, 'Anjali Deshmukh', 4, 'IT', 72000.00, '2020-08-24', 205),
    (11, 'Rohan Kulkarni', 4, 'IT', 68000.00, '2021-10-11', 201),
    (12, 'Kavita Rao', 4, 'IT', 65000.00, '2022-01-17', 202),
    (13, 'Arjun Malhotra', 5, 'Sales', 57000.00, '2022-06-20', 203),
    (14, 'Meena Shah', 5, 'Sales', 59000.00, '2021-12-06', 204),
    (15, 'Deepak Thakur', 5, 'Sales', 54000.00, '2023-01-09', 205),
    (16, 'Nitin Pawar', 6, 'Human Resources', 42000.00, '2023-04-18', 201),
    (17, 'Swati Mishra', 7, 'Human Resources', 40000.00, '2023-07-03', 202),
    (18, 'Manish Jain', 8, 'Finance', 45000.00, '2023-02-27', 203),
    (19, 'Komal Sinha', 9, 'Finance', 43000.00, '2023-08-14', 204),
    (20, 'Akash Bansal', 10, 'IT', 50000.00, '2023-05-22', 205);
    
USE BankingDB1;
SELECT * FROM Branches1;
INSERT INTO Branches1 VALUES (
	205,'Amravati Branch','College Road',565457
);

SELECT *
FROM Employees1;

SELECT e.EmployeeID,e.EmployeeName AS Employee,
m.EmployeeName AS Manager
FROM Employees1 e 
LEFT JOIN Employees1 m
ON e.ManagerID = m.EmployeeID;

SELECT e.EmployeeID,e.EmployeeName AS Employee,
m.EmployeeName AS Manager,
b.BranchName 
FROM Employees1 e 
LEFT JOIN Employees1 m 
ON e.ManagerID = m.EmployeeID
INNER JOIN Branches1 b 
ON e.BranchID = b.BranchID;

SELECT e.EmployeeID,e.EmployeeName,m.EmployeeName
FROM Employees1 e
LEFT JOIN Employees1 m 
ON e.ManagerID = m.EmployeeID;
 
SELECT e.EmployeeID,e.EmployeeName,m.EmployeeName,b.BranchName
FROM Employees1 e 
LEFT JOIN Employees1 m 
ON e.ManagerID = m.EmployeeID
INNER JOIN Branches1 b 
ON e.branchID = b.branchID;

-- Find the Employee Names Whose Manager is Sneha Verma 
SELECT e.EmployeeID,e.EmployeeName,m.EmployeeName
FROM Employees1 e 
INNER JOIN Employees1 m 
ON e.ManagerID = m.EmployeeID
WHERE m.EmployeeName = 'Sneha Verma';

-- Find the Customer Names whose avg Balance is greater than 'savings' account :
SELECT AVG(Balance) FROM Accounts1;

-- single entry rehni chahiye isiliye group by krne pr bhi error nhi milla 
SELECT CONCAT(FirstName," ",LastName) AS FullName,a.AccountType,
AVG(Balance) AS AvgBal 
FROM Customers1 c 
LEFT JOIN Accounts1 a 
ON c.CustomerID = a.CustomerID
WHERE AccountType = 'Savings'
GROUP BY FullName
HAVING AvgBal > 55454.54;

-- Subquery 
-- 1.Scalar SubQuery :
--  find customer names whoes avg balance is greater than savings account using subquery

SELECT FirstName
FROM Customers1
WHERE CustomerID IN (
	SELECT CustomerID FROM Accounts1
    WHERE AccountType = 'Savings'
);

SELECT AVG(Balance) FROM Accounts1;

SELECT AccountID,AccountType,Balance
FROM Accounts1
WHERE AccountType = 'Savings' AND Balance > (
	SELECT AVG(Balance)
    FROM Accounts1
);

-- Accountids having avg balnace > savings account
SELECT AccountID,AccountType,Balance 
FROM Accounts1 
WHERE AccountType = 'Savings' AND Balance > (
	SELECT AVG(Balance)
    FROM Accounts1
);

-- Find Customers names whose avg balance is greater than savings account using subquery.
SELECT c.CustomerID,c.FirstName
FROM Customers1 c 
INNER JOIN Accounts1 a 
ON c.CustomerID = a.CustomerID
WHERE a.AccountType = 'Savings' AND a.Balance > (
	SELECT AVG(Balance)
    FROM Accounts1
);

-- Find the Accounts having highest balance :
SELECT MAX(Balance)
FROM Accounts1;

SELECT AccountID,CustomerID,Balance
FROM Accounts1 
WHERE Balance = (
	SELECT MAX(Balance)
	FROM Accounts1
);

-- Find customers whose year of birth is earlier than the average year of birth of all customers 
SELECT FLOOR(AVG(YEAR(DateOfBirth))) AS AvgYearBirth 
FROM customers1;

SELECT FirstName,YEAR(DateOfBirth) AS Years
FROM Customers1
WHERE YEAR(DateOfBirth) < (
	SELECT FLOOR(AVG(YEAR(DateOfBirth))) AS AvgYearBirth 
	FROM customers1
);

-- Multi Row SubQuery :
-- Find the Customers who have taken atleast one loan.
SELECT * FROM Loans1;  
SELECT * FROM Customers1;

SELECT CustomerID,FirstName
FROM customers1 
WHERE CustomerID IN (
	SELECT CustomerID FROM Loans1
);

-- joins use karke Loan nikalna :
SELECT l.customerID,CONCAT(c.FirstName," ",c.LastName) AS FullName,l.LoanAmount
FROM Customers1 c 
INNER JOIN Loans1 l 
ON c.CustomerID = l.CustomerID
ORDER BY l.CustomerID;

-- Find the customers who have not taken any loan.
SELECT CustomerID,FirstName
FROM Customers1 
WHERE CustomerID NOT IN (
	SELECT CustomerID FROM Loans1
    ORDER BY CustomerID
);

-- 3. Find the Customers who have atleast one savings account.
SELECT * FROM Customers1;
SELECT * FROM Accounts1;

SELECT CustomerID,FirstName
FROM Customers1 
WHERE CustomerID IN (
	SELECT CustomerID FROM Accounts1
    WHERE AccountType = 'Savings'
);

-- Find all Customers who have an account in BranchID = 201.
SELECT * FROM Accounts1;
SELECT * FROM Branches1;

SELECT CustomerID,AccountType
FROM Accounts1
WHERE BranchID IN (
	SELECT BranchID FROM Branches1
    WHERE BranchID = '201'
);

-- 5.Find all Accounts whose balance is greater than any Account in BranchID = 201.
SELECT * FROM Accounts1;
SELECT * FROM Branches1;

SELECT AccountID,Balance
FROM Accounts1
WHERE Balance > ALL (
	SELECT Balance
    FROM Accounts1 
    WHERE BranchID = '201'
);

-- Find the branch with highest account balance.
SELECT * FROM Accounts1;
SELECT * FROM Branches1; 

SELECT BranchID,BranchName,BranchAddress
FROM Branches1
WHERE BranchID IN (
	SELECT MAX(Balance)
    FROM Accounts1
);

SELECT BranchID,MAX(Balance)
FROM Accounts1
GROUP BY BranchID;

-- Correlated SubQuery :
-- Find Accounts whose Balance is greater than the Average Balance of their respective Branch.

SELECT * FROM Accounts1;
SELECT * FROM Branches1;  

SELECT BranchID,AVG(Balance)
FROM Accounts1
GROUP BY BranchID;

-- 1.1 Find accounts whose Balance is greater than the average Balance of their respective Branch. 
SELECT a1.AccountID,a1.Balance,a1.BranchID
FROM Accounts1 a1 
WHERE Balance > (
	SELECT AVG(a2.Balance)
    FROM Accounts1 a2
    WHERE a2.BranchID = a1.BranchID
);

-- 1.2 Find accounts whose Balance is greater than the average Balance of their respective Branch.
SELECT a1.AccountID,a1.Balance,a1.BranchID
FROM Accounts1 a1
WHERE Balance > (
	SELECT AVG(a2.Balance)
    FROM Accounts1 a2
    WHERE a2.BranchID = a1.BranchID
);

-- 1.3 Find Accounts whose Balance is greater than the average balance of their respective Branch.
SELECT a1.AccountID,a1.Balance,a1.BranchID
FROM Accounts1 a1 
WHERE a1.Balance > (
	SELECT AVG(a2.Balance)
    FROM Accounts1 a2
    WHERE a1.BranchID = a2.BranchID
);

-- 2.1 Find employees whose salary is greater then the average salary of their respective department.
-- subquery ke questions kuch usi way se solve hote hai koi aur tarika nhi hai 
SELECT * FROM Employees1; 

SELECT Department,AVG(Salary)
FROM Employees1 
GROUP BY Department;

SELECT EmployeeID,EmployeeName
FROM Employees1 
WHERE Salary > (
		SELECT Department,AVG(Salary)
		FROM Employees1 
		GROUP BY Department
);

SELECT e1.EmployeeID,e1.EmployeeName,e1.salary
FROM Employees1 e1 
WHERE e1.Salary > (
	SELECT AVG(Salary)
    FROM Employees1 e2
    WHERE e1.Department = e2.Department
);

-- 2.2 
SELECT e1.EmployeeID,e1.EmployeeName,e1.Salary
FROM Employees1 e1 
WHERE e1.Salary > (
	SELECT AVG(e2.Salary)
    FROM Employees1 e2
    WHERE e1.Department = e2.Department
); 

-- 2.3 Find Employees whose Salary is greater then avg salary of their respective department
SELECT e1.EmployeeID,e1.EmployeeName,e1.Salary
FROM Employees1 e1 
WHERE e1.Salary > (
	SELECT AVG(e2.Salary)
    FROM Employees1 e2 
    WHERE e1.Department = e2.Department
); 

-- Find the Customers who have more then one Account.
SELECT * FROM Accounts1
ORDER BY CustomerID; 

SELECT * FROM Accounts
ORDER BY CustomerID;

-- 3.1 Find the Customers who have more then one Account.
SELECT CustomerID,FirstName,LastName
FROM Customers c 
WHERE (
	SELECT COUNT(AccountID)
    FROM Accounts a 
    WHERE c.CustomerID = a.CustomerID
) > 1;

-- 3.2 Find the Customers who have more then one Account.
SELECT CustomerID,FirstName,LastName
FROM Customers c 
WHERE (
	SELECT COUNT(*)
    FROM Accounts a 
    WHERE c.CustomerID = a.CustomerID
) > 1; 

-- 3.3 Find the Customers who have more then one Account.
SELECT CustomerID,FirstName,LastName
FROM Customers c 
WHERE (
	SELECT COUNT(*)
    FROM Accounts a
    WHERE c.CustomerID = a.CustomerID
)> 1; 

-- Table SubQuery :
-- It returns multiple rows and columns functioning as temporary table

-- 1.Find the avg account balance for each account type using derived table.
SELECT Accounts_Data.AccountType,Accounts_Data.AvgBal
FROM (
	SELECT AccountType,AVG(Balance) AS AvgBal
    FROM Accounts
    GROUP BY AccountType
) AS Accounts_Data;

SELECT AccountType,AVG(Balance) AS AvgBal
    FROM Accounts
    GROUP BY AccountType;

-- 1.2    
SELECT Accounts_Data.AccountType,Accounts_Data.AvgBal
FROM (
	SELECT AccountType,AVG(Balance) AS AvgBal
    FROM Accounts1
    GROUP BY AccountType
) AS Accounts_Data;
 
-- 1.3 
SELECT Accounts_Data.AccountType,Accounts_Data.AvgBal
FROM (
	SELECT AccountType,AVG(Balance) AS AvgBal
    FROM Accounts1
	GROUP BY AccountType
) AS Accounts_Data; 

-- 2.1 Display only those account types whose average balance is greater than 50000.
SELECT * FROM Accounts1;
SELECT AccountType,AVG(Balance) AS AvgBal
FROM Accounts1
GROUP BY AccountType
HAVING AvgBal > 55000;

-- Hame Tarike pata hone chahiye
SELECT Accounts_Data.AccountType,Accounts_Data.AvgBal
FROM (
		SELECT AccountType,AVG(Balance) AS AvgBal
		FROM Accounts1
		GROUP BY AccountType
) AS Accounts_Data
WHERE Accounts_Data.AvgBal > 55000; 

-- 2.2 Display only those account types whose average balance is greater then 55000.
SELECT AccountType,AVG(Balance) AS AvgBal
FROM Accounts1
GROUP BY AccountType;

SELECT AccountBalance.AccountType,AccountBalance.AvgBal
FROM (
	SELECT AccountType,AVG(Balance) AS AvgBal
	FROM Accounts1
	GROUP BY AccountType
) AccountBalance
WHERE AvgBal > 55000;

-- 2.3 Display ony those account types whose average balance is greater then 50000.
SELECT AccountType,AVG(Balance) AS AvgBal
FROM Accounts1
GROUP BY AccountType;

SELECT AccountBalance.AccountType,AccountBalance.AvgBal
FROM (
	SELECT AccountType,AVG(Balance) AS AvgBal
	FROM Accounts1
	GROUP BY AccountType
) AccountBalance
WHERE AvgBal > 55000;

-- 3.1 Find Top3 Customers Based on total Account Balance.
SELECT CustomerID,SUM(Balance) AS TotalBal
FROM Accounts1
GROUP BY CustomerID
ORDER BY TotalBal DESC
LIMIT 3;

SELECT * FROM Accounts1;

SELECT AccountsData.CustomerID,AccountsData.TotalBal
FROM (
	SELECT CustomerID,SUM(Balance) AS TotalBal
	FROM Accounts1
	GROUP BY CustomerID
	ORDER BY TotalBal DESC
	LIMIT 3
) AS AccountsData;

-- SubQueries inside update clause :
-- 1.1Increase the balance of accounts belonging to customers who have taken a loan by 5%.

SELECT * FROM Loans1;
SELECT * FROM Accounts1;

UPDATE Accounts1 
SET Balance = Balance + Balance*0.05
WHERE CustomerID IN (
	SELECT CustomerID FROM Loans1
);

-- 1.2 Increase the Balance of accounts belonging to customers who have taken loan by 5%.
UPDATE Accounts1
SET Balance = Balance + Balance*0.05
WHERE CustomerID IN (
	SELECT CustomerID 
    FROM Loans1
);

-- 1.3 Increase the Balance of accounts belonging to customers who have taken loan by 5%.
UPDATE Accounts1
SET Balance = Balance + Balance*0.05
WHERE CustomerID IN (
	SELECT CustomerID
    FROM Loans1
); 

-- SubQueries inside delete clause.
-- 1.1Delete all the transactions below 2000 where transactionType is withdrawal.
SELECT * FROM Transactions1
ORDER BY Amount;

DELETE FROM Transactions1
WHERE AccountID IN (
	SELECT AccountID
    FROM (
		SELECT Amount
        FROM transactions1
        WHERE Amount < 2000 AND TransactionType = 'Withdrawal'
    ) AS Temporary
) AND TransactionType = 'Withdrawal';

-- SubQueries using delete : nhi ayege aaise question
-- 1.2 Delete all the transactions below 2000 Where transactiontype is withdrawal :

-- SubQueries using insert :
-- 1. Create a HighValueAccounts table and insert all accounts whose balance is greater than the average account Balance.
SELECT * FROM Accounts1;

SELECT AVG(Balance)
FROM Accounts1;

CREATE TABLE HighValueAccounts1 (
	AccountID INT,
    CustomerID INT,
    BranchID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2),
    FOREIGN KEY (CustomerID)
    REFERENCES Customers1(CustomerID),
    FOREIGN KEY (BranchID)
    REFERENCES Branches1(BranchID)
);

SELECT * FROM HighValueAccounts1;

INSERT INTO HighValueAccounts1(AccountID,CustomerID,BranchID,AccountType,Balance)
SELECT AccountID,CustomerID,BranchID,AccountType,Balance
FROM Accounts1 
WHERE Balance > (
	SELECT AVG(Balance)
	FROM Accounts1
);

DROP Table HighValueAccounts;

-- Q.2 Create HighBalanceCustomers table and insert customers whose total account balance is greater then 50000.

SELECT * FROM Accounts1;

SELECT AccountID,SUM(Balance) AS TotalBal
FROM Accounts1
GROUP BY AccountID
HAVING TotalBal > 50000;

CREATE TABLE HighBalanceAccounts (
	CustomerID INT,
    TotalBalance DECIMAL(10,2)
);


INSERT INTO HighBalanceAccounts (CustomerID,TotalBalance)
	SELECT CustomerID,SUM(Balance) AS TotalBal
	FROM Accounts1
	GROUP BY CustomerID
	HAVING TotalBal > 50000;

SELECT * FROM HighBalanceAccounts;

-- isse karne ka hi ek aur tarika upper me 

-- SQL Views :
-- 1.1 Create view for premiumAcounts whose balance is greater then 50000.
-- unnecessary joins use kia hai 
CREATE VIEW PremiumAccounts AS 
SELECT a.AccountID,t.transactionID,a.AccountType,a.Balance,a.CustomerID
FROM Accounts1 a 
INNER JOIN Transactions1 t 
ON a.AccountID = t.AccountID
WHERE a.Balance > 50000;

SELECT * FROM PremiumAccounts;

-- 1.2
CREATE OR REPLACE VIEW PremiumAccounts AS 
SELECT a.AccountID,t.transactionID,a.AccountType,a.Balance,a.CustomerID
FROM Accounts1 a 
INNER JOIN Transactions1 t 
ON a.AccountID = t.AccountID
WHERE a.Balance > 50000;

-- 1.3
CREATE VIEW PremiumAccounts AS 
SELECT a.AccountID,t.transactionID,a.AccountType,a.balance,a.CustomerID
FROM Accounts1 a 
INNER JOIN Transactions t 
ON a.AccountID = t.AccountID
WHERE a.Balance > 50000;

-- Display Top2 Customers having highest balance .
CREATE OR REPLACE VIEW PremiumAccounts AS
SELECT CustomerID,SUM(Balance) AS TotalBal
FROM Accounts1 
GROUP BY CustomerID
ORDER BY TotalBal DESC
LIMIT 2;

SELECT * FROM PremiumAccounts;

-- DQL : Windows Functions 

