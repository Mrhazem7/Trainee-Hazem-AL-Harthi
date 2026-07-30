USE SmallStore;

INSERT INTO Customers (full_name, email, phone, address) VALUES
('عبدالله المطيري', 'abdullah@example.com', '0501111111', 'جدة'),
('فاطمة الزهراني',  'fatima@example.com',  '0502222222', 'الرياض'),
('سلطان القحطاني',  'sultan@example.com',  '0503333333', 'الدمام'),
('نورة الحربي',     'noura@example.com',   '0504444444', 'جدة'),
('يوسف العتيبي',    'yousef@example.com',  '0505555555', 'مكة'),
('ريم الشهري',      'reem@example.com',    '0506666666', 'الرياض'),
('ماجد الدوسري',    'majed@example.com',   '0507777777', 'جدة'),
('هدى الغامدي',     'huda@example.com',    '0508888888', 'الطائف');

INSERT INTO Products (product_name, price, stock_quantity) VALUES
('قلم حبر',        5.00,   100),
('دفتر ملاحظات',   12.00,  80),
('شاحن هاتف',      45.00,  50),
('سماعات أذن',     89.00,  40),
('ماوس لاسلكي',    60.00,  60),
('لوحة مفاتيح',    120.00, 30),
('حقيبة ظهر',      150.00, 25),
('زجاجة مياه',     25.00,  70),
('ساعة يد',        300.00, 15),
('نظارة شمسية',    180.00, 20),
('كوب قهوة',       20.00,  90),
('مصباح مكتب',     95.00,  35);

INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2026-01-05'),
(2, '2026-01-06'),
(1, '2026-01-10'),
(3, '2026-01-12'),
(4, '2026-01-15'),
(5, '2026-01-16'),
(2, '2026-01-18'),
(6, '2026-01-20'),
(7, '2026-01-22'),
(1, '2026-01-25'),
(8, '2026-01-27'),
(3, '2026-01-29'),
(4, '2026-02-01'),
(5, '2026-02-03'),
(6, '2026-02-05');

INSERT INTO Order_Details (order_id, product_id, quantity, unit_price) VALUES
(1, 3, 1, 45.00), (1, 8, 2, 25.00),
(2, 2, 3, 12.00),
(3, 5, 1, 60.00), (3, 4, 1, 89.00),
(4, 1, 5, 5.00),
(5, 7, 1, 150.00),
(6, 9, 1, 300.00),
(7, 6, 1, 120.00), (7, 11, 2, 20.00),
(8, 10, 1, 180.00),
(9, 12, 1, 95.00), (9, 2, 1, 12.00),
(10, 3, 2, 45.00),
(11, 4, 2, 89.00),
(12, 1, 10, 5.00),
(13, 8, 1, 25.00), (13, 11, 1, 20.00),
(14, 9, 1, 300.00), (14, 7, 1, 150.00),
(15, 5, 2, 60.00);

SELECT
    o.order_id,
    c.full_name AS Customer_Name,
    o.order_date
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date;

SELECT
    o.order_id,
    p.product_name AS Product_Name,
    od.quantity,
    od.unit_price,
    (od.quantity * od.unit_price) AS Line_Total
FROM Orders o
INNER JOIN Order_Details od ON o.order_id = od.order_id
INNER JOIN Products p ON od.product_id = p.product_id
ORDER BY o.order_id;

SELECT
    c.full_name AS Customer_Name,
    SUM(od.quantity * od.unit_price) AS Total_Spent
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Order_Details od ON o.order_id = od.order_id
GROUP BY c.full_name
ORDER BY Total_Spent DESC;

SELECT
    p.product_name AS Product_Name,
    COUNT(od.order_id) AS Times_Ordered,
    SUM(od.quantity) AS Total_Quantity_Sold
FROM Products p
INNER JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY Total_Quantity_Sold DESC;

SELECT
    c.full_name AS Customer_Name,
    ROUND(AVG(order_totals.order_total), 2) AS Average_Order_Value
FROM Customers c
INNER JOIN (
    SELECT
        o.order_id,
        o.customer_id,
        SUM(od.quantity * od.unit_price) AS order_total
    FROM Orders o
    INNER JOIN Order_Details od ON o.order_id = od.order_id
    GROUP BY o.order_id, o.customer_id
) AS order_totals ON c.customer_id = order_totals.customer_id
GROUP BY c.full_name
ORDER BY Average_Order_Value DESC;

CALL GetCustomerOrders(1);
