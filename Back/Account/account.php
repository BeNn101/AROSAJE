<?php
// require("../../function.php");
require_once("../../db_connect.php");
// is_connected();
session_start();
if(isset($_SESSION["id_user"])){
    // Spécifiez toutes les colonnes que vous souhaitez récupérer, à l'exception de 'password'
    $req = $db->prepare("SELECT id_user, nom, prenom, email, telephone,avatar FROM user WHERE id_user = ?");
    $req->execute([$_SESSION["id_user"]]);
    $user = $req->fetch(PDO::FETCH_ASSOC);
    
    // Vérifiez si l'utilisateur a été trouvé avant de renvoyer les données
    if($user) {
        echo json_encode(["success" => true, "user" => $user]); 
    } else {
        // Gérez le cas où l'utilisateur n'est pas trouvé
        echo json_encode(["success" => false, "message" => "Utilisateur non trouvé."]);
    }
} else {
    // Gérez le cas où `id_user` n'est pas défini dans la session
    echo json_encode(["success" => false, "message" => "ID utilisateur non spécifié."]);
}


// Récupération des plantes mise sur le site par l'utilisateur
// if(isset($_SESSION["id_user"])){
//     $req=$db->prepare("SELECT * FROM plantes WHERE id_user=?");
//     $req->execute([$_SESSION["id_user"]]);
//     $plantes=$req->fetch(PDO::FETCH_ASSOC);
//     echo json_encode(["success"=> true, "plantes"=>$plantes]); 
// }

?>