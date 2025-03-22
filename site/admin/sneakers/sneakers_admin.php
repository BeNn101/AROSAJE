<?php

require_once("../../db_connect.php");
require("../../function.php");
is_Connected();

// Activer l'affichage des erreurs pour le debug
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Forcer une sortie propre en JSON
header('Content-Type: application/json');
if (ob_get_length()) ob_end_clean();

// Initialiser la réponse
$response = ["success" => false];

// Vérifier si une option est fournie
if (!isset($_REQUEST["opt"])) {
    echo json_encode(["success" => false, "error" => "Option 'opt' manquante"]);
    exit();
}

$method = $_SERVER["REQUEST_METHOD"] == "POST" ? $_POST : $_GET;
$opt = $method["opt"];

try {
    switch ($opt) {
        case 'select':
            $req = $db->query("SELECT * FROM sneakers");
            $sneakers = $req->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode(["success" => true, "sneakers" => $sneakers]);
            exit();

        case 'select_id':
            if (!empty($method["sneakers_id"])) {
                $req = $db->prepare("SELECT * FROM sneakers WHERE sneakers_id = ?");
                $req->execute([$method["sneakers_id"]]);
                $sneaker = $req->fetch(PDO::FETCH_ASSOC);
                echo json_encode(["success" => true, "sneaker" => $sneaker]);
            } else {
                echo json_encode(["success" => false, "error" => "ID sneaker manquant"]);
            }
            exit();

        case 'insert':
            if (!empty($method["brand"]) && !empty($method["size"]) && !empty($method["color"]) &&
                !empty($method["state"]) && !empty($method["price"]) && !empty($method["stock"])) {

                $req = $db->prepare("INSERT INTO sneakers (brand, size, color, state, price, stock) 
                                    VALUES (:brand, :size, :color, :state, :price, :stock)");

                $req->bindParam(":brand", $method["brand"]);
                $req->bindParam(":size", $method["size"]);
                $req->bindParam(":color", $method["color"]);
                $req->bindParam(":state", $method["state"]);
                $req->bindParam(":price", $method["price"]);
                $req->bindParam(":stock", $method["stock"]);
                $success = $req->execute();

                echo json_encode(["success" => $success, "message" => $success ? "Sneaker ajoutée" : "Erreur lors de l'ajout"]);
            } else {
                echo json_encode(["success" => false, "error" => "Champs manquants"]);
            }
            exit();

            case 'update_id':
                if (
                    isset($_POST["sneakers_id"], $_POST["brand"], $_POST["size"], $_POST["price"], $_POST["color"], $_POST["states"], $_POST["stock"]) &&
                    !empty(trim($_POST["brand"])) &&
                    !empty(trim($_POST["size"])) &&
                    !empty(trim($_POST["price"])) &&
                    !empty(trim($_POST["color"])) &&
                    !empty(trim($_POST["states"])) &&
                    !empty(trim($_POST["stock"]))
                ) {
                    // Connexion à la BDD (Assurez-vous que $db est bien connecté)
                    
                    $params = [
                        ":brand" => $_POST["brand"],
                        ":size" => $_POST["size"],
                        ":price" => $_POST["price"],
                        ":color" => $_POST["color"],
                        ":states" => $_POST["states"],
                        ":stock" => $_POST["stock"],
                        ":sneakers_id" => $_POST["sneakers_id"],
                        ":users_id" => $_SESSION["users_id"]
                    ];
            
                    $image_query = "";
                    
                    // Vérifier si une nouvelle image est envoyée
                    if (isset($_FILES["image"]) && $_FILES["image"]["error"] === 0) {
                        $file_name = $_FILES['image']['name'];
                        $file_tmp = $_FILES['image']['tmp_name'];
                        $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
                        $allowed_exts = ["jpg", "jpeg", "png", "gif"];
            
                        $uploadDir = "../../asset/product_img/";
            
                        // Vérifier si le dossier d'upload existe, sinon le créer
                        if (!is_dir($uploadDir)) {
                            mkdir($uploadDir, 0755, true);
                        }
            
                        // Vérifier que l'extension est autorisée
                        if (!in_array($file_ext, $allowed_exts)) {
                            echo json_encode(["success" => false, "error" => "Format d'image non autorisé"]);
                            exit();
                        }
            
                        // Générer un nom unique pour le fichier
                        $new_file_name = uniqid() . '.' . $file_ext;
                        $destination = $uploadDir . $new_file_name;
            
                        // Déplacer l'image vers le dossier d'uploads
                        if (move_uploaded_file($file_tmp, $destination)) {
                            // Récupérer l'ancienne image pour suppression
                            $stmt = $db->prepare("SELECT image FROM sneakers WHERE sneakers_id = :sneakers_id AND users_id = :users_id");
                            $stmt->execute([
                                ":sneakers_id" => $_POST["sneakers_id"],
                                ":users_id" => $_SESSION["users_id"]
                            ]);
                            $old_image = $stmt->fetchColumn();
            
                            // Supprimer l'ancienne image si elle existe
                            if ($old_image && file_exists($uploadDir . $old_image)) {
                                unlink($uploadDir . $old_image);
                            }
            
                            // Ajouter la nouvelle image à la requête de mise à jour
                            $image_query = ", image = :image";
                            $params[":image"] = $new_file_name;
                        } else {
                            echo json_encode(["success" => false, "error" => "Échec du téléchargement de l'image"]);
                            exit();
                        }
                    }
            
                    // Requête SQL avec mise à jour conditionnelle de l’image
                    $req = $db->prepare("
                        UPDATE sneakers 
                        SET brand = :brand, 
                            size = :size, 
                            price = :price, 
                            color = :color, 
                            states = :states, 
                            stock = :stock
                            $image_query
                        WHERE sneakers_id = :sneakers_id 
                        AND users_id = :users_id
                    ");
            
                    $success = $req->execute($params);
            
                    if ($success) {
                        echo json_encode(["success" => true, "message" => "Mise à jour réussie"]);
                    } else {
                        echo json_encode(["success" => false, "error" => "Échec de la mise à jour"]);
                    }
                } else {
                    echo json_encode(["success" => false, "error" => "Données manquantes"]);
                }
                break;
            
        case 'delete_id':
            if (!empty($method["sneakers_id"])) {
                $req = $db->prepare("DELETE FROM sneakers WHERE sneakers_id = ?");
                $success = $req->execute([$method["sneakers_id"]]);

                echo json_encode(["success" => $success, "message" => $success ? "Sneaker supprimée" : "Erreur lors de la suppression"]);
            } else {
                echo json_encode(["success" => false, "error" => "ID sneaker manquant"]);
            }
            exit();

        default:
            echo json_encode(["success" => false, "error" => "Option invalide"]);
            exit();
    }
} catch (Exception $e) {
    echo json_encode(["success" => false, "error" => "Erreur serveur: " . $e->getMessage()]);
    exit();
}
