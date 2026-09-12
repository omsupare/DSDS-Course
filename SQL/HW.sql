-- Practice Questions :

SELECT * FROM customers;

-- Q.1 AccountCraetionDate after 2025-01-01
SELECT CustomerID,FirstName,Email
FROM customers
WHERE AccountCreationDate > '2025-01-01';

-- Q.2 Balance > 20,000
SELECT AccountID, AccountType
FROM Accounts
WHERE AccountType = 'Savings' AND Balance > 20000;

-- Q.3 Phone Numbers Null
SELECT * FROM Customers;

SELECT CustomerID, FirstName, LastName, Phone
FROM Customers
WHERE Phone = NULL;

-- Q.4 Distinct AccountType in Accounts Table :
SELECT DISTINCT AccountType
FROM Accounts;

-- Q.5 Customers FirstName Starts with R
SELECT FirstName
FROM Customers
WHERE FirstName = 'R';

-- Q.6 Accounts --> Balance between 20000 AND 60000

SELECT AccountID,Balance
FROM Accounts
WHERE Balance BETWEEN 20000 AND 60000;

-- Q.7 Deposit Transactions greater than 3000.
SELECT * FROM Transactions;

SELECT TransactionID,Amount
FROM Transactions
WHERE Amount >= 3000;

-- Q.8 CustomerID IN
SELECT CustomerID, FirstName, LastName
FROM Customers 
WHERE CustomerID IN (101,103,106,109);

-- Q.9 Display first 5 customers ordered by CustomerID.
SELECT FirstName, LastName, CustomerID
FROM Customers
LIMIT 5;

-- Q.10 Display customers after skipping first 3 records.
SELECT * FROM Customers;
SELECT FirstName, LastName
FROM Customers
LIMIT 6 OFFSET 3;

-- Level 2 Medium 
-- Q.11 Display Savings accounts having balance between ₹20,000 and ₹80,000.
SELECT * FROM Accounts;

SELECT AccountID, AccountType,Balance
FROM Accounts
WHERE AccountType = 'Savings' AND Balance BETWEEN '20000' AND '80000';

-- Q.12 Display customer names whose phone number is NULL and account was created after 2025-01-01.
SELECT * FROM Customers;

SELECT FirstName,LastName
FROM Customers
WHERE Phone = 'NULL' AND AccountCreationDate > 2025-01-01;

-- Q.13 Display all customers whose FirstName starts with 'A' OR LastName starts with 'S'.
SELECT FirstName,LastName
FROM Customers
WHERE FirstName LIKE 'A%' OR LastName LIKE '%s';

-- Q.14 Display all accounts whose AccountType is Savings or Salary and balance is greater than ₹10,000.
SELECT *
FROM Accounts
WHERE AccountType = 'Savings';

-- Q.15 Display customers whose CustomerID is IN (101,102,105,109) and phone number is not NULL.
SELECT *
FROM Customers;

SELECT CustomerID,Phone
FROM customers
WHERE CustomerID IN (101,102,105,109) AND Phone != '';

-- Q.16 Display transactions whose Amount is between ₹2,000 and ₹8,000 and TransactionType is Deposit.  changes according to data 'UPI' and amount between '100' to '200'
SELECT * 
FROM Transactions;

SELECT TransactionType,Amount
FROM Transactions
WHERE TransactionType = 'UPI' AND Amount BETWEEN 100 AND 200;

-- Q.17 Display distinct BranchIDs from Accounts where balance is greater than ₹30,000.
SELECT *
FROM Accounts;

SELECT DISTINCT BranchID
FROM Accounts
WHERE Balance > 30000;

-- Q.18 Display customers whose email contains gmail and first name ends with a.
SELECT *
FROM Customers;

SELECT Email,FirstName
FROM Customers
WHERE Email LIKE '%gmail%' AND FirstName LIKE '%a';

-- Q.19 Display customers whose DateOfBirth is between 1995 and 2000.
SELECT *
FROM Customers;

SELECT FirstName,LastName
FROM Customers
WHERE DATEOFBIRTH BETWEEN 1995 AND 2000; 

-- Q.20 Display first 3 Savings accounts having balance greater than ₹25,000.
 SELECT AccountID,AccountType,Balance
 FROM Accounts
 WHERE AccountType = 'Savings' AND Balance >= 25000
 LIMIT 3;
 
 -- Intermediate level 
 -- Q.21  Display customers whose FirstName starts with 'P' and Phone IS NULL.
 SELECT * FROM Customers;
 SELECT FirstName,Phone
 FROM Customers
 WHERE FirstName LIKE "P%" AND Phone IS NULL;
 
 -- Q.22 Display accounts whose balance is NOT BETWEEN ₹20,000 and ₹50,000.
 SELECT AccountId,Balance
 FROM Accounts
 WHERE Balance BETWEEN 20000 AND 50000;
 
 -- Q.23 Display customers whose CustomerID is NOT IN (101,102,103).
 SELECT CustomerID,FirstName,LastName
 FROM Customers
 WHERE CustomerId NOT IN (101,102,103);
 
 -- Q.24 Display transactions that are Withdrawal and amount is less than ₹5000.
 -- Modification
 -- Display transactions that are UPI and amount is less than ₹5000.
 SELECT * FROM Transactions;
 
 SELECT TransactionId,TransactionType,Amount
 FROM Transactions
 WHERE TransactionType = 'UPI' AND Amount < 5000;
 
 -- Q.25 Display customers whose email ends with gmail.com and phone number is available.
 SELECT FirstName,LastName,Email,Phone
 FROM Customers
 WHERE Email LIKE "%@gmail.com" AND Phone IS NOT NULL;
 
 -- Q.26  Display distinct transaction types whose amount is greater than ₹5000.
 -- Modification
 -- Q.26  Display distinct transaction types whose amount is greater than ₹500.
 SELECT *
 FROM Transactions;
 
SELECT DISTINCT TransactionType,Amount
FROM Transactions
WHERE Amount > 500;

-- Q.27 Display all Savings accounts belonging to Branch 1 or Branch 3.
SELECT *
FROM Accounts;

SELECT AccountType,BranchID
FROM Accounts
WHERE AccountType = 'Savings' AND (BranchID = 201 OR BranchID = 203);

-- Q.28 Display customers whose first name contains 'ha' and DateOfBirth is after 1997.
-- Modification
-- Q.28 Display customers whose first name contains 'Pr' and DateOfBirth is after 2025.
SELECT *
FROM Customers;  

SELECT FirstName,DateOfBirth
FROM Customers
WHERE FirstName LIKE 'Pr%' AND DateOfBirth > 2025;

-- Q.29 Display accounts whose balance is greater than ₹30,000 but less than ₹80,000.
SELECT AccountID,Balance
FROM Accounts
WHERE Balance >= 30000 AND Balance <= 80000; 

-- Q.30 Display first 4 Deposit transactions after skipping first 2 deposits.
-- Data is not like this 

-- Q.31 Display customer names whose phone number is NULL OR email starts with s.
SELECT * 
FROM Customers;

SELECT FirstName,LastName,Email,Phone
FROM Customers
WHERE Phone IS NULL OR Email LIKE "s%";

-- Q.32 Display Savings accounts having balance greater than ₹10,000 AND belonging to Branch 1.

SELECT *
FROM Accounts;

SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE AccountType = 'Savings' AND Balance > 10000 AND BranchID = 201;  

-- Q.33 Display Current accounts having balance between ₹40,000 and ₹1,00,000.
SELECT *
FROM Accounts;

SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE AccountType = 'Current' AND BALANCE BETWEEN 40000 AND 100000; 

-- Q.34 Display customers whose last name starts with S and were created after 2024.
SELECT  FirstName,LastName,AccountCreationDate
FROM Customers
WHERE LastName LIKE "s%" AND YEAR(AccountCreationDate) > 2024;

-- Q.35 Display transactions whose amount is IN (2000,3000,5000,7000).
SELECT *
FROM Transactions;

SELECT TransactionID,Amount
FROM Transactions
WHERE Amount IN (2000,3000,5000,7000);  

-- Q.36 Display customers whose first name starts with R or P, phone number is available and CustomerID is greater than 103.

SELECT * FROM Customers;

SELECT FirstName,Phone,CustomerID
FROM Customers
WHERE (FirstName LIKE 'R%' OR FirstName LIKE 'P%') AND (Phone IS NOT NULL) AND (CustomerID > 103); 
 
-- Q.37 Display distinct balances greater than ₹15,000.

SELECT *
FROM Accounts;

SELECT DISTINCT AccountID,Balance
FROM Accounts
WHERE Balance > 15000; 

-- Q.38 Display all accounts except Savings accounts having balance above ₹25,000.
SELECT *
FROM Accounts;

SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE AccountType != 'Savings' AND
Balance > 25000;

-- Q.39 Display customers whose email contains gmail but phone number is missing.
SELECT *
FROM Customers;

SELECT FirstName,LastName,Email,Phone
FROM Customers
WHERE Email LIKE "%gmail.com" AND Phone IS NULL; 

-- Q.40 Display accounts whose balance is between ₹15,000 and ₹90,000 and AccountType is not Salary
SELECT *
FROM Accounts;

SELECT AccountID,AccuntType,Balance
FROM Accounts
WHERE AccountType != 'Salary' AND Balance BETWEEN 15000 AND 90000;

-- Level 5 (Challenge Questions)
-- Q.41 Display first 5 customers whose FirstName starts with A or R, ordered by CustomerID.

SELECT *
FROM Customers;

SELECT CustomerId,FirstName,LastName
FROM Customers
WHERE FirstName LIKE 'A%' OR FirstName LIKE 'R%'
LIMIT 5;

-- Q. 42 Display Savings and Salary accounts whose balance is greater than ₹15,000 and less than ₹60,000.
SELECT * 
FROM Accounts;

SELECT AccountId,AccountType,Balance
FROM Accounts
WHERE (AccountType = 'Savings' OR  AccountType = 'Salary') AND 
(Balance BETWEEN 15000 AND 60000);
 
-- Q.43 Display customers whose CustomerID is IN (101,103,105,107,109) and DateOfBirth is between 1994 and 2000.
SELECT * 
FROM Customers;

SELECT CustomerId,FirstName,LastName,YEAR(DateOfBirth)
FROM Customers
WHERE CustomerId IN (101,103,105,107,109)
AND YEAR(DateOfBirth) BETWEEN  1994 AND 2000;

-- Q.44 Display transactions whose amount is greater than ₹2000 but less than ₹8000 and TransactionType is not Withdrawal.
-- NOT IN MY DATASET

-- Q.45 Display customers whose phone number is NULL or FirstName contains 'an'.
SELECT *
FROM Customers;

SELECT CustomerId,FirstName,LastName,Phone
FROM Customers
WHERE FirstName LIKE 'an%' AND PHONE IS NULL;   

-- Q.46 Display distinct AccountTypes where balance is greater than ₹20,000.
SELECT *
FROM Accounts;

SELECT AccountId,AccountType,Balance
FROM Accounts
WHERE Balance > 20000;

-- Q.47 Display customers after skipping first 2 records and display only the next 4 records.
SELECT *
FROM Customers;

SELECT *
FROM Customers
LIMIT 7 OFFSET 2;

-- Q.48 Display customers whose last name ends with 'kar' and email contains gmail.
SELECT *
FROM Customers;

SELECT *
FROM Customers
WHERE LastName LIKE '%kar' AND Email LIKE '%gmail.com';

-- Q.49 Display accounts whose BranchID is IN (201,202) and balance is between ₹20,000 and ₹70,000.  -- JOINS
SELECT *
FROM Branches;

SELECT *
FROM Accounts;

SELECT b.branchId,a.AccountId,a.Balance
FROM Branches b
INNER JOIN Accounts a
ON
b.branchId = a.branchId;

-- Q.50 Display all customers whose first name starts with S, phone number is not NULL, and account was created between 1-Jan-2025 and 31-Dec-2025.
SELECT *
FROM Customers;

SELECT FirstName,LastName,Phone,AccountCreationDate
FROM Customers
WHERE FirstName LIKE 'S%' AND 
Phone IS NOT NULL AND 
AccountCreationDate BETWEEN 2025-01-01 AND 2025-12-31; 

-- Trichy Questions 
-- Q.1 Display all customers whose first name starts with 'R' or 'S' but whose phone number is NULL.
SELECT * FROM Customers;  
SELECT FirstName,Phone
FROM Customers 
WHERE (FirstName LIKE "R%" OR FirstName LIKE "S%") AND Phone IS NULL;

-- Q.2 Display all accounts that are not Savings accounts and have a balance greater than ₹30,000.
SELECT AccountId,AccountType,Balance 
FROM Accounts 
WHERE AccountType != 'Savings' AND Balance > 30000;

-- Q.3 Display customers whose CustomerID is not 101, 102, or 103.
SELECT *
FROM Customers 
WHERE CustomerId NOT IN (101,102,103); 

-- Q.4 Display customers whose email does not end with "gmail.com".
SELECT CustomerId,CONCAT(FirstName," ",LastName) AS FullName,Email
FROM Customers
WHERE Email NOT LIKE  "%gmail.com";

-- Q.5 Display accounts whose balance is not between ₹20,000 and ₹50,000.
SELECT AccountId,Balance
FROM Accounts 
WHERE Balance BETWEEN 20000 AND 50000;

-- Q.6 Display all transactions except Deposit transactions.
SELECT * FROM Transactions;

SELECT *
FROM Transactions 
WHERE TransactionType != 'Deposit';

-- Q.7 Display customers whose first name contains the letter 'a' but does not start with 'A'.

-- Q.8 Display distinct account types except Current.
SELECT DISTINCT AccountType
FROM Accounts
WHERE AccountType != 'Current';

-- Q.9 Display customers who have phone numbers available but were created before 2025.
SELECT * FROM Customers;

SELECT * 
FROM Customers 
WHERE Phone IS NOT NULL AND YEAR(AccountCreationDate) > '2025';

-- Q.10 Display first 3 Savings accounts after skipping the first 2 Savings accounts.
SELECT * FROM Accounts;
SELECT *
FROM Accounts 
WHERE AccountType = 'Savings'
LIMIT 3 OFFSET 2;

-- Tricky level2 
-- Q.11 Display customers whose CustomerID is between 101 and 110 but not equal to 105 or 108.
SELECT * FROM Customers;
SELECT *
FROM Customers 
WHERE (CustomerId BETWEEN 101 AND 110) AND (CustomerId NOT IN (105,108));

-- Q.12 Display transactions whose amount is greater than ₹2000 but not equal to ₹5000.
SELECT * FROM Transactions;

SELECT *
FROM Transactions 
WHERE Amount > 2000 AND Amount NOT IN (5000);

-- Q.13 Display customers whose last name starts with 'S' and email contains gmail but phone number is NULL.
SELECT * FROM Customers;

SELECT *
FROM Customers
WHERE LastName LIKE 'S%' AND Email LIKE '%gmail.com' AND Phone IS NULL;

-- Q.14 Display accounts having balance between ₹15,000 and ₹60,000 but not belonging to Branch 2.
SELECT * FROM Accounts;
SELECT *
FROM Accounts 
WHERE (Balance BETWEEN 15000 AND 60000) AND (BranchId NOT IN (202));

-- Q.15 Display customers whose FirstName starts with 'P' or ends with 't'.
SELECT * FROM Customers; 

SELECT *
FROM Customers 
WHERE FirstName LIKE 'P%' AND FirstName LIKE '%t';

-- Q.16 Display accounts whose AccountType is Savings or Salary but balance is not between ₹10,000 and ₹40,000.
SELECT *
FROM Accounts;

SELECT *
FROM Accounts 
WHERE (AccountType = 'Savings' OR AccountType = 'Salary')
AND 
!(Balance BETWEEN 10000 AND 40000);

-- Q.17 Display customers whose DateOfBirth is after 1995 but before 2000.
SELECT *
FROM Customers
WHERE (YEAR(DateOfBirth) > 1995) AND (YEAR(DateOfBirth) < 2000);

-- Q.18 Display customers whose email contains gmail but FirstName does not contain 'a'
SELECT *
FROM Customers;

SELECT *
FROM Customers
WHERE Email LIKE '%gmail.com' AND FirstName NOT LIKE 'A%';

-- Q.19 Display transactions whose amount is between ₹2000 and ₹8000 but TransactionType is not Withdrawal.
SELECT *
FROM Transactions 
WHERE (Amount BETWEEN 2000 AND 8000) AND TransactionType != 'Withdrawal';

-- Q.20 Display only the next 5 customers after skipping the first 4 customers.
SELECT *
FROM Customers
LIMIT 4,5;

-- Tricky Questions Level 3 
-- Q.21 Display all Savings accounts having balance greater than ₹20,000 OR belonging to Branch 1.
SELECT AccountId,AccountType,Balance,BranchId
FROM Accounts
WHERE (AccountType = 'Savings') AND (BALANCE >= 20000) OR (BranchId = 201);

-- Q.22 Display all customers whose phone is NULL OR email contains gmail.
SELECT *
FROM Customers
WHERE Phone IS NULL OR Email LIKE '%gmail.com';

-- Q.23 Display customers whose FirstName starts with 'A' or 'R' and whose CustomerID is greater than 105.
SELECT CustomerId,FirstName
FROM Customers
WHERE FirstName LIKE 'A%' OR FirstName LIKE 'R%'
AND CustomerId > 105;

-- Q.24 Display customers whose CustomerID is NOT IN (101,103,105) and phone number is NOT NULL.
SELECT *
FROM Customers
WHERE CustomerId NOT IN (101,103,105) AND Phone IS NOT NULL;

-- Q.25 Display accounts whose balance is less than ₹10,000 OR greater than ₹80,000.
SELECT *
FROM Accounts
WHERE Balance < 10000 OR Balance > 80000; 

-- Q.26 Display transactions whose amount is NOT BETWEEN ₹3000 and ₹7000.
SELECT *
FROM Transactions 
WHERE Amount NOT BETWEEN 3000 AND 7000;

-- Q.27 Display customers whose last name ends with 'kar' OR starts with 'D'.
SELECT * FROM Customers;
SELECT LastName
FROM Customers 
WHERE LastName LIKE '%kar' OR '%d';

-- Q.28 Display customers whose email starts with 'a' OR phone number is NULL, but whose CustomerID is greater than 105.
SELECT CustomerId,FirstName,LastName,Email,Phone
FROM Customers
WHERE (Email LIKE 'a%' OR Phone IS NULL) AND (CustomerId > 105); 

-- Q.29 Display all accounts except Savings having balance between ₹25,000 and ₹60,000.
SELECT *
FROM Accounts
WHERE (AccountType != 'Savings') AND (Balance BETWEEN 25000 AND 60000);

-- Q.30 Display customers whose FirstName starts with 'R', Phone IS NOT NULL, CustomerID is between 101 and 110, and AccountCreationDate is after 2024-12-31.
SELECT *
FROM Customers 
WHERE (FirstName LIKE 'R%') AND (Phone IS NOT NULL)  
AND (CustomerId BETWEEN 101 AND 110) 
AND (AccountCreationDate > '2024-12-31');

-- Bonus Questions (Designed to Catch Common Mistakes)
-- Q.31 Display customers whose FirstName starts with 'A' or 'S' and Phone IS NOT NULL.
SELECT *
FROM Customers
WHERE (FirstName LIKE 'A%' OR FirstName LIKE 'S%')
AND (Phone IS NOT NULL);

-- Q.32 Display customers whose Phone IS NULL and CustomerID is not in (101,102).
SELECT *
FROM Customers
WHERE (Phone IS NULL) AND (CustomerId NOT IN (101,102));

-- Q.33 Display accounts whose Balance > 30000 and AccountType is Savings or Salary.
SELECT *
FROM Accounts
WHERE (Balance > 30000) AND (AccountType = 'Savings'OR AccountType = 'Salary');

-- Q.34 Display customers whose FirstName contains 'a' but LastName does not contain 'a'.
SELECT FirstName,LastName
FROM Customers
WHERE (FirstName LIKE 'a%') AND (LastName NOT LIKE '%a');

-- Q.35 Display only 4 customers after skipping the first 3 customers, ordered by FirstName.
SELECT FirstName
FROM Customers
ORDER BY FirstName
LIMIT 3,4; 

-- Level 1 (Easy Combination)
-- 1.Display the CustomerID, FirstName and Email of customers whose AccountCreationDate is after 1-Jan-2025.
SELECT CustomerID,FirstName,Email,AccountCreationDate
FROM Customers 
WHERE AccountCreationDate > '2025-01-01';

-- 2.Display all Savings accounts having balance greater than ₹20,000.
SELECT AccountId,AccountType,Balance
FROM Accounts 
WHERE AccountType = 'Savings' AND Balance > 20000;

-- 3.Display customers whose Phone number is NOT NULL.  
SELECT *
FROM Customers 
WHERE Phone IS NOT NULL;

-- 4.Display distinct Account Types available in the Accounts table.
SELECT DISTINCT AccountType
FROM Accounts;  

-- 5.Display customers whose FirstName starts with 'R'.
SELECT CustomerId,FirstName
FROM Customers 
WHERE FirstName LIKE 'R%';

-- 6.Display accounts having Balance between ₹20,000 and ₹60,000.
SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE Balance BETWEEN 20000 AND 60000; 

-- 7.Display all Deposit transactions whose amount is greater than ₹3000.
SELECT *
FROM Transactions; 

SELECT TransactionID,TransactionType,Amount
FROM Transactions
WHERE TransactionType = 'Deposit' AND Amount > 3000;

-- 8.Display customers whose CustomerID is IN (101,103,106,109).
SELECT *
FROM Customers 
WHERE CustomerID IN (101,103,106,109); 

-- 9.Display first 5 customers ordered by CustomerID.
SELECT CustomerID,CONCAT(FirstName," ",LastName) AS FullName 
FROM Customers 
LIMIT 5;

-- 10.Display customers after skipping first 3 records.
SELECT * FROM Customers;
SELECT *
FROM Customers
LIMIT 3,9;

-- Level 2 (Medium)
-- 11.Display Savings accounts having balance between ₹20,000 and ₹80,000. 
SELECT * FROM Accounts;
SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE Balance BETWEEN 20000 AND 80000;

-- 12.Display customer names whose phone number is NULL and account was created after 2025-01-01.
SELECT FirstName,LastName,Phone
FROM Customers
WHERE Phone IS NULL AND AccountCreationDate > '2025-01-01'; 

-- 13.Display all customers whose FirstName starts with 'A' OR LastName starts with 'S'.
SELECT *
FROM Customers
WHERE FirstName LIKE 'A%' OR LastName LIKE 'S%';

-- 14.Display all accounts whose AccountType is Savings or Salary and balance is greater than ₹10,000. 
SELECT *
FROM Accounts
WHERE AccountType = 'Savings' OR Balance > 10000;

-- 15.Display customers whose CustomerID is IN (101,102,105,109) and phone number is not NULL.
SELECT *
FROM Customers
WHERE CustomerID IN (101,102,105,109) AND Phone IS NOT NULL;  

-- 16.Display transactions whose Amount is between ₹2,000 and ₹8,000 and TransactionType is Deposit.
SELECT *
FROM Transactions 
WHERE Amount BETWEEN 2000 AND 8000
AND TransactionType = 'Deposit';

-- 17.Display distinct BranchIDs from Accounts where balance is greater than ₹30,000.
SELECT DISTINCT BranchID,AccountID,Balance
FROM Accounts
WHERE Balance > 30000;
 
-- 18.Display customers whose email contains gmail and first name ends with a. 
SELECT *
FROM Customers
WHERE Email LIKE '%gmail.com' AND FirstName LIKE '%a';

-- 19.Display customers whose DateOfBirth is between 1995 and 2000.
SELECT CONCAT(FirstName," ",LastName) AS FullName,YEAR(DateOfBirth) AS Year
FROM Customers
WHERE YEAR(DateOfBirth) BETWEEN '1995' AND '2000'; 

-- 20.Display first 3 Savings accounts having balance greater than ₹25,000.
SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE Balance > 25000
LIMIT 3;

-- Level 3 (Intermediate)
-- 21. Display customers whose FirstName starts with 'P' and Phone IS NULL.
SELECT *
FROM Customers
WHERE FirstName LIKE 'P%' AND Phone IS NULL;

-- 22.Display accounts whose balance is NOT BETWEEN ₹20,000 and ₹50,000.
SELECT *
FROM Accounts
WHERE Balance > 20000 AND Balance < 50000; 

-- 23.Display customers whose CustomerID is NOT IN (101,102,103).
SELECT *
FROM Customers
WHERE CustomerID NOT IN (101,102,103);

-- 24.Display transactions that are Withdrawal and amount is less than ₹5000.
SELECT *
FROM Transactions
WHERE TransactionType = 'WithDrawal' AND Amount <= 5000;

-- 25.Display customers whose email ends with gmail.com and phone number is available. 
SELECT *
FROM Customers
WHERE Email LIKE '%gmail.com' AND Phone IS NOT NULL;

-- 26.Display distinct transaction types whose amount is greater than ₹5000. 
SELECT DISTINCT TransactionType,TransactionID
FROM Transactions
WHERE Amount > 5000;

-- 27.Display all Savings accounts belonging to Branch 201 or Branch 203. 
SELECT AccountID,AccountType,Balance,BranchID
FROM Accounts 
WHERE AccountType = 'Savings' AND (BranchID = 201 OR BranchID = 203);

-- 29. Display accounts whose balance is greater than ₹30,000 but less than ₹80,000.
SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE Balance > 30000 AND Balance < 80000; 

-- 28.Display customers whose first name contains 'ha' and DateOfBirth is after 1997.
SELECT FirstName,YEAR(DateOfBirth)
FROM Customers
WHERE FirstName LIKE 'Ha%' AND YEAR(DateOfBirth) > 1997;

-- 30.Display first 4 Deposit transactions after skipping first 2 deposits.
SELECT *
FROM Transactions
WHERE TransactionType = 'Deposit'
LIMIT 2,4;

-- Level 4 Advanced Filtering :
-- Q.31 Display customer names whose phone number is NULL OR email starts with s.
SELECT *
FROM Customers
WHERE Phone IS NULL OR Email LIKE 'S%';  

-- Q.32 Display Savings accounts having balance greater than ₹10,000 AND belonging to Branch 201.
SELECT *
FROM Accounts
WHERE Balance > 10000 AND BranchID = 201;

-- Q.33 Display Current accounts having balance between ₹40,000 and ₹1,00,000.
SELECT *
FROM Accounts
WHERE AccountType = 'Current' AND (Balance BETWEEN 40000 AND 100000); 

-- Q.34 Display customers whose last name starts with S and were created after 2024.
SELECT *
FROM Customers
WHERE LastName LIKE 'S%' AND YEAR(AccountCreationDate) > 2024;

-- Q.35 Display transactions whose amount is IN (2000,3000,5000,7000).
SELECT *
FROM Transactions
WHERE Amount IN (2000,3000,5000,7000);

-- Q.36 Display customers whose first name starts with R or P, phone number is available and CustomerID is greater than 103.
SELECT CustomerID,FirstName,Phone
FROM Customers
WHERE (FirstName LIKE 'R%' OR FirstName LIKE 'P%') AND ((Phone IS NOT NULL) AND (CustomerID > 103));

-- Q.37 Display distinct balances greater than ₹15,000.
SELECT DISTINCT Balance
FROM Accounts 
WHERE Balance > 15000;

-- Q.38 Display all accounts except Savings accounts having balance above ₹25,000.
SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE AccountType = 'Savings' AND Balance > 25000;

-- Q.39 Display customers whose email contains gmail but phone number is missing.
SELECT *
FROM Customers
WHERE Email LIKE '%gmail%' AND Phone IS NOT NULL;

-- Q.40 Display accounts whose balance is between ₹15,000 and ₹90,000 and AccountType is not Salary.
SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE (Balance BETWEEN 15000 AND 90000) AND AccountType != 'Salary';

-- Level 5 (Challenge Questions)
-- Q.41 Display first 5 customers whose FirstName starts with A or R, ordered by CustomerID.
SELECT CustomerID,FirstName,LastName
FROM Customers
WHERE FirstName LIKE 'A%' OR FirstName LIKE 'R%'
LIMIT 5;

-- Q.42 Display Savings and Salary accounts whose balance is greater than ₹15,000 and less than ₹60,000.
SELECT AccountID,AccountType,Balance
FROM Accounts
WHERE AccountType = 'Savings' AND (Balance > 15000 AND Balance < 60000);

-- Q.43 Display customers whose CustomerID is IN (101,103,105,107,109) and DateOfBirth is between 1994 and 2000.
SELECT * FROM Customers;
SELECT *
FROM Customers 
WHERE CustomerID IN (101,103,105,107,109) AND (YEAR(DateOfBirth) BETWEEN 1994 AND 2000);

-- Q.44 Display transactions whose amount is greater than ₹2000 but less than ₹8000 and TransactionType is not Withdrawal.
SELECT *
FROM Transactions;
SELECT * 
FROM Transactions 
WHERE (Amount > 2000 AND Amount < 8000) AND TransactionType != 'Withdrawal';

-- Q.45 Display customers whose phone number is NULL or FirstName contains 'an'.
SELECT *
FROM Customers
WHERE Phone IS NULL OR FirstName LIKE 'an%' ;

-- Q.46 Display distinct AccountTypes where balance is greater than ₹20,000.
SELECT DISTINCT AccountType,Balance
FROM Accounts
WHERE Balance > 20000;

-- Q.47 Display customers after skipping first 2 records and display only the next 4 records.
SELECT *
FROM Customers
LIMIT 2,4;

-- Q.48 Display customers whose last name ends with 'kar' and email contains gmail.
SELECT * FROM Customers;
SELECT LastName,Email
FROM Customers
WHERE LastName LIKE '%kar' AND Email LIKE '%gmail%';

-- Q.49 Display accounts whose BranchID is IN (201,202) and balance is between ₹20,000 and ₹70,000.
SELECT AccountID,BranchID,Balance
FROM Accounts
WHERE BranchID IN (201,202) AND Balance BETWEEN 20000 AND 70000;

-- Q.50 Display all customers whose first name starts with S, phone number is not NULL, and account was created between 1-Jan-2025 and 31-Dec-2025.
SELECT *
FROM Customers;

SELECT *
FROM Customers
WHERE FirstName LIKE 'S%' AND Phone IS NOT NULL AND (AccountCreationDate BETWEEN '2025-01-01' AND '2025-12-31');

-- Joins Practice 
SELECT * FROM Accounts;
SELECT * FROM transactions;
INSERT INTO Transactions (TransactionID,TransactionDate,Amount,TransactionType,AccountID)
VALUES (1001,'2025-06-23',60000,'Savings',107),
	   (1003,'2026-05-10',20000,'Savings',109),
       (1005,'2026-08-12',15000,'Savings',201),
       (1007,'2025-03-05',70000,'Savings',106);
       
-- Part 1 — INNER JOIN: Basic
-- Level 1 — Simple INNER JOIN

-- Q1. Display the CustomerID, FirstName, LastName, AccountType, and Balance of all customers who have an account.
SELECT c.CustomerID,c.FirstName,c.LastName,a.AccountType,a.Balance
FROM Customers c
INNER JOIN Accounts a
ON
c.CustomerID = a.CustomerID;

-- Q2. Display the customer's full name along with their AccountID, AccountType, and Balance.
-- Use CONCAT() to combine first name and last name.
SELECT CONCAT(c.FirstName," ",c.LastName) AS FullName, a.AccountID,a.AccountType,a.Balance
FROM Customers c 
INNER JOIN Accounts a 
ON 
c.CustomerID = a.CustomerID;

-- Q3. Display all customers who have a Savings account.
-- Output:
-- Customer Name, AccountID, Balance
SELECT CONCAT(c.FirstName," ",c.LastName) AS FullName,a.AccountID,a.Balance
FROM Customers c 
INNER JOIN Accounts a 
ON
c.CustomerID = a.CustomerID;

-- Q4. Display customers whose account balance is greater than 30000.
-- Output:
-- Customer Name, AccountType, Balance
SELECT c.FirstName,a.Balance
FROM Customers c 
INNER JOIN Accounts a 
ON
c.CustomerID = a.CustomerID
WHERE a.Balance > 30000;

-- Q5. Display customers having either a Savings or Current account.
-- Use IN.
SELECT c.FirstName,a.AccountType
FROM Customers c 
INNER JOIN Accounts a 
ON 
c.CustomerID = a.CustomerID
WHERE a.AccountType IN ('Savings','Current');

-- Q6. Display customers whose account type is not Savings.
-- Use NOT IN.
SELECT c.FirstName,a.AccountType
FROM Customers c 
INNER JOIN Accounts a 
ON 
c.CustomerID = a.CustomerID
WHERE AccountType NOT IN ('Savings');

-- Part 2 — INNER JOIN + WHERE Operators
-- Q7. BETWEEN
-- Display customers whose account balance is between 20,000 and 50,000.
-- Output:
-- Customer Name, AccountType, Balance

SELECT c.FirstName,a.AccountType,a.Balance
FROM Customers c 
INNER JOIN Accounts a 
ON
c.customerID = a.customerID
WHERE a.Balance BETWEEN 20000 AND 50000;

-- Q8. LIKE
-- Display customers whose first name starts with 'S'.
-- Output:
-- Customer Name, AccountType, Balance

SELECT c.firstName,a.AccountType,a.balance
FROM Customers c 
INNER JOIN Accounts a 
ON
c.CustomerID = a.CustomerID
WHERE a.AccountType LIKE 's%';

-- Q9. LIKE + CONCAT
-- Display the full name and account details of customers whose last name ends with 'a'.

SELECT CONCAT(c.firstName," ",c.lastName) AS fullName,a.AccountID,a.AccountType,a.balance
FROM Customers c
INNER JOIN Accounts a 
ON
c.CustomerID = a.CustomerID
WHERE c.lastName LIKE '%a';

-- Q10. Multiple WHERE conditions
-- Display customers who:
-- •	have a Savings account 
-- •	AND balance is greater than 20,000 

SELECT CONCAT(c.firstName," ",c.lastName) AS fullName,a.AccountType,a.balance
FROM Customers c 
INNER JOIN Accounts a
ON
c.CustomerID = a.CustomerID
WHERE (a.AccountType = 'Savings') AND (a.Balance > 20000);

-- Q11. OR condition
-- Display customers who:
-- •	have a Savings account 
-- •	OR have a balance greater than 70,000 

SELECT c.firstName,a.AccountType,a.balance
FROM Customers c 
INNER JOIN Accounts a 
ON
c.CustomerID = a.CustomerID
WHERE (a.AccountType = 'Savings') OR (a.balance > 70000);

-- Q12. NOT
-- Display customers who do not have a Current account.

SELECT c.firstName,a.AccountType
FROM Customers c
INNER JOIN Accounts a 
ON
c.customerID = a.customerID
WHERE a.accountType NOT IN ('Current');

-- Part 3 — INNER JOIN + String Functions
-- Q13.
-- Display:
-- •	Customer ID 
-- •	Full name in uppercase 
-- •	Account type 
-- •	Balance 
-- Use:
-- UPPER()
-- CONCAT()

SELECT UPPER(CONCAT(c.firstName," ",c.lastName)) AS FullName,UPPER(a.AccountType) AS AccountType,a.balance
FROM Customers c 
INNER JOIN Accounts a
ON
c.customerID = a.customerID;

-- Q14.
-- Display the customer's name in the following format:
-- R.Sharma
-- K.Tiwari
-- N.Singh
-- Use SUBSTRING() and CONCAT().

SELECT CONCAT(substring(firstName,1,1),".",lastName) FullName
FROM Customers;
 
-- Q15.
-- Display customers whose first name contains the letter 'a'.
-- Use LIKE.

SELECT *
FROM Customers
WHERE firstName LIKE 'A%';

-- Q16.
-- Display:
-- •	Customer ID 
-- •	Full name 
-- •	Number of characters in the customer's first name 
-- •	Account balance 
-- Use CHAR_LENGTH().
 
 SELECT c.CustomerID,CONCAT(c.firstName," ",c.lastName) AS FullName,CHAR_LENGTH(c.firstName) AS NumOfChars,
a.balance
FROM Customers c 
INNER JOIN Accounts a 
ON
c.customerID = a.customerID;

-- Q17.
-- Display customers whose first name has exactly 5 characters.
-- Use:
-- CHAR_LENGTH()

SELECT firstName
FROM Customers
WHERE CHAR_LENGTH(firstName) > 5;

-- Part 4 — INNER JOIN + Date Functions
-- Now combine Customers and Accounts.

-- Q18.
-- Display:
-- •	Customer name 
-- •	Account creation date 
-- •	Account type 
-- •	Balance 
-- for customers whose account was created in 2025.
-- Use:
-- YEAR()


SELECT CONCAT(c.firstName," ",c.lastName) AS CustomerName,
c.AccountCreationDate,a.AccountType,a.balance
FROM Customers c 
INNER JOIN Accounts a 
ON
c.customerID = a.customerID
WHERE YEAR(AccountCreationDate) IN ('2025');

-- Q19.
-- Display customers whose account was created after 1 January 2025.
SELECT firstName,AccountCreationDate
FROM Customers
WHERE AccountCreationDate > '2025-01-01';

-- Q20.
-- Display customers whose account was created between:
-- 2025-01-01
-- and
-- 2025-12-31
-- Use BETWEEN.
SELECT FirstName,AccountCreationDate
FROM Customers
WHERE AccountCreationDate BETWEEN '2025-01-01' AND '2025-12-31';

-- Q21.
-- Display:
-- •	Customer name 
-- •	Account creation date 
-- •	Account type 
-- and calculate the number of days since account creation.
-- Use:
-- DATEDIFF()
SELECT c.firstName,c.AccountCreationDate,a.AccountType,DATEDIFF(Current_date,c.AccountCreationDate) AS NumOfDays
FROM Customers c 
INNER JOIN Accounts a 
ON
c.customerID = a.customerID;

-- Q22.
-- Display:
-- •	Customer name 
-- •	Date of birth 
-- •	Age 
-- along with their account information.
-- Use:
-- DATEDIFF()
-- and calculate approximate age in years.
SELECT firstName,DateOfBirth,FLOOR(DATEDIFF(Current_Date(),DateOfBirth)/365) AS AGE
FROM Customers;

SELECT YEAR(CURRENT_DATE);
SELECT YEAR(DateOfBirth)
FROM Customers;

-- Part 5 — INNER JOIN + Aggregate Functions

-- Q23.
-- Find the total balance held by all customers.
-- Output:
-- Total Balance
-- Use:
-- SUM()

SELECT c.CustomerID,SUM(a.balance) AS TotalBalance
FROM Customers c 
INNER JOIN Accounts a 
ON
c.customerID = a.customerID
GROUP BY c.customerID
ORDER BY c.customerID;

-- Q24.Find the average account balance of customers.
SELECT customerID,ROUND(AVG(Balance),2) AS AvgBal
FROM Accounts
GROUP BY customerID;

-- Q25.Find the maximum account balance among customers.
SELECT CustomerID,Balance
FROM Accounts
ORDER BY Balance DESC
LIMIT 1;

SELECT MAX(Balance)
FROM Accounts;

-- Q26.Find the minimum account balance among customers.
SELECT CustomerID,MIN(balance) AS MinBal
FROM Accounts
GROUP BY CustomerID
ORDER BY MinBal
LIMIT 1;

-- Q27.
-- Find the number of customers who have accounts.
-- Use:
-- COUNT()

SELECT CustomerId,COUNT(CustomerID) AS NumOfAcc
FROM Accounts 
GROUP BY CustomerID;

-- Q28.Find the total balance of Savings account holders.
SELECT AccountType,SUM(balance) AS TotalBalance
FROM Accounts
WHERE AccountType = 'Savings'
GROUP BY AccountType;

-- Q29.Find the average balance of Current account holders.
SELECT AccountType,AVG(balance) AS AvgBal
FROM Accounts 
WHERE AccountType = 'Current'
GROUP BY AccountType;

-- Part 6 — INNER JOIN + GROUP BY
-- Q30.
-- Find the number of accounts held by each customer.
-- Output:
-- Customer Name	Number of Accounts

SELECT c.firstName,COUNT(a.AccountID) AS NumOfAcc
FROM Customers c 
INNER JOIN Accounts a
ON
c.customerID = a.customerID
GROUP BY c.firstName;

-- Q31.
-- Find the total balance held by each customer.
-- Output:
-- Customer Name
-- Total Balance

SELECT customerID,SUM(Balance) AS TotalBal
FROM Accounts
GROUP BY CustomerID;

-- Q32.Find the average account balance for each customer.
SELECT customerId,AVG(Balance) AS AvgBal
FROM Accounts
GROUP BY CustomerID;

-- Q33.
-- Find the number of customers for each account type.
-- Output:
-- AccountType
-- NumberOfCustomers

SELECT AccountType,COUNT(CustomerID) AS NumOfCust
FROM Accounts
GROUP BY AccountType;

-- Q34.Find the total balance for each account type.
SELECT AccountType,SUM(balance) AS TotalBal
FROM Accounts
GROUP BY AccountType;

-- Q35.Find the average balance for each account type.
SELECT AccountType,AVG(balance) AS AvgBal
FROM Accounts
GROUP BY AccountType;

-- Q36.Find the highest balance held by each account type.
-- Output:
-- AccountType
-- HighestBalance

SELECT AccountType,MAX(balance) AS HighestBalance
FROM Accounts
GROUP BY AccountType;
SELECT * FROM Accounts;

-- Q37.
-- Find the number of customers for each branch.
-- You will need:
-- Customers
--    ↓
-- Accounts
--    ↓
-- Branches
SELECT * FROM Branches;
SELECT b.BranchID,COUNT(a.customerID) AS NumOFCust
FROM Customers c 
INNER JOIN Accounts a 
ON
c.customerId = a.customerID
INNER JOIN Branches b 
ON
a.branchID = b.branchID
GROUP BY b.branchID;

-- Part 7 — INNER JOIN + GROUP BY + HAVING
-- Q38.
-- Find customers whose total account balance is greater than ₹40,000.
-- You need:
-- JOIN
-- GROUP BY
-- SUM()
-- HAVING
SELECT * FROM Accounts;
SELECT c.customerID,SUM(a.balance) AS Total_Bal
FROM Customers c 
INNER JOIN Accounts a 
ON
c.customerID = a.customerID
GROUP BY c.customerID
ORDER BY c.customerID;

-- Q39.Find account types having an average balance greater than ₹30,000.
SELECT * FROM Accounts;
SELECT AccountType,AVG(Balance) AS Avg_Bal
FROM Accounts
GROUP BY AccountType
HAVING Avg_Bal > 30000;

-- Q40.Find branches having more than 2 accounts.
SELECT * 
FROM Branches;

SELECT b.BranchName,COUNT(a.BranchID) AS NumOfAcc
FROM Branches b 
INNER JOIN Accounts a 
ON
b.branchID = a.branchID
GROUP BY b.BranchName;

-- Q41.Find branches whose total account balance is greater than ₹50,000.
SELECT b.BranchName,SUM(a.balance) AS Total_Bal
FROM Branches b 
INNER JOIN Accounts a 
ON 
b.branchID = a.branchID
GROUP BY b.BranchName
HAVING Total_Bal > 50000;

-- Q42.Find account types having at least 3 accounts.   -- asise questions aa skte tumne where kyu nhi use kia having ki jagah
SELECT AccountType,COUNT(AccountID) AS NumOfAcc
FROM Accounts
GROUP BY AccountType
HAVING NumOfAcc > 3;

-- Q43.Find customers who have more than one account.
-- This is particularly useful for understanding why HAVING is different from WHERE.

SELECT c.firstName,COUNT(a.accountID) AS NumOfAcc
FROM Customers c 
INNER JOIN Accounts a 
ON
c.customerID = a.customerID
GROUP BY c.firstName
HAVING NumOfAcc > 1;

-- Part 8 — INNER JOIN: Customers + Accounts + Branches
-- Now move to 3-table JOINs.
-- Q44.
-- Display:
-- •	Customer name 
-- •	Account ID 
-- •	Account type 
-- •	Balance 
-- •	Branch name 

SELECT c.firstName,a.accountID,a.accountType,a.balance,b.branchName
FROM Customers c 
INNER JOIN Accounts a 
ON
c.customerId = a.customerID
INNER JOIN Branches b 
ON
b.branchID = a.branchID;

-- Q45.Display all Savings account customers along with their branch name.
SELECT c.firstName,a.AccountType,b.branchName
FROM Accounts a 
INNER JOIN Branches b 
ON
b.branchID = a.branchID
INNER JOIN Customers c
ON 
c.customerID = a.customerID; 

-- Q46.Display customers belonging to the Sitabuldi Branch.Use: WHERE
SELECT c.firstName,b.branchAddress
FROM Customers c 
INNER JOIN Accounts a 
ON
c.customerID = a.customerID
INNER JOIN Branches b 
ON
b.branchID = a.branchID
WHERE b.branchAddress = 'Sitabuldi';

-- Q47.
-- Display customers belonging to either:
-- •	Sitabuldi Branch 
-- •	Dharampeth Branch 
-- Use IN.   -- isme bhi sir savings aur current ko separate krne bol skte hai
SELECT * FROM Branches;
SELECT * FROM Customers;
SELECT * FROM Accounts;

SELECT c.firstName,b.branchAddress
FROM Customers c 
INNER JOIN Accounts a 
ON 
c.customerID = a.customerID
INNER JOIN Branches b 
ON
b.branchID = a.branchID
WHERE BranchAddress IN ('Dharampeth','Sitabuldi');
 
-- Q48.Display customers who do not belong to the Sitabuldi Branch.
-- Use NOT IN.
SELECT * FROM Customers;
SELECT * FROM Accounts;

SELECT c.firstName,b.branchAddress 
FROM Customers c 
INNER JOIN Accounts a 
ON 
c.customerID = a.customerID
INNER JOIN Branches b 
ON 
b.branchID = a.branchID
WHERE b.branchAddress NOT IN ('Sitabuldi');

-- Q49.Display customers whose branch name starts with 'P'.
-- Use LIKE.
SELECT * FROM Branches;

SELECT c.firstName,b.branchName
FROM Customers c 
INNER JOIN Accounts a 
ON 
c.customerID = a.customerID
INNER JOIN Branches b 
ON
b.branchID = a.branchID
WHERE b.BranchName LIKE 'P%';

-- Q50.
-- Display:
-- Customer Name
-- Branch Name
-- Account Type
-- Balance
-- for accounts having balance between 20,000 and 60,000.

SELECT c.firstName,b.branchName,a.accountType,a.balance
FROM Customers c 
INNER JOIN Accounts a 
ON 
c.customerID = a.customerID
INNER JOIN Branches b 
ON 
b.branchID = a.branchID
WHERE a.Balance BETWEEN 20000 AND 60000;

-- Part 9 — INNER JOIN: Customers + Accounts + Transactions
-- Relationship:
-- Customers
--     |
--  Accounts
--     |
-- Transactions

SELECT * FROM Transactions;

-- Q51.
-- Display:
-- •	Customer name 
-- •	Account ID 
-- •	Transaction ID 
-- •	Transaction date 
-- •	Transaction type 
-- •	Amount

SELECT c.firstName,a.accountID,t.transactionID,t.transactionDate,t.transactionType,t.amount
FROM Customers c 
INNER JOIN Accounts a 
ON
c.customerID = a.customerID
INNER JOIN Transactions t 
ON 
a.accountID = t.accountID;

-- Q52.Display all Deposit transactions along with the customer's name.
SELECT * FROM Customers;
SELECT c.firstName,t.transactionType
FROM customers c 
INNER JOIN Accounts a 
ON 
a.customerID = c.customerID
INNER JOIN transactions t 
ON 
a.accountID = t.accountID
WHERE t.TransactionType = 'Deposit';
 
-- Q53.Display all Withdrawal transactions greater than 2,000 along with the customer name.
SELECT * FROM Transactions;

SELECT c.firstName,t.TransactionType,t.amount 
FROM Customers c 
INNER JOIN Accounts a 
ON
a.customerID = c.customerID
INNER JOIN Transactions t 
ON 
a.accountID = t.accountID
WHERE t.amount > 2000 AND t.TransactionType = 'Withdrawal';

-- Q54.
-- Display transactions between:
-- 2025-01-01
-- and
-- 2025-02-28
-- along with customer name.

SELECT * FROM Transactions;

SELECT c.firstName,t.transactionDate
FROM Customers c 
INNER JOIN Accounts a 
ON 
c.customerID = a.customerID
INNER JOIN Transactions t 
ON 
a.accountID = t.accountID
WHERE t.transactionDate BETWEEN '2025-01-01' AND '2025-02-28';

-- Q55.Display transactions where the amount is between 2,000 and 10,000. 
SELECT * FROM Transactions;
SELECT *
FROM transactions 
WHERE Amount BETWEEN 2000 AND 10000;

-- Q56.Display transactions performed by customers whose first name starts with 'P'.
SELECT c.firstName,t.amount
FROM Customers c 
INNER JOIN Accounts a 
ON 
c.customerID = a.customerID 
INNER JOIN Transactions t 
ON 
a.accountID = t.accountID
WHERE c.firstName LIKE 'P%';

-- Part 10 — INNER JOIN + Transactions + GROUP BY
-- This is a very good level for students.
-- Q57.
-- Find the total transaction amount for each customer.
-- Output:
-- Customer Name
-- Total Transaction Amount

SELECT c.customerID,SUM(t.amount) AS TotalTransactionAmount
FROM Customers c 
INNER JOIN Accounts a 
ON 
c.customerID = a.customerID
INNER JOIN Transactions t 
ON 
a.accountID = t.accountID
GROUP BY c.customerID
ORDER BY c.customerID;

-- Q58.Find the average transaction amount for each customer.
SELECT c.customerID,AVG(t.amount) AS AvgAmount
FROM customers c 
INNER JOIN Accounts a 
ON 
c.customerID = a.customerID
INNER JOIN Transactions t 
ON 
a.accountID = t.accountID
GROUP BY c.customerID;

-- Q59.Find the number of transactions performed by each customer.
SELECT c.customerID,COUNT(t.transactionID) AS NumOfTransactions
FROM Customers c 
INNER JOIN Accounts a 
ON 
c.customerID = a.customerID
INNER JOIN Transactions t 
ON 
a.accountID = t.accountID
GROUP BY c.customerID;

-- Q60.Find the total Deposit amount for each customer.
SELECT * FROM Transactions;
SELECT c.customerID,SUM(t.amount) AS TotalDepositAmount
FROM Customers c 
INNER JOIN Accounts a 
ON 
c.customerID = a.customerID
INNER JOIN Transactions t 
ON 
a.accountID = t.accountID
WHERE t.transactionType = 'Deposit'
GROUP BY c.customerID;

-- Q61.Find the total Withdrawal amount for each customer.

SELECT c.customerID,SUM(t.amount) AS TotalWithdrawalAmount
FROM customers c 
INNER JOIN Accounts a 
ON 
c.customerID = a.customerID
INNER JOIN Transactions t 
ON 
a.accountID = t.accountID
WHERE t.transactionType = 'Withdrawal'
GROUP BY c.customerID;

-- Q62.
-- Find the total Deposit and Withdrawal amount for each customer.
-- Output:
-- Customer Name
-- Transaction Type
-- Total Amount
SELECT c.firstName,t.transactionType,SUM(t.amount) AS TotalAmount 
FROM customers c 
INNER JOIN Accounts a 
ON
c.customerID = a.customerID
INNER JOIN Transactions t 
ON 
a.accountID = t.accountID
WHERE (t.transactionType = 'Deposit') OR (t.transactionType = 'Withdrawal')
GROUP BY c.firstName,t.transactionType;

CREATE TABLE Hello (
	RollNo INT
);

SELECT COUNT(*)
FROM Hello;

SELECT COUNT(DISTINCT RollNo)
FROM Hello;

SELECT SYSDATE();
SELECT current_time();
SELECT NOW();

SELECT ROUND(678.90,-1);


 
 

 


 
 
  

 


 
 








 
  

 


 


 
 

 
  
