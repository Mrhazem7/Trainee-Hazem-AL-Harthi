USE company;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Ahmed'),
(2, 'Sara'),
(3, 'Khalid');

INSERT INTO Orders (OrderID, CustomerID, Amount) VALUES
(101, 1, 250.00),
(102, 2, 400.50),
(103, 1, 120.00);

SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;