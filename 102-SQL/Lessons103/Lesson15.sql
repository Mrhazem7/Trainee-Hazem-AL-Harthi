USE company;
DELIMITER //
CREATE PROCEDURE display_employee()
BEGIN
SELECT * FROM Employee;
END