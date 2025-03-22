<?php

require_once("../../db_connect.php");
require("../../function.php");
is_Connected();

header('Content-Type: application/json'); // Définit le type de réponse JSON
$response = ["success" => false];

// Nettoie le buffer de sortie pour éviter tout caractère parasite avant la réponse JSON
if (ob_get_contents()) {
    ob_clean();
}

$method = $_SERVER["REQUEST_METHOD"] == "POST" ? $_POST : $_GET;

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($method['opt'])) {
    switch ($method["opt"]) {
        case "delete":
            if (!empty($method["users_id"])) {
                $id = intval($method["users_id"]);
                $stmt = $db->prepare("DELETE FROM users WHERE users_id = ?");
                $success = $stmt->execute([$id]);
                $response = ["success" => $success, "msg" => $success ? "Utilisateur supprimé" : "Erreur lors de la suppression"];
            }
            break;

        case "update":
            if (!empty($method["user"])) {
                $data = $method["user"];
                $stmt = $db->prepare("UPDATE users SET firstname = ?, lastname = ?, user_name = ?, email = ?, newsletter = ? WHERE users_id = ?");
                $success = $stmt->execute([
                    $data['firstname'], $data['lastname'], $data['user_name'], 
                    $data['email'], $data['newsletter'], $data['users_id']
                ]);
                $response = ["success" => $success, "msg" => $success ? "Mise à jour réussie" : "Erreur lors de la mise à jour"];
            }
            break;
    }
} elseif ($_SERVER["REQUEST_METHOD"] === "GET" && isset($method['opt'])) {
    switch ($method["opt"]) {
        case "select":
            $req = $db->prepare("SELECT * FROM users");
            $req->execute();
            $users = $req->fetchAll(PDO::FETCH_ASSOC);
            $response = ["success" => true, "users" => $users];
            break;

        case "select_id":
            if (!empty($_SESSION["users_id"])) {
                $req = $db->prepare("SELECT * FROM users WHERE users_id = ?");
                $req->execute([$_SESSION["users_id"]]);
                $user = $req->fetch(PDO::FETCH_ASSOC);
                $response = ["success" => true, "user" => $user];
            }
            break;

        case "update_id":
            if (!empty($method["users_id"]) && !empty($method["firstname"]) && !empty($method["lastname"]) && !empty($method["email"]) && !empty($method["user_name"])) {
                $passwordQuery = "";
                $params = [
                    ":firstname" => $method["firstname"],
                    ":lastname" => $method["lastname"],
                    ":email" => $method["email"],
                    ":user_name" => $method["user_name"],
                    ":users_id" => $method["users_id"]
                ];

                if (!empty($method["pwd"])) {
                    $passwordQuery = ", pwd = :pwd";
                    $params[":pwd"] = password_hash($method["pwd"], PASSWORD_DEFAULT);
                }

                $req = $db->prepare("UPDATE users SET firstname = :firstname, lastname = :lastname, email = :email, user_name = :user_name $passwordQuery WHERE users_id = :users_id");
                $success = $req->execute($params);
                $response = ["success" => $success, "msg" => "Mise à jour réussie"];
            }
            break;
    }
}

// Retour de la réponse JSON
echo json_encode($response);
exit();
?>
