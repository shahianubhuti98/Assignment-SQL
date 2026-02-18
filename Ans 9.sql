create database ECommerceDB;
USE ECommerceDB;
CREATE TABLE Categories (
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(50) NOT NULL UNIQUE);
CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100) NOT NULL UNIQUE,
CategoryID INT,
Price DECIMAL(10,2) NOT NULL,
StockQuantity INT,
 FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID));
 create table Customers (
 CustomerID INT PRIMARY KEY,
 CustomerName VARCHAR(100) NOT NULL,
 Email VARCHAR(100) UNIQUE,
 JoinDate DATE);
INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Home Goods'),
(4, 'Apparel');
Insert into Customers values
(1, 'Alice Wonderland', 'alice@example.com', '2023-01-10'),
(2, 'Bob the Builder', 'bob@example.com', '2022-11-25'),
(3, 'Charlie Chaplin', 'charlie@example.com', '2023-03-01'),
(4, 'Diana Prince', 'diana@example.com', '2021-04-26');
insert into Orders values
(1001, 1, '2023-04-26', 1245.50),
(1002, 2, '2023-10-12', 99.99),
(1003, 1, '2023-07-01', 145.00),
(1004, 3, '2023-01-14', 150.00),
(1005, 2, '2023-09-24', 120.00),
(1006, 1, '2023-06-19', 20.00);
SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Customers;
SELECT * FROM Orders;

Select * From Customers;
Select * From Orders:


SELECT 
    c.CustomerName,
    c.Email,
    COUNT(o.OrderID) AS TotalNumberOfOrders
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerID,
    c.CustomerName,
    c.Email;
    
 SELECT 
    p.ProductName,
    p.Price,
    p.StockQuantity,
    c.CategoryName
FROM Products p
INNER JOIN Categories c
    ON p.CategoryID = c.CategoryID
ORDER BY 
    c.CategoryName ASC,
    p.ProductName ASC;
WITH RankedProducts AS (
    SELECT 
        c.CategoryName,
        p.ProductName,
        p.Price,
        ROW_NUMBER() OVER (
            PARTITION BY c.CategoryName
            ORDER BY p.Price DESC
        ) AS rn
    FROM Products p
    INNER JOIN Categories c
        ON p.CategoryID = c.CategoryID
)

SELECT 
    CategoryName,
    ProductName,
    Price
FROM RankedProducts
WHERE rn <= 2
ORDER BY CategoryName, Price DESC;









 


 
