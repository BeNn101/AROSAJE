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

// function is_connected(){
//     if(empty($_SESSION)){
//         echo json_encode(["success"=>"false", "error"=>"vous n'ètes pas connecté"]);
//         die;
//     }
    
// }