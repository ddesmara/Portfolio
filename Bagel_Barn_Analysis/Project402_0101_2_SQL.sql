USE BMGT402_DB_Student_103

-- DDL
DROP TABLE CustomersProj;
DROP TABLE SuppliersProj;
DROP TABLE GoodsProj;
DROP TABLE EquipmentProj;
DROP TABLE IngredientsProj;
DROP TABLE OrdersProj;

CREATE TABLE CustomersProj( 
CustomerID CHAR(10) NOT NULL,
CustomerName VARCHAR(30),
MemberStatus CHAR(1),
DateJoined DATE,
CustomerAge VARCHAR(3),
CustomerAddress VARCHAR(50),
CustomerCity VARCHAR(50),
CustomerState CHAR(2),
CustomerZip CHAR(5),
CONSTRAINT pk_CustomerID PRIMARY KEY(CustomerID));

INSERT INTO CustomersProj VALUES('0000000001','Arshdeep Singh','Y','2021-02-08','22', '47 Dunn Way', 'Princeton', 'NJ', '08550'),
('0000000002','Arpan Chavan','Y','2021-02-14','22', '42 Gregor Drive', 'Princeton', 'NJ', '08550'),
('0000000003','Yash Kamdar','Y','2021-08-03','22', '34 Scooty Blvd', 'Princeton', 'NJ', '08550'),
('0000000004','Doyina Eyam-Ozung','N',NULL, NULL, NULL, NULL, NULL, NULL),
('0000000005','Nikita Kumar','Y','2021-08-28','22', '57 Shutterfly Rd', 'Princeton', 'NJ', '08550'),
('0000000006','Simran Chertara','Y','2021-08-16','22', '54 Wobbly Way', 'Franklin', 'NJ', '08555'),
('0000000007','Anna Cola','Y','2021-07-30','22', '78 Hugo Rd', 'Franklin', 'NJ', '08555'),
('0000000008','Kritik Mirg','Y','2021-08-22','22', '84 Elsie Dr', 'Plainfield', 'NJ', '08558'),
('0000000009','Sammy Munta','Y','2021-06-28','22', '36 Squidward Rd', 'South Brunswick', 'NJ', '08559'),
('0000000010','Jules Parra','N','2021-08-15', NULL, NULL, NULL, NULL, NULL),
('0000000011','Dominique Desmarattes','Y','2021-05-15','21', '44 Catan Way', 'Franklin', 'NJ', '08555'),
('0000000012','Hanish Mutyala','Y','2021-09-09','21', '47 Catan Way', 'Franklin', 'NJ', '08555'),
('0000000013','Bruce Wayne','Y','2021-05-09','19', '75 Vengeance Dr', 'South Brunswick', 'NJ', '08559'),
('0000000014','Clark Kent','Y','2021-01-09','16', '39 Hope Dr', 'Princeton', 'NJ', '08550'),
('0000000015','Diana Prince','Y','2021-06-26','18', '92 Themis Way', 'Princeton', 'NJ', '08550'),
('0000000016','Laurel Lance','Y','2021-04-26','19', '77 Capitulate Dr', 'Franklin', 'NJ', '08555'),
('0000000017','Oliver Queen','N',NULL, NULL, NULL, NULL, NULL, NULL),
('0000000018','Michael Ross','Y','2021-10-14','17', '56 Spector Dr', 'South Brunswick', 'NJ', '08559'),
('0000000019','Harvey Spector','Y','2021-11-11','18', '12 Schmoney Way', 'Princeton', 'NJ', '08550'),
('0000000020','Jessica Pearson','Y','2021-01-19','23', '99 Boss Lane', 'Franklin', 'NJ', '08555');

CREATE TABLE SuppliersProj( 
SupplierID CHAR(3) NOT NULL,
SupplierName VARCHAR(30),
DatePartnered DATE,
SupplierAddress VARCHAR(50),
SupplierCity VARCHAR(50),
SupplierState CHAR(2),
SupplierZip CHAR(5),
CONSTRAINT pk_SupplierID PRIMARY KEY(SupplierID));

INSERT INTO SuppliersProj VALUES('001','Wonderbread INC','2014-02-08','33 Wonder Way', 'Philadelphia', 'PA', '07430'),
('002','Queen Consolidated','2021-02-14','55 Arrow Rd', 'Starling', 'NY', '09457'),
('003','Wayne Tech','2015-06-20','55 Night Rd', 'Gotham', 'NY', '09457'),
('004','Parker Tech','2016-07-13','66 Fly Way', 'Gotham', 'NY', '09457');

CREATE TABLE GoodsProj( 
GoodID CHAR(3) NOT NULL,
GoodName VARCHAR(30), 
GoodPrice NUMERIC(6,2), 
CONSTRAINT pk_GoodID PRIMARY KEY(GoodID));

INSERT INTO GoodsProj VALUES('001','Bagel','5.99'),
('002','Apple Smoothie','8.99'),
('003', 'Orange Smoothie','7.99'),
('004', 'Buttered Toast','3.99'),
('005', 'Iced Coffee', '3.99'),
('006', 'Chocolate Chip Cookie', '2.99'),
('007', 'Mega Chocolate Chip Cookie', '4.99'),
('008', 'Oatmeal Raisin Cookie', '2.99'),
('009', 'Mega Oatmeal Raisin Cookie', '4.99'),
('010', 'Water Bottle', '1.99');

CREATE TABLE EquipmentProj( 
EquipmentID CHAR(3) NOT NULL,
SupplierID CHAR(3) NOT NULL,
EquipmentName VARCHAR(30),
DateInstalled DATE,
EquipmentPrice NUMERIC(9,2),
DateRetired Date, 
CONSTRAINT pk_EquipmentID PRIMARY KEY(EquipmentID),
CONSTRAINT f1k_SupplierID FOREIGN KEY(SupplierID) REFERENCES SuppliersProj(SupplierID));

INSERT INTO EquipmentProj VALUES
('001', '001','Bread Baker 5000','2014-02-14','1000.77', NULL),
('002', '001','Toaster 4375','2014-02-14','100.99', NULL),
('003', '001','Bagel Boiler 678','2014-02-28','545.99', NULL),
('004', '001','Flour Processor 999','2014-03-15','1500.80', NULL),
('005', '002','Smoothie-Matic 632','2016-06-29','345.99', NULL),
('006', '002','Fruit Peeler 444','2016-07-05','345.99', NULL),
('007', '003','Cookie Press 888','2017-12-04','150.60', NULL),
('008', '003','Cookie Rack 36','2017-12-10','55.45', NULL),
('009', '004','Freezer 47','2014-12-30','555.45', NULL);

CREATE TABLE IngredientsProj( 
IngredientID CHAR(3) NOT NULL,
SupplierID CHAR(3) NOT NULL,
IngredientName VARCHAR(30),
DatePurchased DATE,
DateDepleted DATE,
ExpirationDate Date,
IngredientQuantity Numeric(8,0),
CONSTRAINT pk_IngredientID PRIMARY KEY(IngredientID),
CONSTRAINT fk2_SupplierID FOREIGN KEY(SupplierID) REFERENCES SuppliersProj(SupplierID));

INSERT INTO IngredientsProj VALUES('001', '001','Wonderbread Flour','2022-02-08', NULL, '2022-03-08', '100'),
('002', '001','Wonderbread Eggs','2022-02-08', NULL, '2022-03-08', '100'),
('003', '002','Apples','2022-02-08', NULL, '2022-02-15', '100'),
('004', '002','Oranges','2022-02-08', NULL, '2022-02-15', '100'),
('005', '003','Chocolate Chips','2022-02-08', NULL, '2022-04-08', '1000'),
('006', '003','Oatmeal Raisens','2022-02-08', NULL, '2022-04-08', '1000'),
('007', '004','Salt','2022-02-08', NULL, '2024-04-08', '150'),
('008', '004','Pepper','2022-02-08', NULL, '2024-04-08', '150');

CREATE TABLE OrdersProj(
OrderID CHAR(10) NOT NULL, 
GoodID CHAR(3) NOT NULL, 
CustomerID CHAR(10) NOT NULL, 
OrderPrice NUMERIC(6,2), 
OrderDate DATETIME,
CONSTRAINT pk_OrderID PRIMARY KEY(OrderID),
CONSTRAINT fk_GoodID FOREIGN KEY(GoodID) REFERENCES GoodsProj(GoodID),
CONSTRAINT fk_CustomerID FOREIGN KEY(CustomerID) REFERENCES CustomersProj(CustomerID));

INSERT INTO OrdersProj VALUES('0000000001','001','0000000001','5.99','2022-02-08 13:00:00'),
('0000000002','007','0000000003','4.99','2022-03-16 15:00:00'),
('0000000003','004','0000000020','3.99','2022-08-16 14:00:00'),
('0000000004','009','0000000015','4.99','2022-09-16 18:00:00'),
('0000000005','003','0000000017','7.99','2022-04-16 13:00:00'),
('0000000006','010','0000000004','1.99','2022-03-16 12:00:00'),
('0000000007','004','0000000006','3.99','2022-08-16 15:00:00'),
('0000000008','002','0000000018','8.99','2022-07-16 12:00:00'),
('0000000009','006','0000000015','2.99','2022-06-16 19:00:00'),
('0000000010','004','0000000003','3.99','2022-07-16 14:00:00'),
('0000000011','005','0000000007','3.99','2022-04-16 13:00:00'),
('0000000012','008','0000000016','2.99','2022-09-16 16:00:00'),
('0000000013','004','0000000005','3.99','2022-10-16 14:00:00'),
('0000000014','002','0000000003','8.99','2022-01-16 17:00:00'),
('0000000015','001','0000000009','5.99','2022-12-16 13:00:00'),
('0000000016','009','0000000010','4.99','2022-04-16 12:00:00'),
('0000000017','002','0000000003','8.99','2022-08-16 11:00:00'),
('0000000018','007','0000000009','4.99','2022-02-16 13:00:00'),
('0000000019','009','0000000010','1.99','2022-06-16 11:00:00'),
('0000000020','010','0000000010','1.99','2022-07-16 14:00:00');

-- DML
SELECT * FROM CustomersProj;
SELECT * FROM SuppliersProj;
SELECT * FROM GoodsProj;
SELECT * FROM EquipmentProj;
SELECT * FROM IngredientsProj;
SELECT * FROM OrdersProj;

-- view: most popular summer products - Order frequency of goods ordered in the summer and their average prices
CREATE VIEW PopularSummerGoodsView
AS
SELECT g.GoodName, AVG(g.GoodPrice) AS AveragePrice, o.OrderDate
FROM GoodsProj g, OrdersProj o
WHERE g.GoodID = o.GoodID
GROUP BY o.GoodID, g.GoodName, o.OrderDate;

-- business rule #1: What's the frequency and average price of goods ordered in summer (June, July, August) 2021?
SELECT GoodName, COUNT(GoodName) AS NumberOrdered, AVG(AveragePrice) AS AveragePrice FROM PopularSummerGoodsView
WHERE OrderDate >= '2022-06-01' AND OrderDate <= '2022-08-31'
GROUP BY GoodName, AveragePrice
ORDER BY NumberOrdered DESC;

-- business rule #2: Which people became customers in summer 2021?
SELECT CustomerName, DateJoined
FROM CustomersProj
WHERE DateJoined >= '2021-06-01' AND DateJoined <= '2021-08-31'
ORDER BY DateJoined;

-- business rule #3: What are the top customers by number of orders so far this month (April 2022)?
SELECT c.CustomerName, COUNT(o.GoodID) as NumberOrders
FROM CustomersProj c, OrdersProj o
WHERE c.customerID = o.customerID
GROUP BY c.CustomerName, o.OrderDate
HAVING o.OrderDate >= '2022-04-01 13:00:00' AND o.OrderDate <= '2022-04-24 23:59:59';

-- business rule #4: What are the three suppliers with the longest relationship with Bagel Barn and Deli?
SELECT TOP 3 * FROM SuppliersProj
ORDER BY DatePartnered;

-- business rule #5: Which suppliers provided the top three highest quantities of ingredients?
SELECT DISTINCT TOP 3 s.SupplierName, i.IngredientQuantity
FROM SuppliersProj s, IngredientsProj i
WHERE s.SupplierID = i.SupplierID
ORDER BY i.IngredientQuantity DESC;

-- business rule #6: What equipments were installed over 5 years ago?
SELECT *
FROM EquipmentProj
WHERE DATEDIFF(YEAR, DateInstalled, GetDate()) >5
