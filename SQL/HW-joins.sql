USE BankingDB;

SELECT * FROM Customers; -- 113 tak hai
SELECT * FROM Branches;
SELECT * FROM Accounts;
SELECT * FROM Transactions;  -- 1020 tak hai
SELECT * FROM Employees;

-- Q.1 Display the CustomerID, FirstName, LastName, AccountType, and Balance of all customers who have an account.
SELECT a.CustomerID,c.FirstName,c.LastName,a.AccountID,a.Balance
FROM Accounts a 
LEFT JOIN Customers c 
ON 
a.CustomerID = c.CustomerID;

-- Q.2 Display the customer's full name along with their AccountID, AccountType, and Balance.Use CONCAT() to combine first name and last name.

 