CREATE TABLE Students (
StudentID INT Primary Key,
StudentName varchar(50),
DepartmentID INT,
foreign key (DepartmentID) references Departments (DepartmentID)
);