<?php

$students = ["Ali", "Norah", "Ahmad", "Khalid", "Sarah", "Reem", "Deema", "Mohammed", "Abdullah", "Hazem"];

echo "1. print Array\n";
echo "2. Delete\n";
echo "3. Update\n";
echo "4. Add\n";
echo "5. count\n";
$choice = (int) readline("Enter your choice: ");

switch ($choice) {
    case 1:
        foreach ($students as $student) {
            echo $student . "\n";
        }
        break;

    case 2:
        $index = (int) readline("Enter the Index: ");
        unset($students[$index]);
        print_r($students);
        break;

    case 3:
        $index = (int) readline("Enter the Index: ");
        $newValue = readline("Enter new value: ");
        $students[$index] = $newValue;
        print_r($students);
        break;

    case 4:
        $value = readline("Enter value: ");
        $students[] = $value;
        print_r($students);
        break;

    case 5:
        echo count($students);
        break;

    default:
        echo "invaild number";
}