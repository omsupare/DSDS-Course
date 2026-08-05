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






