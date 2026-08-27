<?php

$day = (int) readline("Enter birth day: ");
$month = (int) readline("Enter birth month: ");
$year = (int) readline("Enter birth year: ");

$birthDate = mktime(0, 0, 0, $month, $day, $year);
$currentDate = time();

$diffSeconds = $currentDate - $birthDate;
$age = floor($diffSeconds / (365.25 * 24 * 60 * 60));

echo "Your age is " . $age . " years.";
