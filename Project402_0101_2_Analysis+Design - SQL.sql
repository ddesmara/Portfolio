USE BMGT402_DB_Student_110

DROP TABLE OrdersProj;
DROP TABLE GoodsProj;
DROP TABLE IngredientsProj;
DROP TABLE EquipmentProj;
DROP TABLE SuppliersProj;
DROP TABLE CustomersProj;

CREATE TABLE CustomersProj( 
CustomerID CHAR(10) NOT NULL,
CustomerName VARCHAR(30),
MemberStatus CHAR(1),
DateJoined DATE ,
CustomerAge VARCHAR(3),
CustomerAddress VARCHAR(50),
CustomerCity VARCHAR(50),
CustomerState CHAR(2),
CustomerZip CHAR(5),
CONSTRAINT pk_CustomerID PRIMARY KEY(CustomerID));

INSERT INTO CustomersProj VALUES('0000000001','Arshdeep Singh','Y','2020-02-08','22', '47 Dunn Way', 'Princeton', 'NJ', '08550');

CREATE TABLE SuppliersProj( 
SupplierID CHAR(3) NOT NULL,
SupplierName VARCHAR(30),
DatePartnered DATE,
SupplierAddress VARCHAR(50),
SupplierCity VARCHAR(50),
SupplierState CHAR(2),
SupplierZip CHAR(5),
CONSTRAINT pk_SupplierID PRIMARY KEY(SupplierID));

INSERT INTO SuppliersProj VALUES('001','Wonderbread INC','2020-02-08','33 Wonder Way', 'Philadelphia', 'PA', '07430');

CREATE TABLE EquipmentProj( 
EquipmentID CHAR(3) NOT NULL,
SupplierID CHAR(3) NOT NULL,
EquipmentName VARCHAR(30),
DateInstalled DATE,
EquipmentPrice NUMERIC(9,2),
DateRetired Date, 
CONSTRAINT pk_EquipmentID PRIMARY KEY(EquipmentID),
CONSTRAINT f1k_SupplierID FOREIGN KEY(SupplierID) REFERENCES SuppliersProj(SupplierID));

INSERT INTO EquipmentProj VALUES('001', '001','Bread Baker 5000','2020-02-08','1000.77', NULL);

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

INSERT INTO IngredientsProj VALUES('001', '001','Wonderbread Flour','2020-02-08', NULL, '2021-02-08', '100'),
('002', '001','Wonderbread Eggs','2020-02-08', NULL, '2022-03-08', '100');

CREATE TABLE GoodsProj( 
GoodID CHAR(3) NOT NULL,
IngredientID CHAR(3) NOT NULL,
GoodName VARCHAR(30), 
GoodPrice NUMERIC(6,2), 
CONSTRAINT pk_GoodID PRIMARY KEY(GoodID),
CONSTRAINT fk_IngredientID FOREIGN KEY(IngredientID) REFERENCES IngredientsProj(IngredientID));

INSERT INTO GoodsProj VALUES('001','002','Bagel','5.99');

CREATE TABLE OrdersProj(
OrderID CHAR(10) NOT NULL, 
GoodID CHAR(3) NOT NULL, 
CustomerID CHAR(10) NOT NULL, 
OrderPrice NUMERIC(6,2), 
OrderDate DATETIME,
CONSTRAINT pk_OrderID PRIMARY KEY(OrderID),
CONSTRAINT fk_GoodID FOREIGN KEY(GoodID) REFERENCES GoodsProj(GoodID),
CONSTRAINT fk_CustomerID FOREIGN KEY(CustomerID) REFERENCES CustomersProj(CustomerID));

INSERT INTO OrdersProj VALUES('0000000001','001','0000000001','5.99','2022-02-08 13:00:00');

SELECT * FROM OrdersProj;
SELECT * FROM CustomersProj;
SELECT * FROM SuppliersProj;
SELECT * FROM GoodsProj;
SELECT * FROM IngredientsProj;
SELECT * FROM EquipmentProj;






