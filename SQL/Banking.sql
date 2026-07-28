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


