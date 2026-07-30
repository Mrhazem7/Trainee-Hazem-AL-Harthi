
-- مشروع: قاعدة بيانات مدرسة "التميز" للتعليم الثانوي
-- الوصف: قاعدة بيانات مركزية تضم بيانات الطلاب والمعلمين والمواد

-- 1) إنشاء قاعدة البيانات

CREATE DATABASE Tamayoz_School;

-- تحديد قاعدة البيانات التي سنعمل عليها
USE Tamayoz_School;

-- 2) إنشاء الجداول

-- جدول الطلاب
CREATE TABLE Students (
    id INT PRIMARY KEY,                 -- الرقم التسلسلي للطالب
    student_name VARCHAR(100),          -- اسم الطالب
    birth_date DATE,                    -- تاريخ الميلاد
    gender CHAR(1),                     -- جنس الطالب (M أو F)
    enrollment_date DATE,               -- تاريخ الالتحاق
    email VARCHAR(100),                 -- البريد الإلكتروني للطالب
    level INT,                          -- المستوى الدراسي (1 إلى 6)
    track VARCHAR(20),                  -- المسار (علمي أو انساني)
    gpa DECIMAL(5,2)                    -- المعدل التراكمي (من 100)
);

-- جدول المعلمين
CREATE TABLE Teachers (
    id INT PRIMARY KEY,                 -- الرقم التسلسلي للمعلم
    teacher_name VARCHAR(100),          -- اسم المعلم
    birth_date DATE,                    -- تاريخ الميلاد
    gender CHAR(1),                     -- جنس المعلم (M أو F)
    email VARCHAR(100),                 -- البريد الإلكتروني للمعلم
    office_number VARCHAR(20)           -- رقم المكتب الخاص به
);

-- جدول المواد
CREATE TABLE Materials (
    id INT PRIMARY KEY,                 -- الرقم التسلسلي للمادة
    material_name VARCHAR(100)          -- اسم المادة
);


-- 3) عرض الجداول المتاحة في قاعدة البيانات

SHOW TABLES;

-- 4) إدخال بيانات 30 طالب كحد أدنى

INSERT INTO Students (id, student_name, birth_date, gender, enrollment_date, email, level, track, gpa) VALUES
(1,  'Ahmed Khalid',      '2008-03-12', 'M', '2023-09-01', 'ahmed.khalid1@tamayoz.edu',      1, 'علمي',   88.50),
(2,  'Sara Nasser',       '2007-11-05', 'F', '2022-09-01', 'sara.nasser2@tamayoz.edu',       2, 'انساني', 91.20),
(3,  'Khalid Fahad',      '2006-01-20', 'M', '2021-09-01', 'khalid.fahad3@tamayoz.edu',      3, 'علمي',   76.40),
(4,  'Nouf Saad',         '2008-07-30', 'F', '2023-09-01', 'nouf.saad4@tamayoz.edu',         1, 'انساني', 95.00),
(5,  'Faisal Omar',       '2007-09-15', 'M', '2022-09-01', 'faisal.omar5@tamayoz.edu',       2, 'علمي',   82.30),
(6,  'Lama Abdullah',     '2006-04-22', 'F', '2021-09-01', 'lama.abdullah6@tamayoz.edu',     3, 'علمي',   89.10),
(7,  'Yousef Saleh',      '2005-12-01', 'M', '2020-09-01', 'yousef.saleh7@tamayoz.edu',      4, 'انساني', 79.60),
(8,  'Reem Turki',        '2005-06-18', 'F', '2020-09-01', 'reem.turki8@tamayoz.edu',        4, 'علمي',   93.75),
(9,  'Abdulaziz Nasser',  '2004-08-09', 'M', '2019-09-01', 'abdulaziz.nasser9@tamayoz.edu',  5, 'علمي',   85.00),
(10, 'Haifa Mohammed',    '2004-02-27', 'F', '2019-09-01', 'haifa.mohammed10@tamayoz.edu',   5, 'انساني', 90.40),
(11, 'Bandar Ali',        '2003-10-14', 'M', '2018-09-01', 'bandar.ali11@tamayoz.edu',       6, 'علمي',   87.20),
(12, 'Jawaher Saud',      '2003-05-03', 'F', '2018-09-01', 'jawaher.saud12@tamayoz.edu',     6, 'انساني', 94.60),
(13, 'Meshal Fahad',      '2008-01-11', 'M', '2023-09-01', 'meshal.fahad13@tamayoz.edu',     1, 'علمي',   70.10),
(14, 'Dana Khalid',       '2007-03-25', 'F', '2022-09-01', 'dana.khalid14@tamayoz.edu',      2, 'علمي',   88.90),
(15, 'Turki Saad',        '2006-09-19', 'M', '2021-09-01', 'turki.saad15@tamayoz.edu',       3, 'انساني', 81.30),
(16, 'Alanoud Omar',      '2008-11-08', 'F', '2023-09-01', 'alanoud.omar16@tamayoz.edu',     1, 'انساني', 96.20),
(17, 'Sultan Nasser',     '2007-06-02', 'M', '2022-09-01', 'sultan.nasser17@tamayoz.edu',    2, 'علمي',   84.50),
(18, 'Munira Hamad',      '2006-12-17', 'F', '2021-09-01', 'munira.hamad18@tamayoz.edu',     3, 'انساني', 92.80),
(19, 'Rayan Abdullah',    '2005-04-29', 'M', '2020-09-01', 'rayan.abdullah19@tamayoz.edu',   4, 'علمي',   77.90),
(20, 'Wateen Saleh',      '2005-08-13', 'F', '2020-09-01', 'wateen.saleh20@tamayoz.edu',     4, 'انساني', 90.00),
(21, 'Fahad Turki',       '2004-01-06', 'M', '2019-09-01', 'fahad.turki21@tamayoz.edu',      5, 'علمي',   86.60),
(22, 'Ghala Nasser',      '2004-07-21', 'F', '2019-09-01', 'ghala.nasser22@tamayoz.edu',     5, 'انساني', 91.50),
(23, 'Nawaf Ali',         '2003-03-09', 'M', '2018-09-01', 'nawaf.ali23@tamayoz.edu',        6, 'علمي',   83.40),
(24, 'Shatha Saud',       '2003-09-16', 'F', '2018-09-01', 'shatha.saud24@tamayoz.edu',      6, 'انساني', 95.70),
(25, 'Hamad Fahad',       '2008-02-04', 'M', '2023-09-01', 'hamad.fahad25@tamayoz.edu',      1, 'علمي',   75.20),
(26, 'Rand Khalid',       '2007-10-23', 'F', '2022-09-01', 'rand.khalid26@tamayoz.edu',      2, 'انساني', 89.30),
(27, 'Saud Nasser',       '2006-06-30', 'M', '2021-09-01', 'saud.nasser27@tamayoz.edu',      3, 'علمي',   80.10),
(28, 'Joud Omar',         '2008-08-05', 'F', '2023-09-01', 'joud.omar28@tamayoz.edu',        1, 'انساني', 97.40),
(29, 'Majed Saleh',       '2007-01-27', 'M', '2022-09-01', 'majed.saleh29@tamayoz.edu',      2, 'علمي',   78.80),
(30, 'Layan Turki',       '2006-11-11', 'F', '2021-09-01', 'layan.turki30@tamayoz.edu',      3, 'انساني', 93.10);

-- 5) إدخال بيانات 10 معلمين كحد أدنى

INSERT INTO Teachers (id, teacher_name, birth_date, gender, email, office_number) VALUES
(1,  'Mohammed Al-Ghamdi', '1980-05-14', 'M', 'mohammed.ghamdi1@tamayoz.edu', '101'),
(2,  'Aisha Al-Otaibi',    '1985-03-22', 'F', 'aisha.otaibi2@tamayoz.edu',    '102'),
(3,  'Khalid Al-Harbi',    '1978-11-09', 'M', 'khalid.harbi3@tamayoz.edu',    '103'),
(4,  'Nora Al-Qahtani',    '1982-07-30', 'F', 'nora.qahtani4@tamayoz.edu',    '104'),
(5,  'Faisal Al-Zahrani',  '1975-01-15', 'M', 'faisal.zahrani5@tamayoz.edu',  '105'),
(6,  'Huda Al-Shahri',     '1988-09-02', 'F', 'huda.shahri6@tamayoz.edu',     '106'),
(7,  'Abdullah Al-Dosari', '1979-04-18', 'M', 'abdullah.dosari7@tamayoz.edu', '107'),
(8,  'Maha Al-Anazi',      '1983-12-25', 'F', 'maha.anazi8@tamayoz.edu',      '108'),
(9,  'Saad Al-Mutairi',    '1976-06-06', 'M', 'saad.mutairi9@tamayoz.edu',    '109'),
(10, 'Amal Al-Subaie',     '1986-02-11', 'F', 'amal.subaie10@tamayoz.edu',    '110');

-- 6) إدخال بيانات 6 مواد كحد أدنى

INSERT INTO Materials (id, material_name) VALUES
(1, 'Mathematics'),
(2, 'Physics'),
(3, 'Chemistry'),
(4, 'Arabic'),
(5, 'English'),
(6, 'Biology');

-- 7) عرض محتويات جميع الجداول

SELECT * FROM Students;
SELECT * FROM Teachers;
SELECT * FROM Materials;

-- 8) عرض محتويات جدول الطلاب مع ترتيب الصفوف تصاعديًا حسب اسم الطالب

SELECT * FROM Students
ORDER BY student_name ASC;

-- 9) عرض محتويات جدول الطلاب مع إعطاء اسم مستعار لحقل "اسم الطالب"

SELECT
    id,
    student_name AS Name,   -- اختصار اسم العمود إلى "Name"
    email,
    level,
    track,
    gpa
FROM Students;

-- 10) التعديل على البيانات

-- تعديل بيانات أحد الطلاب: تغيير البريد الإلكتروني للطالب صاحب id = 1
UPDATE Students
SET email = 'ahmed.khalid.new@tamayoz.edu'
WHERE id = 1;

-- تعديل بيانات أحد المعلمين: تغيير رقم المكتب الخاص به للمعلم صاحب id = 1
UPDATE Teachers
SET office_number = '201'
WHERE id = 1;

-- 11) التعديل على الجداول

-- مثال: إضافة عمود جديد لجدول الطلاب (رقم الجوال)
ALTER TABLE Students
ADD COLUMN phone_number VARCHAR(15);

-- تعديل اسم أحد الجداول: تغيير اسم جدول Materials إلى Subjects
ALTER TABLE Materials
RENAME TO Subjects;
