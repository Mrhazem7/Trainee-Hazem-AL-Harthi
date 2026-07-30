-- مشروع SQL — المستوى الثاني (مكمّل للمستوى الأول)
-- قاعدة البيانات: Tamayoz_School

USE Tamayoz_School;

-- 1) إنشاء جدول للطلاب المتفوقين (معدل تراكمي أعلى من 90)

CREATE TABLE TopStudents AS
SELECT *
FROM Students
WHERE gpa > 90;

SELECT * FROM TopStudents;

-- 2) إنشاء جدول للطلاب الغير مجتازين (معدل تراكمي أقل من 60)

CREATE TABLE FailingStudents AS
SELECT *
FROM Students
WHERE gpa < 60;

SELECT * FROM FailingStudents;

-- 3) عرض أسماء الطلاب التي تبدأ بحرف A

SELECT student_name
FROM Students
WHERE student_name LIKE 'A%';

-- 4) عرض أسماء الطلاب التي تتكون من 4 خانات (أحرف) بالضبط

SELECT student_name
FROM Students
WHERE CHAR_LENGTH(student_name) = 4;

-- 5) تطبيق دوال تجميعية (AVG, MAX, MIN) على المعدل التراكمي
--    مع إعطاء تسمية واضحة للناتج

SELECT
    AVG(gpa) AS Average_GPA,
    MAX(gpa) AS Highest_GPA,
    MIN(gpa) AS Lowest_GPA
FROM Students;

-- 6) عرض أسماء الطلاب المتفوقين في المستوى السادس
--    الحاصلين على معدل تراكمي يساوي 100

SELECT student_name
FROM Students
WHERE level = 6 AND gpa = 100;

-- 7) عرض الطلاب في المستوى الأول وأعمارهم بين 15 و16 سنة

SELECT
    student_name,
    TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS Age
FROM Students
WHERE level = 1
  AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 15 AND 16;

-- 8) عرض عدد الطلاب الموجودين في المستوى 2

SELECT COUNT(*) AS Students_In_Level_2
FROM Students
WHERE level = 2;

-- 9) استعراض مسارات الطلاب في المدرسة بدون تكرار

SELECT DISTINCT track
FROM Students;

-- 10) عرض أسماء المواد بالأحرف الكبيرة

SELECT UPPER(material_name) AS Material_Name
FROM Subjects;

-- 11) عرض المتوسط الحسابي للمعدل التراكمي وتقريبه لأقرب عدد صحيح

SELECT ROUND(AVG(gpa)) AS Rounded_Average_GPA
FROM Students;

-- 12) تبديل قيم الجنس: Female إلى F و Male إلى M (باستخدام دوال النصوص)

UPDATE Students
SET gender = REPLACE(gender, 'Female', 'F');

UPDATE Students
SET gender = REPLACE(gender, 'Male', 'M');

-- 13) تحديث المعدل التراكمي للطلاب الذين معدلهم أقل من 60
--     بزيادة 5 درجات

UPDATE Students
SET gpa = gpa + 5
WHERE gpa < 60;
