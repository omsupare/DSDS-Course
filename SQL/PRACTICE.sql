
CREATE DATABASE temp1;

CREATE DATABASE temp2;

DROP DATABASE temp1;
DROP DATABASE temp2;

CREATE DATABASE College2;

USE college2;

CREATE TABLE student2 (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);

INSERT INTO student2 VALUES(1, "AMAN", 26);
INSERT INTO student2 VALUES(2, "SHARADHA", 24);

SELECT * FROM student2;

CREATE DATABASE IF NOT EXISTS college2;
DROP DATABASE IF EXISTS company;

SHOW DATABASES;
SHOW TABLES;

DROP TABLE student2;

CREATE TABLE STUDENT2 (
	ID INT PRIMARY KEY,
    NAME VARCHAR(50)
);

SELECT * FROM STUDENT2;

INSERT INTO STUDENT2
(ID, NAME)
VALUES
(101,"KARAN"),
(102,"ARJUN"),
(103,"RAMA");

INSERT INTO STUDENT2 
(ID, NAME)
VALUES
(104,"PINKY");

INSERT INTO STUDENT2 VALUES (105,"BHIM");

CREATE DATABASE xyz_company;
USE xyz_company;

CREATE TABLE
IF NOT EXISTS EMPLOYEE
(ID INT PRIMARY KEY,
NAME VARCHAR(50),
SALARY INT
);

INSERT INTO EMPLOYEE
(ID, NAME, SALARY)
VALUES
(101,"ADAM",2500),
(102,"BOB",3000),
(103,"CASEY",4000);

SELECT * FROM EMPLOYEE;

CREATE TABLE TEMP1 (
	ID INT UNIQUE
);

INSERT INTO TEMP1 
VALUES
(101); 

INSERT INTO TEMP1 
VALUES
(101); 

CREATE TABLE TEMP1 (
	ID INT NOT NULL,
    NAME VARCHAR(50),
    PRIMARY KEY (ID,NAME)
);

SHOW TABLES;

CREATE TABLE EMP (
	ID INT,
    SALARY INT DEFAULT 25000
);

INSERT INTO EMP(ID) VALUES (101);

SELECT * FROM EMP;

CREATE TABLE CITY1 (
	ID INT PRIMARY KEY,
    CITY VARCHAR(50),
    AGE INT
    CONSTRAINT AGE_CHECK1 CHECK (AGE >= 18 AND CITY ="DELHI")
);

USE college2;

DROP TABLE student2;

CREATE TABLE student2 (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student2
(rollno, name, marks, grade, city)
VALUES
(1,'Anil',78,'C','Pune'),
(2,'Bhumika',93,'A','Mumbai'),
(3,'Chetan',85,'B','Mumbai'),
(4,'Dhruv',96,'A','Delhi'),
(5,'Emanuel',12,'F','Delhi'),
(6,'Farah',82,'B','Delhi');

SELECT DISTINCT city FROM student2;

SELECT * 
FROM student2
WHERE city = 'Mumbai';

SELECT * 
FROM student2
WHERE marks > 80 AND city = 'Mumbai';

SELECT *
FROM student2
WHERE marks+10 > 100;

SELECT * 
FROM student2
WHERE marks > 93;

SELECT *
FROM student2
WHERE marks > 90 OR city = "Mumbai";

SELECT *
FROM student2
WHERE marks
BETWEEN 80 AND 100;

SELECT * 
FROM student2
WHERE city IN ('DELHI','MUMBAI');

SELECT *
FROM student2
WHERE city NOT IN ('DELHI','MUMBAI');

SELECT * 
FROM student2
WHERE MARKS > 75
LIMIT 3 ;

SELECT * 
FROM student2
ORDER BY marks DESC
LIMIT 3;

SELECT COUNT(marks)
FROM student2;

SELECT city, AVG(marks)
FROM student2
GROUP BY city;

Use College2;

SELECT * FROM student2;

SELECT AVG(marks),city 
FROM student2
GROUP BY city
ORDER BY AVG(marks) ASC;


CREATE TABLE PaymentTable(
	CustomerID INT PRIMARY KEY,
    Customer VARCHAR(50),
    Mode VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO PaymentTable VALUES
(101,'Olivia Barret','NetBanking','Portland'),
(102,'Ethan Sinclair','Credit Card','Miami'),
(103,'Maya Hernandez','Credit Card','Seattle'),
(104,'Liam Donovan','NetBanking','Denver'),
(105,'Sophia Nglyen','Credit Card','New Orleans'),
(106,'Caleb Foster','Debit Card','Minnepolis'),
(107,'Ava Patel','Debit Card','Phoenix'),
(108,'Lucas Carler','NetBanking','Boston'),
(109,'Isabella Martinez','NetBanking','Nashville'),
(110,'Jackson Brooks','Credit Card','Boston');

SELECT * FROM PaymentTable;

SELECT COUNT(Mode),mode
FROM PaymentTable
GROUP BY mode;

SELECT grade, COUNT(rollno)
FROM student2
GROUP BY grade
ORDER BY grade ASC;

SELECT city, COUNT(rollno)
FROM student2
GROUP BY city
HAVING MAX(marks) > 90;

SELECT city
FROM student2
WHERE grade = 'A'
GROUP BY city
HAVING MAX(marks) >= 93
ORDER BY city ASC;

UPDATE student2
SET grade = 'O'
WHERE grade = 'A';
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM student2;

UPDATE student2
SET marks = 82
WHERE rollno = 5;

UPDATE student2
SET grade = 'B'
WHERE marks > 80;

UPDATE student2
SET marks = 12
WHERE rollno = 5;

UPDATE student2
SET marks = marks + 1;

DELETE FROM student2
WHERE marks < 33;



