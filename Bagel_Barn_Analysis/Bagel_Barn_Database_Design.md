# Bagel Barn Database Design (SQL Portfolio Project)


This project is a collaborative database design and analysis case study for **Bagel Barn & Deli**, a local deli in Princeton, New Jersey. As a team, we designed a relational database to track inventory, analyze order data, and generate actionable business insights. The project included developing an Entity Relationship Diagram (ERD), writing SQL queries for data analysis, and creating visualizations using Tableau.


## Agenda

1. **Planning Stage** – Background, Mission & Objectives  
2. **Design Stage** – ERD & Relational Schema  
3. **Analysis Stage** – SQL Queries  
4. **Visualization Stage** – Tableau Dashboards  
5. **Key Takeaways & Final Thoughts**


## Planning Stage

### Client Overview

**Bagel Barn & Deli** is a local business aiming to modernize its inventory and sales tracking. The goal is to develop a relational database to optimize internal decision-making.

### Mission Statement

The purpose of this database system is to track inventory and orders for Bagel Barn’s deli in Princeton, NJ.

It will help Bagel Barn:

- Identify seasonal sales trends  
- Update menu items based on popularity  
- Order inventory at optimal times to prevent spoilage  
- Decide which supplier partnerships to continue or end  
- Determine equipment upgrade timelines  
- Understand customer preferences

### Mission Objectives

- Create 6 key tables: `Orders`, `Customers`, `Suppliers`, `Goods`, `Ingredients`, and `Equipment`  
- Track inflow and outflow of ingredients and goods  
- Monitor supplier contributions  
- Track order frequency and item popularity  
- Report top 3 customers, goods, and suppliers (seasonal view)  
- Monitor average ingredient shelf life  


## Design Stage

### Entity Relationship Diagram (ERD)

![1](https://github.com/ddesmara/Portfolio/blob/766d15133b5494c517c89586bc71d6d27708365d/Bagel_Barn_Analysis/Images/ddbb_erd.png)

### Relational Schema

**Orders**  
`(OrderID, GoodID, CustomerID, OrderPrice, OrderDate)`

**Customers**  
`(CustomerID, CustomerName, MemberStatus, DateJoined, CustomerAge, CustomerAddress, CustomerCity, CustomerState, CustomerZip)`

**Suppliers**  
`(SupplierID, SupplierName, DatePartnered, SupplierAddress, SupplierCity, SupplierState, SupplierZip)`

**Goods**  
`(GoodID, GoodName, GoodPrice)`

**Ingredients**  
`(IngredientID, SupplierID, IngredientName, DatePurchased, DateDepleted, ExpirationDate, IngredientQuantity)`

**Equipment**  
`(EquipmentID, EquipmentName, SupplierID, DateInstalled, EquipmentPrice, DateRetired)`

![2](https://github.com/ddesmara/Portfolio/blob/aae579098e7493e1dbdbb025bc5c0942dbf4b421/Bagel_Barn_Analysis/Images/ddbb_relational_schema.png)


## Analysis Stage – SQL Queries & Business Questions

### SQL Table Creation (DDL)

```sql
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
```
![Customers Table](https://github.com/ddesmara/Portfolio/blob/aae579098e7493e1dbdbb025bc5c0942dbf4b421/Bagel_Barn_Analysis/Images/ddbb_customers_table.png)
```sql
CREATE TABLE SuppliersProj( 
SupplierID CHAR(3) NOT NULL,
SupplierName VARCHAR(30),
DatePartnered DATE,
SupplierAddress VARCHAR(50),
SupplierCity VARCHAR(50),
SupplierState CHAR(2),
SupplierZip CHAR(5),
CONSTRAINT pk_SupplierID PRIMARY KEY(SupplierID));
```
![Suppliers Table](https://github.com/ddesmara/Portfolio/blob/aae579098e7493e1dbdbb025bc5c0942dbf4b421/Bagel_Barn_Analysis/Images/ddbb_suppliers.png)
```sql
CREATE TABLE GoodsProj( 
GoodID CHAR(3) NOT NULL,
GoodName VARCHAR(30), 
GoodPrice NUMERIC(6,2), 
CONSTRAINT pk_GoodID PRIMARY KEY(GoodID));
```
![Goods Table](https://github.com/ddesmara/Portfolio/blob/aae579098e7493e1dbdbb025bc5c0942dbf4b421/Bagel_Barn_Analysis/Images/ddbb_goods.png)
```sql
CREATE TABLE EquipmentProj( 
EquipmentID CHAR(3) NOT NULL,
SupplierID CHAR(3) NOT NULL,
EquipmentName VARCHAR(30),
DateInstalled DATE,
EquipmentPrice NUMERIC(9,2),
DateRetired Date, 
CONSTRAINT pk_EquipmentID PRIMARY KEY(EquipmentID),
CONSTRAINT f1k_SupplierID FOREIGN KEY(SupplierID) REFERENCES SuppliersProj(SupplierID));
```
![Equipment Table](https://github.com/ddesmara/Portfolio/blob/aae579098e7493e1dbdbb025bc5c0942dbf4b421/Bagel_Barn_Analysis/Images/ddbb_equipment.png)
```sql
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
```
![Ingredients Table](https://github.com/ddesmara/Portfolio/blob/aae579098e7493e1dbdbb025bc5c0942dbf4b421/Bagel_Barn_Analysis/Images/ddbb_ingredients.png)
```sql
CREATE TABLE OrdersProj(
OrderID CHAR(10) NOT NULL, 
GoodID CHAR(3) NOT NULL, 
CustomerID CHAR(10) NOT NULL, 
OrderPrice NUMERIC(6,2), 
OrderDate DATETIME,
CONSTRAINT pk_OrderID PRIMARY KEY(OrderID),
CONSTRAINT fk_GoodID FOREIGN KEY(GoodID) REFERENCES GoodsProj(GoodID),
CONSTRAINT fk_CustomerID FOREIGN KEY(CustomerID) REFERENCES CustomersProj(CustomerID));
```
![Orders Table](https://github.com/ddesmara/Portfolio/blob/aae579098e7493e1dbdbb025bc5c0942dbf4b421/Bagel_Barn_Analysis/Images/ddbb_orders.png)


### Business Analysis Statements (DML)

1. **What’s the frequency and average price of goods ordered in the Summer (June, July, August) 2022?**  
```sql
SELECT GoodName, COUNT(GoodName) AS NumberOrdered, AVG(AveragePrice) AS AveragePrice FROM PopularSummerGoodsView
WHERE OrderDate >= '2022-06-01' AND OrderDate <= '2022-08-31'
GROUP BY GoodName, AveragePrice
ORDER BY NumberOrdered DESC;
```
![1](https://github.com/ddesmara/Portfolio/blob/aae579098e7493e1dbdbb025bc5c0942dbf4b421/Bagel_Barn_Analysis/Images/ddbb_goods_view_table.png)

2. **Which customers became members in summer 2021?**  
```sql
SELECT CustomerName, DateJoined
FROM CustomersProj
WHERE DateJoined >= '2021-06-01' AND DateJoined <= '2021-08-31'
ORDER BY DateJoined;
```
![2](https://github.com/ddesmara/Portfolio/blob/aae579098e7493e1dbdbb025bc5c0942dbf4b421/Bagel_Barn_Analysis/Images/ddbb_members_table.png)

3. **Who are the top customers by number of orders so far this month (April 2022)?**  
```sql
SELECT c.CustomerName, COUNT(o.GoodID) as NumberOrders
FROM CustomersProj c, OrdersProj o
WHERE c.customerID = o.customerID
GROUP BY c.CustomerName, o.OrderDate
HAVING o.OrderDate >= '2022-04-01 13:00:00' AND o.OrderDate <= '2022-04-24 23:59:59';
```
![3](https://github.com/ddesmara/Portfolio/blob/aae579098e7493e1dbdbb025bc5c0942dbf4b421/Bagel_Barn_Analysis/Images/ddbb_members_table.png)

5. **Who are the three suppliers with the longest relationship with Bagel Barn and Deli?**  
```sql
SELECT TOP 3 * FROM SuppliersProj
ORDER BY DatePartnered;
```
![4](https://github.com/ddesmara/Portfolio/blob/aae579098e7493e1dbdbb025bc5c0942dbf4b421/Bagel_Barn_Analysis/Images/ddbb_topsuppliers_table.png)

6. **Which suppliers provided the top 3 quantities of ingredients?**  
```sql
SELECT DISTINCT TOP 3 s.SupplierName, i.IngredientQuantity
FROM SuppliersProj s, IngredientsProj i
WHERE s.SupplierID = i.SupplierID
ORDER BY i.IngredientQuantity DESC;
```
![5](https://github.com/ddesmara/Portfolio/blob/aae579098e7493e1dbdbb025bc5c0942dbf4b421/Bagel_Barn_Analysis/Images/ddbb_topingred_table.png)

7. **What equipments were installed over 5 years ago?**  
```sql
SELECT *
FROM EquipmentProj
WHERE DATEDIFF(YEAR, DateInstalled, GetDate()) > 5
```
![6](https://github.com/ddesmara/Portfolio/blob/aae579098e7493e1dbdbb025bc5c0942dbf4b421/Bagel_Barn_Analysis/Images/ddbb_oldequip_table.png) 


## Tableau Visualization Stage

1. **Goods Ordered** – Frequency & Average Price (Summer 2022)

![7](https://github.com/ddesmara/SQL-Portfolio/blob/5bdde53894493cf99e2754802ad855d344ed2bd5/Bagel_Barn_Analysis/Images/ddbb_freq_tableau.png)

![8](https://github.com/ddesmara/SQL-Portfolio/blob/5bdde53894493cf99e2754802ad855d344ed2bd5/Bagel_Barn_Analysis/Images/ddbb_avg_tableau.png)
 
2. **New Members** – Total People Joined (Summer 2021)  

![9](https://github.com/ddesmara/SQL-Portfolio/blob/5bdde53894493cf99e2754802ad855d344ed2bd5/Bagel_Barn_Analysis/Images/ddbb_members_tableau.png)


## Key Takeaways & Final Thoughts

With the implementation of SQL and Tableau, Bagel Barn is now able to:

- Identify seasonal trends and shifts in customer behavior  
- Optimize inventory management and reduce food waste  
- Assess supplier performance based on quantity and consistency  
- Understand product popularity and sales performance  
- Make data-informed decisions across various aspects of the business  

Through this project, our team gained hands-on experience in end-to-end database development, from data modeling and SQL querying to translating insights into meaningful visualizations. The analysis supports Bagel Barn’s operational goals while demonstrating the power of data to inform decisions around menu planning, supplier relationships, and resource allocation.

