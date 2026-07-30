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

