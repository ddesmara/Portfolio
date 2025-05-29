# Bagel Barn Database Design (SQL Portfolio Project)

Welcome to my SQL portfolio project, a database design and analysis case study for **Bagel Barn & Deli**, a local deli in Princeton, New Jersey.

---

## Agenda

1. **Planning Stage** – Background, Mission & Objectives  
2. **Design Stage** – ERD & Relational Schema  
3. **Analysis Stage** – SQL Queries  
4. **Visualization Stage** – Tableau Dashboards  
5. **Closing Statement**

---

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

---

## Design Stage

### Entity Relationship Diagram (ERD)

![Alt Text](relative/or/full/path/to/image.png)

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

---

## Analysis Stage – SQL Queries & Business Questions

### Sample Table Queries

- View all customers:  
  `SELECT * FROM Customers;`

- View all suppliers:  
  `SELECT * FROM Suppliers;`

- View all goods:  
  `SELECT * FROM Goods;`

- View all ingredients:  
  `SELECT * FROM Ingredients;`

- View all equipment:  
  `SELECT * FROM Equipment;`

- View all orders:  
  `SELECT * FROM Orders;`

---

### Business Analysis Statements

1. **What’s the frequency and average price of goods ordered in summer (June, July, August) 2022?**  
   `SELECT GoodName, COUNT(*) AS OrderCount, AVG(OrderPrice) AS AvgPrice  
   FROM Orders  
   JOIN Goods ON Orders.GoodID = Goods.GoodID  
   WHERE MONTH(OrderDate) IN (6, 7, 8) AND YEAR(OrderDate) = 2022  
   GROUP BY GoodName;`

2. **Which people became members in summer 2021?**  
   `SELECT * FROM Customers  
   WHERE MemberStatus = 'Yes'  
   AND MONTH(DateJoined) IN (6, 7, 8)  
   AND YEAR(DateJoined) = 2021;`

3. **What are the top customers by number of orders so far this month (April 2022)?**  
   `SELECT CustomerID, COUNT(*) AS TotalOrders  
   FROM Orders  
   WHERE MONTH(OrderDate) = 4 AND YEAR(OrderDate) = 2022  
   GROUP BY CustomerID  
   ORDER BY TotalOrders DESC  
   LIMIT 5;`

4. **What are the three suppliers with the longest relationship with Bagel Barn and Deli?**  
   `SELECT SupplierName, DatePartnered  
   FROM Suppliers  
   ORDER BY DatePartnered ASC  
   LIMIT 3;`

5. **Which suppliers provided the top 3 quantities of ingredients?**  
   `SELECT SupplierID, SUM(IngredientQuantity) AS TotalSupplied  
   FROM Ingredients  
   GROUP BY SupplierID  
   ORDER BY TotalSupplied DESC  
   LIMIT 3;`

6. **Which equipment were installed over 5 years ago?**  
   `SELECT EquipmentName, DateInstalled  
   FROM Equipment  
   WHERE DateInstalled <= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);`

---

## Tableau Visualization Stage

*Insert Tableau dashboards, links, or screenshots here.*

- **Goods Ordered** – Frequency & Average Price (Summer 2022)  
- **New Members** – Total People Joined (Summer 2021)  
- **Top Customers, Suppliers, and Goods** – Seasonal Trends  
- **Equipment Lifetime** – Age of Equipment Currently in Use  

---

## Closing Statement

The Bagel Barn database project demonstrates how structured relational databases and SQL queries can transform business operations in small food service environments.

Using SQL and Tableau, Bagel Barn can now:

- Track trends and identify seasonal changes in customer behavior  
- Optimize inventory management and prevent spoilage  
- Evaluate supplier effectiveness based on quantity and reliability  
- Gain insight into product performance  
- Improve decision-making across operations  

### Tools Used

- SQL (Microsoft SQL Server)  
- Relational Database Design  
- Tableau for Data Visualization  
- ERD & Schema Planning  

Thanks for reviewing this project! I hope you enjoyed the insights derived from Bagel Barns' data!
