SELECT Customers. CustomerName, Orders. OrderID, Orders. Amount
FROM Customers
INNER JOIN Orders
on Customers.CustomerID = Orders.CustomerID;