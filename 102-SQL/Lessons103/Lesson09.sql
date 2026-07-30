CREATE DATABASE School;
USE School;
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(100),
    exam_result VARCHAR(20)
);
INSERT INTO students (id, name, course, exam_result) VALUES
(1, 'Ahmed', 'Math', 'Passed'),
(2, 'Sara', 'Physics', 'Failed'),
(3, 'Khalid', 'Chemistry', 'Passed');

CREATE VIEW passed_students AS
SELECT name, course, exam_result
FROM students
WHERE exam_result = 'Passed';

SELECT * FROM passed_students;