<?php
$correctPassword = "abc$123";
$password = readline("What is the password? ");

if ($password == $correctPassword) {
    echo "Welcome";
} else {
    echo "I don't know you.";
}