<?php
require_once("db_connect.php");
session_start();
header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $method = $_POST;
} else {
    $method = $_GET;
}

switch ($method["opt"] ?? '') {
    case 'select_user':
        if (isset($_SESSION["users_id"])) {
            try {
                $stmt = $db->prepare("SELECT * FROM users WHERE users_id = ?");
                $stmt->execute([$_SESSION["users_id"]]);
                $user = $stmt->fetch(PDO::FETCH_ASSOC);

                if ($user) {
                    echo json_encode(["success" => true, "user" => $user]);
                } else {
                    echo json_encode(["success" => false, "msg" => "Utilisateur non trouvé."]);
                }
            } catch (PDOException $e) {
                echo json_encode(["success" => false, "msg" => "Erreur de requête : " . $e->getMessage()]);
            }
        } else {
            echo json_encode(["success" => false, "msg" => "Aucun utilisateur connecté."]);
        }
        break;

    case 'update_user':
        if (
            isset($_POST["firstname"], $_POST["lastname"], $_POST["email"], $_POST["username"]) &&
            !empty(trim($_POST["firstname"])) &&
            !empty(trim($_POST["lastname"])) &&
            !empty(trim($_POST["email"])) &&
            !empty(trim($_POST["username"]))
        ) {
            try {
                $stmt = $db->prepare("UPDATE users SET firstname = ?, lastname = ?, email = ?, user_name = ? WHERE users_id = ?");
                $stmt->execute([
                    $_POST["firstname"],
                    $_POST["lastname"],
                    $_POST["email"],
                    $_POST["username"],
                    $_SESSION["users_id"]
                ]);
                echo json_encode(["success" => true, "msg" => "Mise à jour réussie."]);
            } catch (PDOException $e) {
                echo json_encode(["success" => false, "msg" => "Erreur de mise à jour : " . $e->getMessage()]);
            }
        } else {
            echo json_encode(["success" => false, "msg" => "Données invalides."]);
        }
        break;

        case 'delete_user':
            if (isset($_SESSION["users_id"])) {
                try {
                    // Supprimer les enregistrements liés dans la table sneakers
                    $stmt1 = $db->prepare("DELETE FROM sneakers WHERE users_id = :users_id");
                    $stmt1->execute(["users_id" => $_SESSION["users_id"]]);
        
                    // Supprimer l'utilisateur dans la table users
                    $stmt2 = $db->prepare("DELETE FROM users WHERE users_id = :users_id");
                    $stmt2->execute(["users_id" => $_SESSION["users_id"]]);
        
                    echo json_encode(["success" => true, "msg" => "Utilisateur supprimé."]);
                } catch (PDOException $e) {
                    echo json_encode(["success" => false, "msg" => "Erreur de suppression : " . $e->getMessage()]);
                }
            } else {
                echo json_encode(["success" => false, "msg" => "Aucun utilisateur connecté."]);
            }
            break;
        
    default:
        echo json_encode(["success" => false, "msg" => "Action inconnue."]);
}
