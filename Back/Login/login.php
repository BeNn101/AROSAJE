<?php
// Récupération du user_id lors de la connexion
session_start();
require_once("../../db_connect.php");

if (isset($_POST["email"]) && isset($_POST["mot_de_passe"]) && !empty(trim($_POST["email"])) && !empty(trim($_POST["mot_de_passe"]))) {
    // Utilisation d'une seule variable dans la requête préparée
    $req = $db->prepare("SELECT email, mot_de_passe, id_user FROM user WHERE email = ?");
    $req->execute([$_POST["email"]]);
    $user = $req->fetch(PDO::FETCH_ASSOC);
    
    // Vérifier si l'utilisateur existe
    if ($user) {
        // Vérifier si le mot de passe correspond
        if (password_verify($_POST["mot_de_passe"], $user["mot_de_passe"])) {
            $_SESSION["id_user"]=$user["id_user"];
            echo json_encode(["success" => true, "user" => $user["id_user"]]);
            die;
        } else {
            echo json_encode(["success" => false, "error" => "Mot de passe erroné"]);
        }
    } else {
        echo json_encode(["success" => false, "error" => "Utilisateur non trouvé"]);
    }
} else {
    echo json_encode(["success" => false, "error" => "Paramètres manquants"]);
}
