-- Car Rental Service: 

CREATE DATABASE CarRentalService;
USE CarRentalService;

CREATE TABLE Vehicle_Types (
	TypeID INT PRIMARY KEY,
    Type_Name VARCHAR(50),
    Rental_Category VARCHAR(50)
); 
DROP TABLE Vehicle_Types;

SELECT * FROM Vehicles;

ALTER TABLE Vehicles
DROP FOREIGN KEY FK_Vehicle_Types;

CREATE TABLE Vehicles (
	Vehicle_ID INT PRIMARY KEY,
    License_Plate VARCHAR(20),
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    Color VARCHAR(30),
    Daily_Rate DECIMAL(10,2),
    Status VARCHAR(20)
);

ALTER TABLE Vehicles
ADD COLUMN TypeID INT,
ADD CONSTRAINT FK_Vehicle_Types
FOREIGN KEY (TypeID) REFERENCES Vehicle_Types(TypeID);

CREATE TABLE Customers (
	Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Driver_License_Number VARCHAR(50),
    Phone VARCHAR(15)
);

CREATE TABLE Rentals (
	Rental_ID INT PRIMARY KEY,
    Customer_ID INT,
    FOREIGN KEY(Customer_ID) REFERENCES Customers(Customer_ID),
    Vehicle_ID INT,
    FOREIGN KEY(Vehicle_ID) REFERENCES Vehicles(Vehicle_ID),
    Rental_Date DATE,
    Return_Date DATE,
    Total_Cost DECIMAL(10,2)
);

CREATE TABLE Payments (
	Payment_ID INT PRIMARY KEY,
    Rental_ID INT,
    FOREIGN KEY (Rental_ID) REFERENCES Rentals(Rental_ID),
    Payment_Date DATE,
    Amount DECIMAL(10,2)
);

INSERT INTO vehicle_types (TypeID, Type_Name, Rental_Category)
VALUES
(1, 'SUV', 'Premium'),
(2, 'Sedan', 'Standard'),
(3, 'Hatchback', 'Economy'),
(4, 'Luxury', 'Premium');

SELECT * FROM Vehicle_Types;

INSERT INTO vehicles
(Vehicle_id, License_Plate, Make, Model, Year, Color, Daily_Rate, Status, TypeId)
VALUES
(101, 'MH31AB1234', 'Toyota', 'Fortuner', 2022, 'White', 4500.00, 'Rented', 1),
(102, 'MH31CD5678', 'Honda', 'City', 2021, 'Black', 2500.00, 'Available', 2),
(103, 'MH31EF9012', 'Maruti', 'Swift', 2023, 'Red', 1800.00, 'Available', 3),
(104, 'MH31GH3456', 'Hyundai', 'Creta', 2022, 'Grey', 3200.00, 'Rented', 1),
(105, 'MH31IJ7890', 'BMW', '3 Series', 2021, 'Blue', 7000.00, 'Available', 4),
(106, 'MH31KL2468', 'Tata', 'Nexon', 2023, 'White', 2200.00, 'Available', 1),
(107, 'MH31MN1357', 'Honda', 'Amaze', 2020, 'Silver', 2000.00, 'Maintenance', 2),
(108, 'MH31PQ8642', 'Maruti', 'Baleno', 2022, 'Blue', 1700.00, 'Available', 3);

SELECT * FROM Vehicles;

INSERT INTO customers
(Customer_Id, Name, Driver_License_Number, Phone)
VALUES
(1, 'Rahul Sharma', 'DL001234', '9876543210'),
(2, 'Amit Patil', 'DL002345', '9876543211'),
(3, 'Sneha Joshi', 'DL003456', '9876543212'),
(4, 'Priya Deshmukh', 'DL004567', '9876543213'),
(5, 'Rohan Kulkarni', 'DL005678', '9876543214'),
(6, 'Neha Verma', 'DL006789', '9876543215'),
(7, 'Vikram Singh', 'DL007890', '9876543216'),
(8, 'Anjali Mehta', 'DL008901', '9876543217');

SELECT * FROM Customers;

INSERT INTO Rentals
(Rental_Id, Customer_Id, Vehicle_Id, Rental_Date, Return_Date, Total_Cost)
VALUES

-- Rahul Sharma - 7 rentals
(1001, 1, 101, '2026-01-05', '2026-01-08', 13500.00),
(1002, 1, 101, '2026-02-10', '2026-02-15', 23500.00),
(1003, 1, 102, '2026-03-01', '2026-03-04', 7500.00),
(1004, 1, 104, '2026-04-10', '2026-04-15', 17500.00),
(1005, 1, 101, '2026-05-05', '2026-05-07', 9000.00),
(1006, 1, 105, '2026-06-01', '2026-06-03', 14000.00),
(1007, 1, 101, '2026-07-10', '2026-07-12', 9000.00),

-- Amit Patil
(1008, 2, 103, '2026-01-15', '2026-01-18', 5400.00),
(1009, 2, 104, '2026-02-20', '2026-02-25', 16500.00),
(1010, 2, 106, '2026-03-10', '2026-03-12', 4400.00),

-- Sneha Joshi
(1011, 3, 102, '2026-01-20', '2026-01-23', 7500.00),
(1012, 3, 108, '2026-02-15', '2026-02-17', 3400.00),
(1013, 3, 103, '2026-04-01', '2026-04-06', 9500.00),

-- Priya Deshmukh
(1014, 4, 105, '2026-03-05', '2026-03-08', 21000.00),
(1015, 4, 104, '2026-05-10', '2026-05-13', 9600.00),

-- Rohan Kulkarni
(1016, 5, 106, '2026-02-01', '2026-02-04', 6600.00),
(1017, 5, 108, '2026-03-15', '2026-03-18', 5100.00),

-- Neha Verma
(1018, 6, 102, '2026-04-05', '2026-04-08', 7500.00),

-- Vikram Singh
(1019, 7, 101, '2026-05-01', '2026-05-06', 25000.00),

-- Anjali Mehta
(1020, 8, 104, '2026-06-10', '2026-06-14', 12800.00),

-- Currently rented - not returned
(1021, 3, 101, '2026-09-15', NULL, 45000.00),
(1022, 6, 104, '2026-09-10', NULL, 48000.00),

-- Overdue - not returned
(1023, 7, 103, '2026-08-01', NULL, 9900.00);

SELECT * FROM Rentals;

INSERT INTO Payments
(Payment_Id, Rental_Id, Payment_Date, Amount)
VALUES
(5001, 1001, '2026-01-05', 13500.00),
(5002, 1002, '2026-02-10', 23500.00),
(5003, 1003, '2026-03-01', 7500.00),
(5004, 1004, '2026-04-10', 17500.00),
(5005, 1005, '2026-05-05', 9000.00),
(5006, 1006, '2026-06-01', 14000.00),
(5007, 1007, '2026-07-10', 9000.00),

(5008, 1008, '2026-01-15', 5400.00),
(5009, 1009, '2026-02-20', 16500.00),
(5010, 1010, '2026-03-10', 4400.00),

(5011, 1011, '2026-01-20', 7500.00),
(5012, 1012, '2026-02-15', 3400.00),
(5013, 1013, '2026-04-01', 9500.00),

(5014, 1014, '2026-03-05', 21000.00),
(5015, 1015, '2026-05-10', 9600.00),

(5016, 1016, '2026-02-01', 6600.00),
(5017, 1017, '2026-03-15', 5100.00),

(5018, 1018, '2026-04-05', 7500.00),

(5019, 1019, '2026-05-01', 25000.00),

(5020, 1020, '2026-06-10', 12800.00),

(5021, 1021, '2026-09-15', 45000.00),
(5022, 1022, '2026-09-10', 48000.00),
(5023, 1023, '2026-08-01', 9900.00);

SELECT * FROM Payments;

-- Q.1 List all vehicles currently rented out (not yet returned). 
SELECT * FROM Rentals;
SELECT * FROM Rentals;
SELECT * FROM Vehicles;
-- Using SubQuery
SELECT Vehicle_ID,Model,Make,Color
FROM Vehicles 
WHERE Vehicle_ID IN (
	SELECT Vehicle_ID
    FROM Rentals 
    WHERE Return_Date IS NULL
) AND Status = 'Rented';

-- Using Joins 
SELECT v.Vehicle_ID,v.Model,v.Make,v.Color,v.Status,r.Return_Date
FROM Vehicles v 
INNER JOIN Rentals r 
ON v.Vehicle_ID = r.Vehicle_ID
WHERE v.Status = 'Rented' AND r.Return_Date IS NULL;

-- Q.2 Calculate the total revenue generated per vehicle model. 
SELECT * FROM Vehicles;
SELECT * FROM Vehicle_Types;
SELECT * FROM Rentals;
SELECT * FROM Payments;

SELECT v.Model,SUM(p.Amount) AS Total_Revenue
FROM Vehicles v
INNER JOIN Vehicle_Types vt 
ON v.TypeID = vt.TypeID
INNER JOIN Rentals r 
ON v.Vehicle_ID = r.Vehicle_ID
INNER JOIN Payments p 
ON r.Rental_ID = p.Rental_ID
GROUP BY v.Model;

-- Q.3 Find the most frequently rented vehicle type.
SELECT * FROM Rentals;
SELECT * FROM Vehicle_Types;

SELECT vt.Type_Name,COUNT(r.Vehicle_ID) AS NumOfVehicles
FROM Rentals r 
INNER JOIN Vehicles v 
ON v.Vehicle_ID = r.Vehicle_ID
INNER JOIN Vehicle_Types vt 
ON vt.TypeID = v.TypeID
GROUP BY vt.Type_Name
ORDER BY NumOfVehicles DESC
LIMIT 1;

-- Q.4 Identify customers with overdue rentals (return_date < today and vehicle not returned).
SELECT current_date();
SELECT * FROM Rentals;

SELECT * FROM Rentals;
SELECT Customer_ID,DATEDIFF(Return_Date,Rental_Date) AS NumOfDaysReturn
FROM Rentals;

SELECT Customer_ID,Return_Date 
FROM Rentals 
WHERE Return_Date IS NULL;

SELECT r.Customer_ID, c.Name, r.Rental_ID, r.Rental_Date
FROM Rentals r
INNER JOIN Customers c
ON c.Customer_ID = r.Customer_ID
WHERE r.Return_Date IS NULL
AND DATE_ADD(r.Rental_Date, INTERVAL 3 DAY) < CURRENT_DATE();


-- Q.5 Calculate the average rental duration per vehicle type.
SELECT * FROM Rentals;
SELECT * FROM Vehicle_types;

SELECT vt.Type_Name,AVG(DATEDIFF(r.Return_Date,r.Rental_Date)) AS AvgRentalDuration
FROM Rentals r 
INNER JOIN Vehicles v
ON v.Vehicle_ID = r.Vehicle_ID
INNER JOIN Vehicle_Types vt
ON vt.TypeID = v.TypeID
GROUP BY vt.Type_Name;

-- Q.6 Find the vehicle that has been rented the most number of times. 
SELECT * FROM Vehicles;
SELECT * FROM Rentals;

SELECT v.Model,COUNT(r.Vehicle_ID) AS NumOfTimesRented
FROM Rentals r
INNER JOIN Vehicles v 
ON v.Vehicle_ID = r.Vehicle_ID
GROUP BY v.Vehicle_ID,v.Model
ORDER BY NumOfTimesRented DESC
LIMIT 1;

-- Q.7 List all rentals that incurred additional charges (e.g., late fees).
ALTER TABLE Rentals
ADD COLUMN Late_Fee DECIMAL(10,2) 
DEFAULT 0.00;

UPDATE Rentals
SET Late_Fee = 1000.00
WHERE Rental_ID = 1002;

UPDATE Rentals
SET Late_Fee = 1500.00
WHERE Rental_ID = 1009;

UPDATE Rentals
SET Late_Fee = 2000.00
WHERE Rental_ID = 1013;

UPDATE Rentals
SET Late_Fee = 1200.00
WHERE Rental_ID = 1019;

SELECT * FROM Rentals;

SELECT Rental_ID, Customer_ID, Vehicle_ID, Late_Fee
FROM Rentals
WHERE Late_Fee > 0;

-- Q.8 Identify customers who have rented more than 5 times.
SELECT * FROM Rentals;
SELECT * FROM Customers;

SELECT r.Customer_ID,c.Name,COUNT(r.customer_ID) AS NumOfTimesRented
FROM Rentals r
INNER JOIN Customers c 
ON c.Customer_ID = r.Customer_ID
GROUP BY r.Customer_ID
HAVING NumOfTimesRented > 5;

-- Q.9 Calculate the utilization rate (percentage of time rented) for each vehicle.
-- Utilization_Rate = (Billable or Productive Hours/Total Available Hours) * 100
-- Measures the percentage of available time or capacity that is actively used for productive or billable work

SELECT v.Vehicle_ID,v.Make,v.Model,
ROUND((SUM(DATEDIFF(COALESCE(r.Return_Date, Current_Date()),r.Rental_Date )) / 
DATEDIFF(Current_Date(),'2026-01-01') ) * 100 , 2) AS Utilization_Rate
FROM Vehicles v 
LEFT JOIN Rentals r 
ON v.Vehicle_ID = r.Vehicle_ID
GROUP BY v.Vehicle_ID,v.Make,v.Model;


-- Q.10 Find the most profitable customer (highest total payment amount).
SELECT * FROM Payments;
SELECT * FROM Rentals;

SELECT r.Customer_ID,c.Name,SUM(p.Amount) AS TotalPaymentAmount
FROM Rentals r 
INNER JOIN Payments p 
ON r.Rental_ID = p.Rental_ID
INNER JOIN Customers c 
ON c.Customer_ID = r.Customer_ID
GROUP BY r.Customer_ID
ORDER BY TotalPaymentAmount DESC
LIMIT 1;


ALTER TABLE Rentals
RENAME TO CarRentals;