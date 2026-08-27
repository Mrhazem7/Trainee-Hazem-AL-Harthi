<?php
require_once "functions.php";

$errors = [];
$successMessage = "";

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["submit"])) {
    $data = [
        "name"  => $_POST["name"]  ?? "",
        "email" => $_POST["email"] ?? "",
        "phone" => $_POST["phone"] ?? "",
        "age"   => $_POST["age"]   ?? "",
    ];

    $errors = validateRegistration($data);

    if (empty($errors)) {
        saveRecord($data);
        $successMessage = "تم تسجيلك بنجاح!";
        $data = ["name" => "", "email" => "", "phone" => "", "age" => ""]; 
    }
} else {
    $data = ["name" => "", "email" => "", "phone" => "", "age" => ""];
}


if (isset($_GET["delete"])) {
    deleteRecord((int) $_GET["delete"]);
    header("Location: index.php");
    exit;
}

$records = getRecords();
?>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <title>نموذج التسجيل</title>
    <style>
        * { box-sizing: border-box; }
        body {
            font-family: Arial, Tahoma, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 30px;
            color: #222;
        }
        .container {
            max-width: 700px;
            margin: 0 auto;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
        }
        .card {
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }
        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }
        .error {
            color: #d8000c;
            font-size: 13px;
            margin-top: 4px;
        }
        button {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #2c7be5;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #1a5fc0;
        }
        .success {
            background-color: #e6f9ec;
            color: #1b7a3d;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 15px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #eee;
            text-align: right;
            font-size: 14px;
        }
        th {
            background-color: #f0f2f5;
        }
        .delete-btn {
            color: #d8000c;
            text-decoration: none;
            font-weight: bold;
        }
        .empty {
            text-align: center;
            color: #888;
            padding: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>نموذج التسجيل</h1>

    <div class="card">
        <?php if ($successMessage): ?>
            <div class="success"><?= htmlspecialchars($successMessage) ?></div>
        <?php endif; ?>

        <form method="POST" action="index.php">
            <label>الاسم</label>
            <input type="text" name="name" value="<?= htmlspecialchars($data['name']) ?>">
            <?php if (isset($errors['name'])): ?>
                <div class="error"><?= htmlspecialchars($errors['name']) ?></div>
            <?php endif; ?>

            <label>البريد الإلكتروني</label>
            <input type="text" name="email" value="<?= htmlspecialchars($data['email']) ?>">
            <?php if (isset($errors['email'])): ?>
                <div class="error"><?= htmlspecialchars($errors['email']) ?></div>
            <?php endif; ?>

            <label>رقم الجوال</label>
            <input type="text" name="phone" value="<?= htmlspecialchars($data['phone']) ?>">
            <?php if (isset($errors['phone'])): ?>
                <div class="error"><?= htmlspecialchars($errors['phone']) ?></div>
            <?php endif; ?>

            <label>العمر</label>
            <input type="text" name="age" value="<?= htmlspecialchars($data['age']) ?>">
            <?php if (isset($errors['age'])): ?>
                <div class="error"><?= htmlspecialchars($errors['age']) ?></div>
            <?php endif; ?>

            <button type="submit" name="submit">تسجيل</button>
        </form>
    </div>

    <div class="card">
        <h2>السجلات المسجّلة (<?= count($records) ?>)</h2>

        <?php if (empty($records)): ?>
            <p class="empty">لا توجد سجلات بعد.</p>
        <?php else: ?>
            <table>
                <thead>
                <tr>
                    <th>#</th>
                    <th>الاسم</th>
                    <th>البريد الإلكتروني</th>
                    <th>الجوال</th>
                    <th>العمر</th>
                    <th>تاريخ التسجيل</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($records as $record): ?>
                    <tr>
                        <td><?= htmlspecialchars($record['id']) ?></td>
                        <td><?= htmlspecialchars($record['name']) ?></td>
                        <td><?= htmlspecialchars($record['email']) ?></td>
                        <td><?= htmlspecialchars($record['phone']) ?></td>
                        <td><?= htmlspecialchars($record['age']) ?></td>
                        <td><?= htmlspecialchars($record['created_at']) ?></td>
                        <td>
                            <a class="delete-btn" href="index.php?delete=<?= $record['id'] ?>"
                               onclick="return confirm('هل أنت متأكد من الحذف؟')">حذف</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        <?php endif; ?>
    </div>
</div>
</body>
</html>