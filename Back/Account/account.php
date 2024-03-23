<?php
// Récupération des données de l'utilisateur connécté
if(isset($_SESSION["id_user"])){
    $req=$db->prepare("SELECT * FROM users WHERE id_user=?");
    $req->execute([$_SESSION["id_user"]]);
    $user=$req->fetch(PDO::FETCH_ASSOC);
    echo json_encode(["success"=> true, "user"=>$user]); 
}

// Récupération des plantes mise sur le site par l'utilisateur
if(isset($_SESSION["id_user"])){
    $req=$db->prepare("SELECT * FROM plantes WHERE id_user=?");
    $req->execute([$_SESSION["id_user"]]);
    $plantes=$req->fetch(PDO::FETCH_ASSOC);
    echo json_encode(["success"=> true, "plantes"=>$plantes]); 
}

?>