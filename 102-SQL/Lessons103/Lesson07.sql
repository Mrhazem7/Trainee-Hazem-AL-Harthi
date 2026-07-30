USE company;

CREATE TABLE Company_Info (
    CompanyID INT PRIMARY KEY,
    Company_Name VARCHAR(100)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    CompanyID INT
);

INSERT INTO Company_Info (CompanyID, Company_Name) VALUES
(1, 'Apple'),
(2, 'Samsung');

INSERT INTO Product (ProductID, Product_Name, CompanyID) VALUES
(1, 'iPhone', 1),
(2, 'Galaxy', 2);

SELECT Company_Name, Product_Name
FROM Company_Info
NATURAL JOIN Product;