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

$avatar = 'asset/'.$_FILES['avatar']['name'];
echo($avatar);
// $regex = "/^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])[a-zA-Z0-9]{8,12}$/";
$regex = '/^[A-Z](?=.*\d)(?=.*[@#$%^+=!])(?=.*[a-zA-Z])[a-zA-Z0-9@#$%^+=!]{7,}$/';

if (preg_match($regex, $_POST["pwd"])) {
    $hash = password_hash($_POST["pwd"], PASSWORD_DEFAULT);
    $req = $db->prepare("INSERT INTO  user (prenom, nom,email,mot_de_passe,telephone,avatar) VALUES (:prenom, :nom, :email,:mot_de_passe,:telephone,:avatar)");
    $req->bindValue(":prenom",$_POST["firstname"]);
    $req->bindValue("nom",$_POST["lastname"]);
    $req->bindValue(":email",$_POST["email"]);
    $req->bindValue(":mot_de_passe",$hash);
    $req->bindValue(":telephone",$_POST["phonenumber"]);
    $req->bindValue("avatar", $avatar);
    $req->execute();
    // print_r(('asset/'.$_FILES['avatar']['name']));
    echo json_encode(["success" => true, "msg" => "inscrit"]);
    // if (isset($_FILES['avatar'])) {
    //     // Récupère les informations sur le fichier
    //     $file_name = $_FILES['avatar']['name'];
    //     $file_tmp = $_FILES['avatar']['tmp_name'];
    //     $file_size = $_FILES['avatar']['size'];
    //     $file_error = $_FILES['avatar']['error'];

    //     // Vérifie s'il y a une erreur lors de l'envoi du fichier
    //     if ($file_error === 0) {
    //         // Vérifie si le fichier est une image
    //         $file_ext = pathinfo($file_name, PATHINFO_EXTENSION);
    //         $allowed_ext = array('jpg', 'jpeg', 'png', 'gif');
    //         if (in_array($file_ext, $allowed_ext)) {
    //             // Déplace le fichier téléchargé vers un dossier de stockage
    //             $destination = 'asset/' . $file_name;
    //             print_r($file_tmp,$destination);
    //             if (move_uploaded_file($file_tmp, $destination)) {
    //                 // Affiche l'image téléchargée
    //                 echo "<img src='$destination'>";
    //             } else {
    //                 echo "Erreur lors de l'enregistrement du fichier.";
    //             }
    //         } else {
    //             echo "Le fichier doit être une image de type JPG, JPEG, PNG ou GIF.";
    //         }
            // $req->bindValue(":avatar",$destination);

        // } else {
        //     echo "Erreur lors de l'envoi du fichier.";
        // }
    // }
    // alert("Bienvenu sur Arosaje");
    // mailer("arosaje.flores@outlook.fr", "Bienvenu {$_POST["firstname"]} {$_POST["lastname"]}", "Merci de ton inscription");
} else {
    echo json_encode(["success" => false, "error" => "Mot de passe au mauvais format"]);
    die;
}
