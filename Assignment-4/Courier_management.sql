/*Creating Database*/
create database courier_management_system;

/*Using the database*/
use courier_management_system;

/*Creating table named Users*/
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address TEXT
);

/*Inserting Values in the table Users*/
INSERT INTO Users VALUES (1, 'Vinayagam', 'vinayagam@gmail.com', '123', '9995556661', '12,wall street,ooty,india'),
(2, 'Ganesh', 'ganesh@gmail.com', '12345', '9825447761', '14,park avenue,madurai,india'),
 (3, 'Siva', 'Siva@gmail.com', '9876', '8935457621', '89,Ram Nagar,,Coimbatore ,india'),
 (4, 'vinayak', 'vinayak@gmail.com', '6543', '8936853221', '10,lalbagh,mumbai,india'),
(5, 'Ajay Kumar', 'AjayAK@gmail.com', '6541', '9585477621', '7,Ram Nagar,Coimbatore,india'),
(6, 'Veera', 'veera@gmail.com', '3654', '8237857071', '13,Kumar Nagar,Coimbatore,india'),
(7, 'Parthiban', 'ParthiLeo@gmail.com', '6666', '9995457021', '18,cross cut road,salem,india'),
(8, 'Muthuvel', 'TigerMuthuvel@gmail.com', '9595', '9995446001', '7,poes gardens,Chennai,india'),
(9, 'Kumar', 'Kumar@gmail.com', '1287', '8893657021', '9,patel road,Chennai,india'),
(10, 'Abdul', 'Abdul001@gmail.com', '4321', '7585007021', '1,Kabilesh colony,madurai,india'),
(11, 'Priya', 'priya@gmail.com', '7754', '8231127071', '11,press colony,salem,india');

/*Creating Employee Table*/
CREATE TABLE Employee(
EmployeeID INT PRIMARY KEY,
Name VARCHAR(255),
Email VARCHAR(255) UNIQUE,
ContactNumber VARCHAR(20),
Role VARCHAR(50),
Salary DECIMAL(10, 2));

/*Creating CourierServices Table*/
CREATE TABLE CourierServices(
ServiceID INT PRIMARY KEY,
ServiceName VARCHAR(100),
Cost DECIMAL(8, 2));

/*Creating Courier Table*/
CREATE TABLE Courier (
CourierID INT PRIMARY KEY,
CustomerID INT,
SenderName VARCHAR(255),
SenderAddress TEXT,
ReceiverName VARCHAR(255),
ReceiverAddress TEXT,
Weight DECIMAL(5, 2),
Status VARCHAR(50),
TrackingNumber VARCHAR(20) UNIQUE,
DeliveryDate DATE,
ServiceID INT,
EmployeeID INT,
FOREIGN KEY (CustomerID) REFERENCES Users(UserID),
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
FOREIGN KEY (ServiceID) REFERENCES CourierServices(ServiceID)); 

/*Inserting Values to the CourierServices Table*/
INSERT INTO CourierServices (ServiceID, ServiceName, Cost) VALUES
(1, 'Standard', 10.00),
(2, 'Express', 50.50),
(3, 'Same-Day', 60.75),
(4, 'Overnight', 80.25),
(5, 'International', 150.00);

/*Creating Location Table*/
CREATE TABLE Location(
LocationID INT PRIMARY KEY,
LocationName VARCHAR(100),
Address TEXT); 

show tables;

/*Creating Payment Table*/
CREATE TABLE Payment(
PaymentID INT PRIMARY KEY,
CourierID INT,
LocationId INT,
Amount DECIMAL(10, 2),
PaymentDate DATE,
FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
FOREIGN KEY (LocationID) REFERENCES Location(LocationID));

/*Updating the adress in the User Table*/
UPDATE Users SET Address = '12,wall street,ooty,Tamil Nadu,india' WHERE UserID = 1;
UPDATE Users SET Address = '14,park avenue,madurai,Tamil Nadu,india' WHERE UserID = 2;
UPDATE Users SET Address = '89,Ram Nagar,Coimbatore,Tamil Nadu,india' WHERE UserID = 3;
UPDATE Users SET Address = '10,lalbagh,mumbai,Maharashtra,india' WHERE UserID = 4; 
UPDATE Users SET Address = '7,Ram Nagar,Coimbatore,Tamil Nadu,india' WHERE UserID = 5;
UPDATE Users SET Address = '13,Kumar Nagar,Coimbatore,Tamil Nadu,india' WHERE UserID = 6;
UPDATE Users SET Address = '18,cross cut road,salem,Tamil Nadu,india' WHERE UserID = 7;
UPDATE Users SET Address = '7,poes gardens,Chennai,Tamil Nadu,india' WHERE UserID = 8;
UPDATE Users SET Address = '9,patel road,Chennai,Tamil Nadu,india' WHERE UserID = 9;
UPDATE Users SET Address = '1,Kabilesh colony,madurai,Tamil Nadu,india' WHERE UserID = 10;
UPDATE Users SET Address = '11,press colony,salem,Tamil Nadu,india' WHERE UserID = 11;

select * from Users;

/*Inserting Values in the Location Table*/
INSERT INTO Location VALUES
    (1, 'Chennai, Tamil Nadu', '383,Anna Nagar, Chennai, Tamil Nadu'),
    (2, 'Mumbai, Maharashtra', '537,KMK Road, Mumbai, Maharashtra'),
    (3, 'Ooty, Tamil Nadu', '246,Lakers Avenue,Ooty, Tamil Nadu'),
    (4, 'Coimbatore, Tamil Nadu', '376,BBK Street,Coimbatore, Tamil Nadu'),
    (5, 'Salem, Tamil Nadu', '873,HSR Layot,Salem, Tamil Nadu'),
    (6, 'Pune, Maharashtra', '209,Patel Street,Pune, Maharashtra'),
    (7, 'Delhi, Delhi', '2567,Karol Bagh,Delhi, Delhi');
INSERT INTO Location VALUES(8, 'Madurai, Tamil Nadu', '27,Muni street,Madurai, Tamil Nadu' );
    
Select * from Location;

/*Inserting Values in the Employee table*/
INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)
VALUES 
(1, 'John Carter', 'johncarter@gmail.com', '1234567890', 'Manager', 60000.00),
(2, 'Arjun', 'Arjun24@gmail.com', '9876543210', 'Supervisor', 50000.00),
(3, 'Michael Kumar', 'michaelkumar@gmail.com', '5556667777', 'Courier Agent', 40000.00),
(4, 'John Wick', 'Johnwick@gmail.com', '1112223333', 'Courier Agent', 40000.00),
(5, 'James Jones', 'jamesjones@gmail.com', '4445556666', 'Courier Agent', 40000.00),
(6, 'Karthinaren', 'karthinaren@gmail.com', '9998887777', 'Courier Agent', 40000.00),
(7, 'Verstappen', 'verstappen@gmail.com', '7778889999', 'Courier Agent', 40000.00),
(8, 'Kumar raj', 'kumarraj@gmail.com', '6665554444', 'Courier Agent', 40000.00),
(9, 'Walter', 'waltervetrivel@gmail.com', '3332221111', 'Courier Agent', 40000.00),
(10, 'John Smith', 'johnsmith@gmail.com', '2223334444', 'Courier Agent', 40000.00),
(11, 'Narashimha', 'Narashimha@gmail.com', '8889990000', 'Courier Agent', 40000.00),
(12, 'Amban', 'RajanAmban@gmail.com', '1119998888', 'Courier Agent', 40000.00);

/*Inserting Values in the Courier table*/
Insert into Courier(CourierID, CustomerID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate, ServiceID, EmployeeID) values
(1, 1, 'Vinayagam', '12,wall street,ooty,Tamil Nadu,india', 'Nalla sivam', '108,MG road,Madurai,Tamil Nadu,india', 1.5, 'In Transit', 'J3R7W9Q5K2', '2024-04-15', 1, 6);
Insert into Courier(CourierID, CustomerID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate, ServiceID, EmployeeID) values
(2, 2,'Ganesh','14,park avenue,madurai,Tamil Nadu,india','Murugan','68,Rasipuram road,ooty,Tamil Nadu,india',2.0,'In Transist','E6H2S4N8A7','2024-04-16', 3,7),
(3, 3, 'Siva', '89,Ram Nagar,,Coimbatore,Tamil Nadu,india', 'Sakthi', '352,GH Colony, Mumbai, Maharashtra, India', 2.8, 'Out for Delivery', 'P5L9T2I4Y7', '2024-04-17', 4,8),
(4, 4, 'Vinayak', '10,lalbagh,mumbai,Maharashtra,india', 'Mahadev', '36,EDP Road, Salem,Tamil Nadu, india', 1.2, 'Pending', 'B1M6P8D4R2', '2024-04-15',3,9),
(5, 5, 'Ajay Kumar', '7,Ram Nagar,Coimbatore,Tamil Nadu,india', 'Elsa Das', '420,Das Road, Delhi, Delhi, india', 3.5, 'Delivered', 'U9V3G5O1C6', '2024-04-19',2,10),
(6, 1, 'Vinayagam', '12,wall street,ooty,Tamil Nadu,india', 'Antony Das', '562,PSD Road, Chennai, Tamil Nadu, india', 2.3, 'Delivered', 'K2F4A6W8I3', '2024-04-20',1,11),
(7, 7, 'Parthiban', '18,cross cut road,salem,Tamil Nadu,india', 'Leo Das', '134,Indian Road,Mumbai, Maharashtra, india', 1.9, 'In Transit', 'C7N1Z9E3Q5', '2024-04-21',2,1),
(8, 8, 'Muthuvel', '7,poes gardens,Chennai,Tamil Nadu, india', 'Varman', '170,Sculpting Colony, Ooty,Tamil Nadu,india', 2.7, 'Out for Delivery', 'H4T6Y8R2L9', '2024-04-24',3,9),
(9, 9, 'Kumar', '9,patel road,Chennai,Tamil Nadu, india', 'Surya', '819,RCB Road, Pune, Maharashtra, india', 2.1, 'Pending', 'D8P3V5K1F7', '2024-04-23',2,12),
(10, 10, 'Abdul', '1,Kabilesh colony,madurai,Tamil Nadu, india', 'Srinivasan', '11,Shree Ram Road, Mumbai, Maharashtra, india', 1.6, 'Delivered', 'S5O9U2J4M8', '2024-04-24',2,8),
(11, 1, 'Vinayagam', '12,wall street,ooty,Tamil Nadu,india', 'Karim', '51, Peacock Road, Chennai,Tamil Nadu, india', 2.2, 'In Transit', 'F7I3K9P5B2', '2024-04-24',1,11),
(12, 3, 'Siva', '89,Ram Nagar,,Coimbatore,Tamil Nadu,india', 'Prem', '79,GT Road,Pune, Maharashtra,india', 1.8, 'In Transit', 'L2T8M4A6R1', '2024-04-26',2,7),
(13, 11, 'Priya', '11,press colony,salem,Tamil Nadu,india', 'Ashok', '7, Chor Street,Delhi, Delhi, india', 3.3, 'Delivered', 'G5O1C3N7Z9', '2024-04-15',1,9),
(14, 6, 'Veera', '13,Kumar Nagar,Coimbatore,Tamil Nadu,india', 'Altaf', '91,Army Colony, Mumbai, Maharashtra, India', 3.1, 'Delivered', 'V3J4W6Q8Y2', '2024-04-09',3,8 ); 

select * from Courier;

INSERT INTO Payment(PaymentID,CourierID,LocationId,Amount,PaymentDate) VALUES
(1,1,8,15.00,'2024-04-10'),
(2,2,3,101.00,'2024-04-16'),
(3,3,2,224.70,'2024-04-15'),
(4,4,5,72.90,'2024-04-15'),
(5,5,7,176.75,'2024-04-17'),
(6,6,1,23.00,'2024-04-14'),
(7,7,2,95.95,'2024-04-20'),
(8,8,3,164.02,'2024-04-24'),
(9,9,6,106.05,'2024-04-22'),
(10,10,2,80.80,'2024-04-22'),
(11,11,1,22.00,'2024-04-19'),
(12,12,6,90.90,'2024-04-25'),
(13,13,7,33.00,'2024-04-10'),
(14,14,2,188.32,'2024-04-09');

select * from payment;

/*															 TASK 2 - SELECT WHERE                                                            */

-- 1.List all customers:
SELECT 
    Name AS Customers
FROM
    Users;
    
-- 2.List all orders for a specific customer:
SELECT 
    CourierTable.CourierID,
    CourierTable.SenderName AS Customer,
    CourierTable.SenderAddress AS CustomerAddress,
    CourierTable.ReceiverName,
    CourierTable.ReceiverAddress,
    CourierTable.Status,
    CourierTable.TrackingNumber,
    CourierTable.DeliveryDate,
    ServiceTable.ServiceName,
    PaymentTable.Amount AS TotalPaid
FROM
    Courier CourierTable
        JOIN
    CourierServices ServiceTable ON CourierTable.ServiceID = ServiceTable.ServiceID
        JOIN
    Payment PaymentTable ON CourierTable.CourierID = PaymentTable.CourierID
WHERE
    CourierTable.SenderName = 'Vinayagam';
    
-- 3. List All Courier
SELECT 
    cr.CourierID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Weight,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceName,
    emp.Name AS EmployeeName,
    pay.Amount AS TotalPaid
FROM
    courier cr
        JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID
        JOIN
    employee emp ON cr.EmployeeID = emp.EmployeeID
        JOIN
    payment pay ON cr.CourierID = pay.CourierID;


-- 4.List all packages for a specific order:
SELECT 
    cr.CourierID,
    cr.CustomerID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Weight,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceName,
    emp.Name AS EmployeeName,
    pay.Amount AS TotalPaid
FROM
    courier cr
        JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID
        JOIN
    employee emp ON cr.EmployeeID = emp.EmployeeID
        JOIN
    payment pay ON cr.CourierID = pay.CourierID
WHERE
    cr.CustomerID = 1;
    
-- 5.List all deliveries for a specific courier:
SELECT 
    cr.CourierID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Weight,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.Cost AS CostPerKg,
    sr.ServiceName,
    emp.Name AS EmployeeName,
    pay.Amount AS TotalPaid
FROM
    courier cr
        JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID
        JOIN
    employee emp ON cr.EmployeeID = emp.EmployeeID
        JOIN
    payment pay ON cr.CourierID = pay.CourierID
WHERE
    sr.ServiceID = 2;
    
-- 6.List all undelivered packages:
SELECT 
    cr.CourierID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Weight,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceName,
    emp.Name AS EmployeeName,
    pay.Amount AS TotalPaid
FROM
    courier cr
        JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID
        JOIN
    employee emp ON cr.EmployeeID = emp.EmployeeID
        JOIN
    payment pay ON cr.CourierID = pay.CourierID
WHERE
    cr.Status != 'Delivered';
    
-- 7.List all packages that are scheduled for delivery today:
SELECT 
    cr.CourierID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Weight,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceName,
    emp.Name AS EmployeeName,
    pay.Amount AS TotalPaid
FROM
    courier cr
        JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID
        JOIN
    employee emp ON cr.EmployeeID = emp.EmployeeID
        JOIN
    payment pay ON cr.CourierID = pay.CourierID
WHERE
    cr.DeliveryDate = '2024-04-15';
    
-- 8.List all packages with a specific status:
SELECT 
    cr.CourierID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Weight,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceName,
    emp.Name AS EmployeeName,
    pay.Amount AS TotalPaid
FROM
    courier cr
        JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID
        JOIN
    employee emp ON cr.EmployeeID = emp.EmployeeID
        JOIN
    payment pay ON cr.CourierID = pay.CourierID
WHERE
    cr.Status = 'Delivered';
    
-- 9.Calculate the total number of packages for each courier.
SELECT 
    sr.ServiceName, COUNT(cr.ServiceID) AS TotalPackages
FROM
    CourierServices sr
LEFT JOIN
    courier cr ON cr.ServiceID = sr.ServiceID
GROUP BY
    sr.ServiceID, sr.ServiceName;
    
-- 10.Find the average delivery time for each courier
SELECT 
    cr.CourierID,
    ROUND(DATEDIFF(cr.DeliveryDate, pay.PaymentDate)) AS AverageDeliveryTime
FROM
    courier cr
        JOIN
    payment pay ON cr.CourierID = pay.CourierID;

SELECT 
    sr.ServiceName,
    ROUND(AVG(DATEDIFF(cr.DeliveryDate, pay.PaymentDate))) AS AvgDeliveryTime
FROM
    courier cr
        JOIN
    courierservices sr ON sr.ServiceID = cr.ServiceID
        JOIN
    payment pay ON pay.CourierID = cr.CourierID
GROUP BY sr.ServiceID;

-- 11.List all packages with a specific weight range:
SELECT 
    cr.CourierID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Weight,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceName,
    emp.Name AS EmployeeName,
    pay.Amount AS TotalPaid
FROM
    courier cr
        JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID
        JOIN
    employee emp ON cr.EmployeeID = emp.EmployeeID
        JOIN
    payment pay ON cr.CourierID = pay.CourierID
WHERE
    cr.Weight BETWEEN 1 AND 2.5;

SELECT 
    COUNT(*)
FROM
    courier
WHERE
    Weight BETWEEN 2 AND 3;
    
-- 12.Retrieve employees whose names contain 'John':
SELECT 
    Name
FROM
    employee
WHERE
    Name LIKE '%John%';
    
-- 13.Retrieve all courier records with payments greater than 50.
SELECT 
    cr.CourierID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Weight,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceName,
    emp.Name AS EmployeeName,
    pay.Amount AS TotalPaid
FROM
    Courier cr
        JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID
        JOIN
    Employee emp ON cr.CourierID = emp.EmployeeID
        JOIN
    payment pay ON cr.courierID = pay.courierID
WHERE
    pay.Amount > 50;
    
/*														TASK 3 GroupBy, Aggregate Functions, Having, Order By, where							*/

-- 14.Find the total number of couriers handled by each employee:
SELECT 
    emp.Name, COUNT(*) AS NumberOfCouriers
FROM
    employee emp
        JOIN
    courier cr ON cr.EmployeeID = emp.EmployeeID
GROUP BY cr.EmployeeID;  

-- 15.Calculate the total revenue generated by each location
SELECT 
    loc.LocationName, SUM(pay.Amount) AS TotalRevenue
FROM
    location loc
        JOIN
    payment pay
ON
    pay.LocationID = loc.LocationID
GROUP BY loc.LocationID;

-- 16. Find the total number of couriers delivered to each location:
SELECT 
    loc.LocationName, COUNT(*) AS NumberOfCouriers
FROM
    Courier cr
        JOIN
    Location loc ON cr.ReceiverAddress LIKE CONCAT('%', loc.LocationName, '%')
GROUP BY loc.LocationName;

-- 17. Find the courier with the highest average delivery time: 
SELECT 
    cr.CourierID,
    ROUND(DATEDIFF(cr.DeliveryDate, pay.PaymentDate)) AS AvgDeliveryTime
FROM
    Courier cr
        JOIN
    Payment pay ON cr.CourierID = pay.CourierID
ORDER BY AvgDeliveryTime DESC
LIMIT 1;

SELECT 
    sr.ServiceName,
    ROUND(AVG(DATEDIFF(cr.DeliveryDate, pay.PaymentDate))) AS AvgDeliveryTime
FROM
    courier cr
        JOIN
    courierservices sr ON sr.ServiceID = cr.ServiceID
        JOIN
    payment pay ON pay.CourierID = cr.CourierID
GROUP BY sr.ServiceID
ORDER BY AvgDeliveryTime DESC
LIMIT 1;

-- 18. Find Locations with Total Payments Less Than a Certain Amount
SELECT 
    loc.LocationName, SUM(pay.Amount) AS sum
FROM
    location loc
        JOIN
    payment pay ON pay.LocationID = loc.LocationID
GROUP BY loc.LocationID
HAVING sum < 120;

-- 19. Calculate Total Payments per Location 
SELECT 
    loc.locationName, SUM(pay.Amount) AS TotalPayment
FROM
    Location loc
        JOIN
    payment pay ON pay.locationid = loc.locationid
GROUP BY l.LocationName;

-- 20. Retrieve couriers who have received payments totaling more than $80 in a specific location (LocationID = X):
SELECT 
    cr.CourierID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceName,
    SUM(pay.Amount) AS TotalPaid
FROM
    Courier cr
        JOIN
    CourierServices sr ON cr.ServiceID = sr.ServiceID
        JOIN
    Payment pay ON cr.CourierID = pay.CourierID
WHERE
    pay.LocationId = 2 
GROUP BY
    cr.CourierID, cr.SenderName, cr.SenderAddress, cr.ReceiverName, cr.ReceiverAddress, cr.Status, cr.TrackingNumber, cr.DeliveryDate, sr.ServiceName
HAVING
    SUM(pay.Amount) > 80;
    
-- 21. Retrieve couriers who have received payments totaling more than $80 after a certain date (PaymentDate > 'YYYY-MM-DD'): 
SELECT 
    cr.CourierID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceName,
    pay.Amount AS TotalPaid  
FROM
    courier cr
        JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID
        JOIN
    payment pay ON cr.CourierID = pay.CourierID
WHERE
     pay.Amount > 80 AND pay.PaymentDate > '2024-04-18';
     
-- 22. Retrieve locations where the total amount received is more than $150 before a certain date(PaymentDate > 'YYYY-MM-DD') 
SELECT 
    loc.LocationID,
    loc.LocationName,
    SUM(pay.Amount) AS TotalAmountReceived
FROM
    location loc
        JOIN
    courier cr ON cr.ReceiverAddress LIKE CONCAT('%', loc.LocationName, '%')
        JOIN
    payment pay ON cr.CourierID = pay.CourierID
WHERE
    pay.PaymentDate > '2024-04-18'
GROUP BY
    loc.LocationID
HAVING
    SUM(pay.Amount) > 150;
 
 /*														TASK 4: Inner Join,Full Outer Join, Cross Join, Left Outer Join,Right Outer Join			*/
-- 23. Retrieve Payments with Courier Information 
SELECT 
    cr.CourierID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    pay.Amount AS TotalPaid,
    pay.PaymentDate
FROM
    payment pay
        JOIN
    courier cr ON pay.CourierID = cr.CourierID;

-- 24. Retrieve Payments with Location Information 
SELECT 
    pay.PaymentID,
    pay.CourierID,
    loc.LocationName,
    loc.Address AS HUBAddress,
    pay.Amount,
    pay.PaymentDate
FROM
    payment pay
        JOIN
    location loc ON pay.LocationID = loc.LocationID
ORDER BY PaymentDate ASC;

-- 25. Retrieve Payments with Courier and Location Information 
SELECT 
    cr.CourierID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    pay.Amount AS TotalPaid,
    pay.PaymentDate,
    loc.LocationName,
    loc.Address AS StateOfficeAddress
FROM
    Payment pay
        JOIN
    Courier cr ON pay.CourierID = cr.CourierID
        JOIN
    Location loc ON pay.LocationID = loc.LocationID;
    
-- 26. List all payments with courier details 
SELECT 
    cr.CourierID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    pay.PaymentID,
    pay.Amount AS TotalPaid,
    pay.PaymentDate
FROM
    payment pay
        JOIN
    courier cr ON pay.CourierID = cr.CourierID;

-- 27. Total payments received for each courier
SELECT 
    cr.CourierID,
    cr.SenderName,
    SUM(pay.Amount) AS TotalPaymentsReceived
FROM
    courier cr
        LEFT JOIN
    payment pay ON cr.CourierID = pay.CourierID
GROUP BY cr.CourierID;

-- 28. List payments made on a specific date 
SELECT 
    cr.CourierID,
    cr.SenderName,
    pay.PaymentID,
    pay.Amount,
    pay.PaymentDate
FROM
    Courier cr
        JOIN
    payment pay ON cr.CourierID = pay.CourierID
WHERE
    pay.PaymentDate = '2024-04-14';
    
-- 29. Get Courier Information for Each Payment 
SELECT 
    pay.PaymentID,
    cr.CourierID,
    cr.SenderName AS Customer,
    cr.SenderAddress AS CustomerAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Weight,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceName,
    emp.Name AS EmployeeName,
    pay.Amount AS TotalPaid,
    pay.PaymentDate
FROM
    courier cr
        JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID
		JOIN
    employee emp ON cr.EmployeeID = emp.EmployeeID
        JOIN
    payment pay ON cr.CourierID = pay.CourierID;
    
-- 30. Get Payment Details with Location 
SELECT 
    pay.PaymentID,
    pay.CourierID,
    loc.LocationName,
    loc.Address AS StateOfficeAddress,
    pay.Amount,
    pay.PaymentDate
FROM
    payment pay
        JOIN
    location loc ON pay.LocationID = loc.LocationID
ORDER BY PaymentDate ASC;

-- 31. Calculating Total Payments for Each Courier 
SELECT 
    cr.CourierID, cr.SenderName, SUM(pay.Amount) as TotalPayments
FROM
    courier cr
        LEFT JOIN
    payment pay ON pay.CourierID = cr.CourierID
GROUP BY cr.CourierID;

-- 32. List Payments Within a Date Range
SELECT 
    pay.PaymentID,
    pay.CourierID,
    cr.SenderName,
    loc.LocationName,
    loc.Address AS StateOfficeAddress,
    pay.Amount,
    pay.PaymentDate
FROM
    payment pay
        JOIN
    location loc ON pay.LocationID = loc.LocationID
        JOIN
    courier cr ON pay.CourierID = cr.CourierID
WHERE
    pay.PaymentDate BETWEEN '2024-04-20' AND '2024-04-24'
ORDER BY pay.PaymentDate ASC;

-- 33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side 
SELECT 
    Usr.UserID,
    Usr.Name,
    cr.CourierID,
    cr.SenderAddress AS UserAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Weight,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceName,
    emp.Name AS EmployeeName,
    pay.Amount AS TotalPaid
FROM
    Users Usr
        LEFT JOIN
    courier cr ON Usr.UserID = cr.CustomerID
        LEFT JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID
        LEFT JOIN
    employee emp ON cr.EmployeeID = emp.EmployeeID
        LEFT JOIN
    payment pay ON cr.CourierID = pay.CourierID

UNION

SELECT 
    Usr.UserID,
    Usr.Name,
    cr.CourierID,
    cr.SenderAddress AS UserAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Weight,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceName,
    emp.Name AS EmployeeName,
    pay.Amount AS TotalPaid
FROM
    courier cr
        RIGHT JOIN
    Users Usr ON Usr.UserID = cr.CustomerID
        RIGHT JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID
        RIGHT JOIN
    employee emp ON cr.EmployeeID = emp.EmployeeID
        RIGHT JOIN
    payment pay ON cr.CourierID = pay.CourierID;
    
-- 34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side
SELECT 
    cr.CourierID,
    cr.SenderName AS CustomerName,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceID,
    sr.ServiceName
FROM
    courier cr
        LEFT JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID 
UNION SELECT 
    cr.CourierID,
    cr.SenderName AS CustomerName,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceID,
    sr.ServiceName
FROM
    courier cr
        RIGHT JOIN
    courierservices sr ON cr.ServiceID = sr.ServiceID;
    
-- 35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side 
SELECT 
    emp.EmployeeID,
    emp.Name AS EmployeeName,
    pay.PaymentID,
    pay.Amount AS PaymentAmount
FROM
    Employee emp
        LEFT JOIN
    Courier cr ON emp.EmployeeID = cr.EmployeeID
        LEFT JOIN
    Payment pay ON cr.CourierID = pay.CourierID 
UNION SELECT 
    emp.EmployeeID,
    emp.Name AS EmployeeName,
    pay.PaymentID,
    pay.Amount AS PaymentAmount
FROM
    Payment pay
        RIGHT JOIN
    Courier cr ON pay.CourierID = cr.CourierID
        RIGHT JOIN
    Employee emp ON emp.EmployeeID = cr.EmployeeID;

-- 36. List all users and all courier services, showing all possible combinations. 
SELECT 
    Usr.UserID,
    Usr.Name AS UserName,
    Usr.Email AS UserEmail,
    sr.ServiceID,
    sr.ServiceName,
    sr.Cost
FROM
    Users Usr
CROSS JOIN
    CourierServices sr;
    
-- 37. List all employees and all locations, showing all possible combinations: 
SELECT 
    *
FROM
    employee emp
        CROSS JOIN
    location loc;
    
-- 38. Retrieve a list of couriers and their corresponding sender information (if available)
SELECT 
    cr.CourierID,
    Usr.Name AS SenderName,
    Usr.Email AS SenderEmail,
    Usr.ContactNumber AS SenderContactNumber,
    Usr.Address AS SenderAddress
FROM
    Courier cr
        LEFT JOIN
    Users Usr ON cr.CustomerID = Usr.UserID
ORDER BY cr.CourierID ASC;

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available): 

SELECT
    cr.CourierID,
    cr.TrackingNumber,
    cr.ReceiverName,
    cr.ReceiverAddress
FROM 
    Courier cr
LEFT JOIN
    Courier cr1 ON cr.CourierID = cr1.CourierID
WHERE
    cr1.ReceiverName IS NOT NULL;
    
-- 40. Retrieve a list of couriers along with the courier service details (if available): 
SELECT 
    cr.CourierID,
    cr.SenderName,
    cr.SenderAddress,
    cr.ReceiverName,
    cr.ReceiverAddress,
    cr.Weight,
    cr.Status,
    cr.TrackingNumber,
    cr.DeliveryDate,
    sr.ServiceID,
    sr.ServiceName,
    sr.Cost,
    pay.Amount AS TotalCost
FROM
    Courier cr
        INNER JOIN
    CourierServices sr ON cr.ServiceID = sr.ServiceID
        INNER JOIN
    payment AS pay ON cr.CourierID = pay.PaymentID
ORDER BY cr.CourierID ASC;

-- 41. Retrieve a list of employees and the number of couriers assigned to each employee: 
SELECT 
    e.EmployeeID, e.Name, COUNT(*) AS NumberOfCouriers
FROM
    Courier c
        INNER JOIN
    employee e ON c.EmployeeID = e.EmployeeID
GROUP BY c.EmployeeID;

-- 42. Retrieve a list of locations and the total payment amount received at each location: 
SELECT 
    loc.LocationName, SUM(pay.Amount) AS TotalPaymentAmount
FROM
    location loc
        JOIN
    payment pay ON pay.LocationID = loc.LocationID
GROUP BY loc.LocationID;

-- 43. Retrieve all couriers sent by the same sender (based on SenderName). 
SELECT DISTINCT
    cr.*
FROM
    Courier cr
        JOIN
    Courier cr1 ON cr.SenderName = cr1.SenderName
WHERE
    cr.CourierID != cr1.CourierID
ORDER BY cr.CustomerID ASC;

-- 44. List all employees who share the same role. 
SELECT DISTINCT
    emp.Name, emp.Role
FROM
    employee emp
        JOIN
    employee emp1 ON emp1.Role = emp.Role
WHERE
    emp.EmployeeID != emp1.EmployeeID;
    
-- 45. Retrieve all payments made for couriers sent from the same location. 
SELECT 
    pay.CourierID, pay.Amount, pay.PaymentDate, loc.LocationName
FROM
    payment pay
        JOIN
    location loc ON pay.LocationID = loc.LocationID
WHERE
    pay.LocationID IN (SELECT 
            pay.LocationID
        FROM
            payment pay
        GROUP BY pay.LocationID
        HAVING COUNT(*) > 1);
        
-- 46. Retrieve all couriers sent from the same location (based on SenderAddress). 
SELECT 
    cr.CourierID,
    cr.SenderAddress,
    pay.Amount,
    pay.PaymentDate,
    SUBSTRING_INDEX(SUBSTRING_INDEX(cr.SenderAddress, ',', - 3),
            ',',1)
            AS City
FROM
    Courier cr
        JOIN
    Payment pay ON cr.CourierID = pay.CourierID
WHERE
    SUBSTRING_INDEX(SUBSTRING_INDEX(cr.SenderAddress, ',', - 3),
            ',',1) 
            IN (SELECT 
            City
        FROM
            (SELECT 
                SUBSTRING_INDEX(SUBSTRING_INDEX(SenderAddress, ',', - 3), ',', 1) AS City,
                    COUNT(*) AS CityCount
            FROM
                Courier 
            GROUP BY City
            HAVING CityCount > 1) AS SubQuery)
ORDER BY City;

-- 47. List employees and the number of couriers they have delivered: 
SELECT 
    emp.EmployeeID,emp.Name, COUNT(*) AS NumberOfCouriers
FROM
    employee emp
        JOIN
    courier cr ON cr.EmployeeID = emp.EmployeeID
GROUP BY cr.EmployeeID;  

-- 48. Find couriers that were paid an amount greater than the cost of their respective courier services 
SELECT 
    cr.CourierID,
    cr.ServiceID,
    sr.Cost AS ServiceCostPerKg,
    sr.Cost * cr.Weight AS ActualAmount,
    pay.Amount AS AmountPaid
FROM
    courier cr
    INNER JOIN courierservices sr ON cr.ServiceID = sr.ServiceID
    INNER JOIN payment pay ON cr.CourierID = pay.CourierID
WHERE
    pay.Amount > (sr.Cost * cr.Weight);

-- 49. Find couriers that have a weight greater than the average weight of all couriers 
SELECT 
    cr.CourierID,
    cr.Weight,
    ROUND((SELECT AVG(cr.Weight) FROM Courier cr), 2) AS AverageWeight
FROM
    Courier cr
WHERE
    cr.Weight > (SELECT AVG(cr.Weight) FROM Courier cr);
    
-- 50. Find the names of all employees who have a salary greater than the average salary: 
SELECT 
    emp.Name,
    emp.Salary,
    (SELECT ROUND(AVG(emp.Salary)) FROM employee emp) AS AverageSalary
FROM 
    employee emp
WHERE 
    Salary > (SELECT AVG(emp.Salary) FROM employee emp);
    
-- 51. Find the total cost of all courier services where the cost is less than the maximum cost 
SELECT 
    SUM(sr.Cost) AS TotalCost
FROM 
    CourierServices sr
WHERE 
    Cost < (SELECT MAX(sr.Cost) FROM CourierServices sr);
    
-- 52. Find all couriers that have been paid for 
SELECT DISTINCT CourierID
FROM payment;

-- 53. Find the locations where the maximum payment amount was made 
SELECT 
    loc.LocationID, loc.LocationName, loc.Address, pay.Amount
FROM
    location loc
        JOIN
    payment pay ON pay.LocationID = loc.LocationID
WHERE
    pay.Amount = (SELECT 
            MAX(Amount)
        FROM
            payment);

-- 54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'): 
SELECT CourierID, Weight,
       (SELECT SUM(Weight) 
        FROM courier 
        WHERE SenderName = 'Abdul') AS TotalWeightBySender
FROM courier
WHERE Weight > (
    SELECT SUM(Weight)
    FROM courier
    WHERE SenderName = 'Abdul'
);
