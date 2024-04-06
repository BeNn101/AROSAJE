<?php
// require("../../function.php");
require_once("../../db_connect.php");
// is_connected();
session_start();

// Vérifiez d'abord s'il s'agit d'une requête POST pour l'insertion
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST["name"], $_POST["Adresse"], $_POST["Ville"], $_POST["Code_Postal"], $_POST["Pays"])) {
        // Logique d'insertion
        $req = $db->prepare("INSERT INTO plantes (name, Adresse, Ville, Code_Postal, Pays) VALUES (?, ?, ?, ?, ?)");
        $success = $req->execute([$_POST["name"], $_POST['Adresse'], $_POST['Ville'], $_POST['Code_Postal'], $_POST['Pays']]);
        if ($success) {
            echo json_encode(["success" => true, "message" => "Insertion successful"]);
        } else {
            echo json_encode(["success" => false, "error" => "Insertion failed"]);
        }
    } else {
        echo json_encode(["success" => false, "error" => "Incomplete data for insertion"]);
    }
} else if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    // Logique de récupération
    if(isset($_SESSION["id_user"])){
        $req = $db->prepare("SELECT id_user, nom, prenom, email, telephone, avatar FROM user WHERE id_user = ?");
        $req->execute([$_SESSION["id_user"]]);
        $user = $req->fetch(PDO::FETCH_ASSOC);
        
        if($user) {
            echo json_encode(["success" => true, "user" => $user]);
        } else {
            echo json_encode(["success" => false, "message" => "Utilisateur non trouvé."]);
        }
    } else {
        echo json_encode(["success" => false, "message" => "ID utilisateur non spécifié."]);
    }
}



// require("../../function.php");
// require_once("../../db_connect.php");
// is_connected();
// session_start();
// if(isset($_SESSION["id_user"])){
//     // Spécifiez toutes les colonnes que vous souhaitez récupérer, à l'exception de 'password'
//     $req = $db->prepare("SELECT id_user, nom, prenom, email, telephone,avatar FROM user WHERE id_user = ?");
//     $req->execute([$_SESSION["id_user"]]);
//     $user = $req->fetch(PDO::FETCH_ASSOC);
    
//     // Vérifiez si l'utilisateur a été trouvé avant de renvoyer les données
//     if($user) {
//         echo json_encode(["success" => true, "user" => $user]); 
//     } else {
//         // Gérez le cas où l'utilisateur n'est pas trouvé
//         echo json_encode(["success" => false, "message" => "Utilisateur non trouvé."]);
//     }
// } else {
//     // Gérez le cas où `id_user` n'est pas défini dans la session
//     echo json_encode(["success" => false, "message" => "ID utilisateur non spécifié."]);
// }


// if (isset($_POST["name"], $_POST["Adresse"],$_POST["Ville"],$_POST["Code_Postal"],$_POST["Pays"])) {
//     // Assuming there's a column in your table called 'name', 'prenom', 'nom' that you want to insert into
//     $req = $db->prepare("INSERT INTO plantes (name, prenom, nom) VALUES (?, ?, ?)");
//     $success = $req->execute([$_POST["name"], $_POST['prenom'], $_POST['nom']]);
//     if ($success) {
//         echo json_encode(["success" => true, "message" => "Insertion successful"]);
//     } else {
//         echo json_encode(["success" => false, "error" => "Insertion failed"]);
//     }
// } else {
//     echo json_encode(["success" => false, "error" => "Incomplete data for insertion"]);
// }

?>
?>