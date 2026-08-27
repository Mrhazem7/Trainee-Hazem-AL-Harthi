<?php

echo "Let's play Guess the Number.\n";

$secretNumber = rand(1, 10);
$guessCount = 0;
$guess = 0;

while ($guess != $secretNumber) {
    $guessCount++;

    if ($guessCount == 1) {
        $guess = (int) readline("I have my number. What's your guess? ");
    } else {
        $guess = (int) readline("Guess again: ");
    }

    if ($guess < $secretNumber) {
        echo "low.";
    } elseif ($guess > $secretNumber) {
        echo "high.";
    }
}

echo "You got it in " . $guessCount . " guesses!";