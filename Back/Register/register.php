<?php

require_once('../../db_connect.php');
if (isset($_POST["firstname"], $_POST["lastname"],$_POST["email"],$_POST["pwd"],$_POST["phonenumber"]) && !empty(trim($_POST["firstname"])) && !empty(trim($_POST["lastname"])) && !empty(trim($_POST["email"])) && !empty(trim($_POST["pwd"] && !empty(trim($_POST["phonenumber"]))))){
} else {
    echo json_encode(["success" => false, "error" => "Donnée vide"]);
    die;
}

$regex = "/^[a-zA-Z0-9-+._]+@[a-zA-Z0-9-]{2,}\.[a-zA-Z]{2,}$/";
if(!preg_match($regex,$_POST["email"])){
    echo json_encode(["success" => false, "error"=> "email au mauvais format"]);
    die;
}

$regex = '/^[A-Z](?=.*\d)(?=.*[@#$%^+=!])(?=.*[a-zA-Z])[a-zA-Z0-9@#$%^+=!]{7,}$/';

if (preg_match($regex, $_POST["pwd"])) {
    $hash = password_hash($_POST["pwd"], PASSWORD_DEFAULT);
    $req = $db->prepare("INSERT INTO  user (prenom, nom,email,mot_de_passe,telephone,avatar) VALUES (:prenom, :nom, :email,:mot_de_passe,:telephone,:avatar)");
    $req->bindValue(":prenom",$_POST["firstname"]);
    $req->bindValue("nom",$_POST["lastname"]);
    $req->bindValue(":email",$_POST["email"]);
    $req->bindValue(":mot_de_passe",$hash);
    $req->bindValue(":telephone",$_POST["phonenumber"]);
    $req->bindValue(":avatar","NULL");
    $response = $req->execute();
    echo json_encode(["success" => true, "response" => "inscrit"]);
} else {
    echo json_encode(["success" => false, "error" => "Mot de passe au mauvais format"]);
    die;
}
?>