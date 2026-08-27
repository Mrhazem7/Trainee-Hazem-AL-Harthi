<?php

define("DATA_FILE", __DIR__ . "/data/registrations.json");

function validateName($name)
{
    $name = trim($name);
    if (empty($name)) {
        return "الاسم مطلوب.";
    }
    if (!preg_match("/^[a-zA-Z\x{0600}-\x{06FF}\s]+$/u", $name)) {
        return "الاسم يجب أن يحتوي على حروف فقط.";
    }
    return true;
}

function validateEmail($email)
{
    $email = trim($email);
    if (empty($email)) {
        return "البريد الإلكتروني مطلوب.";
    }
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return "صيغة البريد الإلكتروني غير صحيحة.";
    }
    return true;
}

function validatePhone($phone)
{
    $phone = trim($phone);
    if (empty($phone)) {
        return "رقم الجوال مطلوب.";
    }
    if (!preg_match("/^[0-9]{8,15}$/", $phone)) {
        return "رقم الجوال يجب أن يحتوي على أرقام فقط (8-15 رقم).";
    }
    return true;
}

function validateAge($age)
{
    $age = trim($age);
    if (empty($age)) {
        return "العمر مطلوب.";
    }
    if (!is_numeric($age) || $age < 1 || $age > 120) {
        return "العمر يجب أن يكون رقمًا بين 1 و120.";
    }
    return true;
}

function validateRegistration($data)
{
    $errors = [];

    $nameCheck = validateName($data['name']);
    if ($nameCheck !== true) {
        $errors['name'] = $nameCheck;
    }

    $emailCheck = validateEmail($data['email']);
    if ($emailCheck !== true) {
        $errors['email'] = $emailCheck;
    }

    $phoneCheck = validatePhone($data['phone']);
    if ($phoneCheck !== true) {
        $errors['phone'] = $phoneCheck;
    }

    $ageCheck = validateAge($data['age']);
    if ($ageCheck !== true) {
        $errors['age'] = $ageCheck;
    }

    return $errors;
}

function getRecords()
{
    if (!file_exists(DATA_FILE)) {
        return [];
    }

    $content = file_get_contents(DATA_FILE);
    $records = json_decode($content, true);

    if (!is_array($records)) {
        return [];
    }

    return $records;
}

function saveRecord($record)
{
    $records = getRecords();

    $record['id'] = count($records) > 0 ? end($records)['id'] + 1 : 1;
    $record['created_at'] = date("Y-m-d H:i:s");

    $records[] = $record;

    file_put_contents(DATA_FILE, json_encode($records, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));

    return true;
}

function deleteRecord($id)
{
    $records = getRecords();

    $newRecords = [];
    foreach ($records as $record) {
        if ($record['id'] != $id) {
            $newRecords[] = $record;
        }
    }

    file_put_contents(DATA_FILE, json_encode($newRecords, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));

    return true;
}