USE company;

CREATE TABLE Sizes (
    SizeID INT PRIMARY KEY,
    SizeName VARCHAR(20)
);

CREATE TABLE Colors (
    ColorID INT PRIMARY KEY,
    ColorName VARCHAR(20)
);

INSERT INTO Sizes (SizeID, SizeName) VALUES
(1, 'Small'),
(2, 'Medium'),
(3, 'Large');

INSERT INTO Colors (ColorID, ColorName) VALUES
(1, 'Red'),
(2, 'Blue'),
(3, 'Green');

SELECT Colors.ColorName, Sizes.SizeName
FROM Sizes
CROSS JOIN Colors;