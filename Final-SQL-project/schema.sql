CREATE DATABASE IF NOT EXISTS SmallStore;
USE SmallStore;

CREATE TABLE Customers (
    customer_id  INT AUTO_INCREMENT PRIMARY KEY,
    full_name    VARCHAR(100) NOT NULL,
    email        VARCHAR(100) UNIQUE,
    phone        VARCHAR(20),
    address      VARCHAR(255)
);

CREATE TABLE Products (
    product_id      INT AUTO_INCREMENT PRIMARY KEY,
    product_name    VARCHAR(100) NOT NULL,
    price           DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stock_quantity  INT NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0)
);

CREATE TABLE Orders (
    order_id     INT AUTO_INCREMENT PRIMARY KEY,
    customer_id  INT NOT NULL,
    order_date   DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE Order_Details (
    order_id    INT NOT NULL,
    product_id  INT NOT NULL,
    quantity    INT NOT NULL CHECK (quantity > 0),
    unit_price  DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE INDEX idx_customer_email
ON Customers (email);

DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN p_customer_id INT)
BEGIN
    SELECT
        o.order_id,
        o.order_date,
        p.product_name,
        od.quantity,
        od.unit_price,
        (od.quantity * od.unit_price) AS line_total
    FROM Orders o
    INNER JOIN Order_Details od ON o.order_id = od.order_id
    INNER JOIN Products p ON od.product_id = p.product_id
    WHERE o.customer_id = p_customer_id
    ORDER BY o.order_id;
END //

DELIMITER ;
