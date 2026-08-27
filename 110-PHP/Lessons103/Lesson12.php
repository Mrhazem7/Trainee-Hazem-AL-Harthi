<?php

$countries = array(
    "Saudi Arabia" => 966,
    "Kuwait" => 965,
    "Egypt" => 20,
    "United Arab Emirates" => 971
);

$country = readline("Enter a country: ");

echo "Country: " . $country . "\n";
echo "Country Calling Code : " . $countries[$country] . "\n";
