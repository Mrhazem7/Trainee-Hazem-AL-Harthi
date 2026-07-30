SELECT Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;