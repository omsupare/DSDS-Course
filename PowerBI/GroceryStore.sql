CREATE DATABASE Grocerystore;

USE GroceryStore;

CREATE TABLE Customers
(ID INT PRIMARY KEY AUTO_INCREMENT,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Email VARCHAR(50));

DESC Customers;

CREATE TABLE Orders(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Orderdate Date,
    Amount DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(ID)
);

DROP TABLE Orders;

DESC Orders;

INSERT INTO Customers(First_Name,Last_Name,Email) VALUES
("Nikhil","M","nikhil@gmail.com",2),
("Chetan","K","chetan@gmail.com",4),
("Pooja","H","pooja@gmail.com",1),
("Gita","D","gita@gmail.com",3);

SELECT * FROM Customers;

INSERT INTO Orders (orderDate,Amount,CustomerID)
VALUES 
("2026-09-11",200,2),
("2026-08-21",400,3),
("2026-10-03",800,4);

SELECT * FROM Orders;

-- Find the customers who placed orders

SELECT * FROM Customers;
SELECT * FROM Orders; 

SELECT c.First_Name,o.Amount
FROM Customers c 
INNER JOIN Orders o 
ON 
c.ID = o.CustomerID;

INSERT INTO Orders(OrderDate,Amount,CustomerID) VALUES
("2026-10-24",100,2);

INSERT INTO Orders(OrderDate,Amount,CustomerID) VALUES
("2026-10-20",100,3);

SELECT * FROM Orders;
SELECT * FROM Customers;

INSERT INTO Orders(OrderDate,Amount,CustomerID) VALUES
('2026-10-28',400,2);

SELECT * FROM Customers;
SELECT * FROM Orders;

INSERT INTO Orders(OrderDate,Amount,CustomerID) VALUES
('2026-10-30',200,4);

INSERT INTO Customers(First_Name,Last_Name,Email) VALUES
("Om","Supare","om@gmail.com"),
("Abhi","Sirsat","abhi@gmail.com"),
("Ayush","Berkhede","ayush@gmail.com");

SELECT * FROM Orders;
SELECT * FROM Customers;

INSERT INTO Orders(Orderdate,Amount,CustomerID)
VALUES
("2026-10-30",2000,5),
("2026-10-31",1000,6),
("2026-10-30",50000,7);

UPDATE Orders
SET Amount = 1100
WHERE ID = 7;
