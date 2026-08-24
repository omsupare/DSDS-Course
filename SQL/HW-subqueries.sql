-- A. Scalar / Single-Row Subqueries

-- 1.	Find all accounts whose balance is greater than the average balance of all accounts.  
USE BankingDB;

SELECT AVG(Balance) FROM Accounts;
SELECT AccountID,Balance
FROM Accounts
WHERE Balance > (
	SELECT AVG(Balance) FROM Accounts
);

-- Q.2 Find the account(s) having the highest balance.
SELECT MAX(Balance) FROM Accounts;

SELECT *
FROM Accounts
WHERE Balance = (
	SELECT MAX(Balance) FROM Accounts
); 

-- Q.3 Find customers whose year of birth is earlier than the average year of birth of all customers.   
SELECT FirstName,LastName,DateOfBirth
FROM Customers
WHERE YEAR(DateOfBirth) < (
	SELECT FLOOR(AVG(YEAR(DateOfBirth))) AS YearOfBirth FROM Customers
);

SELECT FLOOR(AVG(YEAR(DateOfBirth))) AS YearOfBirth FROM Customers;

-- Q.4 Find accounts whose balance is equal to the average balance of all accounts. 
SELECT * FROM Accounts;
SELECT *
FROM Accounts
WHERE Balance = (
	SELECT AVG(Balance) FROM Accounts
);   -- aisa koi bhi account exist hi nhii krta
SELECT AVG(Balance) AS AverageBal FROM Accounts;

-- Q.5 Find the customer who owns the account with the highest balance.  
SELECT c.FirstName,c.LastName,a.Balance
FROM Customers c 
INNER JOIN Accounts a 
ON 
c.CustomerID = a.CustomerID
WHERE a.Balance = (
	SELECT AVG(Balance) FROM Accounts
);

SELECT AVG(Balance) FROM Accounts;

-- Multiple Row Sub-Queries :
 