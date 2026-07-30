USE Tamayoz_School;

CREATE TABLE Teacher_Student (
    teacher_id INT,
    student_id INT,
    PRIMARY KEY (teacher_id, student_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(id),
    FOREIGN KEY (student_id) REFERENCES Students(id)
);

ALTER TABLE Teachers
ADD COLUMN material_id INT;

ALTER TABLE Teachers
ADD FOREIGN KEY (material_id) REFERENCES Subjects(id);

CREATE TABLE Student_Subject (
    student_id INT,
    subject_id INT,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(id)
);

UPDATE Teachers SET material_id = 1 WHERE id = 1;   -- Mohammed  -> Mathematics
UPDATE Teachers SET material_id = 2 WHERE id = 2;   -- Aisha     -> Physics
UPDATE Teachers SET material_id = 3 WHERE id = 3;   -- Khalid    -> Chemistry
UPDATE Teachers SET material_id = 1 WHERE id = 4;   -- Nora      -> Mathematics 
UPDATE Teachers SET material_id = 4 WHERE id = 5;   -- Faisal    -> Arabic
UPDATE Teachers SET material_id = 5 WHERE id = 6;   -- Huda      -> English
UPDATE Teachers SET material_id = 6 WHERE id = 7;   -- Abdullah  -> Biology
UPDATE Teachers SET material_id = 2 WHERE id = 8;   -- Maha      -> Physics
UPDATE Teachers SET material_id = 3 WHERE id = 9;   -- Saad      -> Chemistry
UPDATE Teachers SET material_id = 5 WHERE id = 10;  -- Amal      -> English

INSERT INTO Teacher_Student (teacher_id, student_id) VALUES
(1, 1), (1, 2), (2, 1), (3, 3), (4, 4), (5, 5);

INSERT INTO Student_Subject (student_id, subject_id) VALUES
(1, 1), (1, 2), (2, 1), (2, 3), (3, 4), (3, 5);

DELIMITER //

CREATE PROCEDURE student_info()
BEGIN
    SELECT
        s.id               AS Student_ID,
        s.student_name     AS Student_Name,
        sub.id             AS Subject_ID,
        sub.material_name  AS Subject_Name
    FROM Students s
    INNER JOIN Student_Subject ss ON s.id = ss.student_id
    INNER JOIN Subjects sub ON ss.subject_id = sub.id;
END //

DELIMITER ;

CALL student_info();

CREATE VIEW teacher_info AS
SELECT
    t.teacher_name     AS Teacher_Name,
    t.office_number    AS Office_Number,
    sub.material_name  AS Subject_Name
FROM Teachers t
INNER JOIN Subjects sub ON t.material_id = sub.id;

SELECT * FROM teacher_info;

DROP VIEW teacher_info;

CREATE INDEX idx_student_name
ON Students (student_name);

SHOW INDEX FROM Students;

DROP INDEX idx_student_name
ON Students;
