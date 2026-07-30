USE School ;
CREATE VIEW passed_students
AS
SELECT name , course, exam_result
FROM students
WHERE exam_result = "Passed";