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
