<?php

$sentence = readline("Enter a sentence: ");

echo "1. calculate string length\n";
echo "2. replace the word\n";
echo "3. convert small letters to capital letters\n";

$choice = (int) readline("Choose an option: ");

switch ($choice) {
    case 1:
        echo strlen($sentence);
        break;

    case 2:
        $word = readline("Enter the word to replace: ");
        $newWord = readline("Enter the new word: ");
        echo str_replace($word, $newWord, $sentence);
        break;

    case 3:
        echo ucwords($sentence);
        break;

    default:
        echo "Invalid option.";
}