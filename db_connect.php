<?php
$host = "localhost";
$username = "root";
$password = "";
$dbname ="arosaje_db";

try {
    $db = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
} catch (ErrorException $e) {
    echo $e;
}
