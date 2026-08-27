<?php
$total = 0;

for ($i = 1; $i <= 5; $i++) {
    $num = (int) readline("Enter a number: ");
    $total += $num;
}

echo "The total is " . $total . ".";
