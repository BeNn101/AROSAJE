<?php
require_once("db_connect.php");
require("function.php");

// Vérifie si l'utilisateur est connecté avant d'exécuter toute action
if (!isset($_SESSION["users_id"])) {
    echo json_encode(["success" => false, "error" => "Vous n'êtes pas connecté"]);
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $method = $_POST;
} else {
    $method = $_GET;
}

$method = $_REQUEST; // Récupère à la fois POST et GET
$opt = $method["opt"] ?? null; // Sécurise l'accès à opt

switch($opt){
    case 'select_catalog':
        $req = $db->prepare("SELECT * FROM sneakers WHERE users_id != ?");
        $req->execute([$_SESSION["users_id"]]);
        $articles = $req->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode(["success" => true, "articles" => $articles]);
        break;

    case 'add_to_cart':
        if (isset($method['sneakers_id']) && !empty(trim($method['sneakers_id']))) {
            $sneakers_id = intval($method['sneakers_id']);
            $users_id = $_SESSION['users_id'];
            $req = $db->prepare("SELECT brand, price, image, stock FROM sneakers WHERE sneakers_id = ?");
            $req->execute([$sneakers_id]);
            $product = $req->fetch(PDO::FETCH_ASSOC);

            if ($product) {
                $insert = $db->prepare("
                    INSERT INTO shopping_list (sneakers_id, users_id, brand, price, image, stock)
                    VALUES (:sneakers_id, :users_id, :brand, :price, :image, :stock)
                ");
                $insert->bindValue(':sneakers_id', $sneakers_id);
                $insert->bindValue(':users_id', $users_id);
                $insert->bindValue(':brand', $product['brand']);
                $insert->bindValue(':price', $product['price']);
                $insert->bindValue(':image', $product['image']);
                $insert->bindValue(':stock', $product['stock']);

                if ($insert->execute()) {
                    echo json_encode(['success' => true]);
                } else {
                    echo json_encode(['success' => false, 'error' => 'Erreur lors de l\'ajout au panier.']);
                }
            } else {
                echo json_encode(['success' => false, 'error' => 'Produit introuvable.']);
            }
        } else {
            echo json_encode(['success' => false, 'error' => 'ID produit manquant.']);
        }
        break;
        
    case 'select':
        $req = $db->query("SELECT s.* FROM sneakers s ");
        $articles = $req->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode(["success" => true, "articles" => $articles]);
        break;

    case 'select_id':
        $req = $db->prepare("SELECT * FROM sneakers WHERE users_id=?");
        $req->execute([$_SESSION["users_id"]]);
        $sneakers = $req->fetch(PDO::FETCH_ASSOC);
        echo json_encode(["success" => true, "sneakers" => $sneakers]);
        break;

    case 'insert':
        if (
            isset($_POST["size"], $_POST["color"], $_POST["brand"], $_POST["state"], $_POST["price"], $_POST["stocks"]) &&
            !empty(trim($_POST["size"])) &&
            !empty(trim($_POST["color"])) &&
            !empty(trim($_POST["brand"])) &&
            !empty(trim($_POST["state"])) &&
            !empty(trim($_POST["price"])) &&
            !empty(trim($_POST["stocks"]))
        ) {
            if (isset($_FILES['image']) && $_FILES['image']['error'] === 0) {
                $file_name = $_FILES['image']['name'];
                $file_tmp = $_FILES['image']['tmp_name'];
                $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
                $allowed_ext = ['jpg', 'jpeg', 'png', 'gif'];

                $uploadDir = "asset/product_img/";
                if (!is_dir($uploadDir)) {
                    mkdir($uploadDir, 0755, true);
                }

                $new_file_name = uniqid() . '.' . $file_ext;
                $destination = $uploadDir . $new_file_name;

                if (in_array($file_ext, $allowed_ext)) {
                    if (move_uploaded_file($file_tmp, $destination)) {
                        $_POST["image"] = $new_file_name;

                        $req = $db->prepare("
                            INSERT INTO sneakers (brand, color, price, size, states, image, stock, users_id) 
                            VALUES (:brand, :color, :price, :size, :states, :image, :stocks, :users_id)
                        ");

                        $req->bindValue(":brand", $_POST["brand"]);
                        $req->bindValue(":color", $_POST["color"]);
                        $req->bindValue(":price", $_POST["price"]);
                        $req->bindValue(":size", $_POST["size"]);
                        $req->bindValue(":states", $_POST["state"]);
                        $req->bindValue(":image", $_POST["image"]);
                        $req->bindValue(":stocks", $_POST["stocks"]);
                        $req->bindValue(":users_id", $_SESSION["users_id"]);

                        if ($req->execute()) {
                            echo json_encode(["success" => true]);
                        } else {
                            echo json_encode(["success" => false, "error" => "Erreur SQL."]);
                        }
                    } else {
                        echo json_encode(["success" => false, "error" => "Erreur lors du déplacement de l'image."]);
                    }
                } else {
                    echo json_encode(["success" => false, "error" => "Extension de fichier non valide."]);
                }
            } else {
                echo json_encode(["success" => false, "error" => "Fichier non envoyé ou erreur lors de l'envoi."]);
            }
        } else {
            echo json_encode(["success" => false, "error" => "Paramètres manquants ou invalides."]);
        }
        break;
    
        case 'update_id':
            if (
                isset($_POST["sneakers_id"], $_POST["brand"], $_POST["size"], $_POST["price"], $_POST["color"], $_POST["brand_name"], $_POST["states"], $_POST["stock"]) &&
                !empty(trim($_POST["brand"])) &&
                !empty(trim($_POST["size"])) &&
                !empty(trim($_POST["price"])) &&
                !empty(trim($_POST["color"])) &&
                !empty(trim($_POST["brand_name"])) &&
                !empty(trim($_POST["states"])) &&
                !empty(trim($_POST["stock"]))
            ) {
                $req = $db->prepare("
                    UPDATE sneakers 
                    SET brand = :brand, size = :size, price = :price, color = :color, brand = :brand_name, states = :states, stock = :stock
                    WHERE sneakers_id = :sneakers_id AND users_id = :users_id
                ");
        
                $success = $req->execute([
                    ":brand" => $_POST["brand"],
                    ":size" => $_POST["size"],
                    ":price" => $_POST["price"],
                    ":color" => $_POST["color"],
                    ":brand_name" => $_POST["brand_name"],
                    ":states" => $_POST["states"],
                    ":stock" => $_POST["stock"],
                    ":sneakers_id" => $_POST["sneakers_id"],
                    ":users_id" => $_SESSION["users_id"]
                ]);
        
                if ($success) {
                    echo json_encode(["success" => true]);
                } else {
                    echo json_encode(["success" => false, "error" => "Échec de la mise à jour"]);
                }
            } else {
                echo json_encode(["success" => false, "error" => "Données manquantes"]);
            }
            break;
        
    case 'delete_id':
        $req = $db->prepare("DELETE FROM sneakers WHERE users_id=?");
        $req->execute([$_SESSION["users_id"]]);
        echo json_encode(["success" => $req->rowCount() > 0]);
        break;

    default:
        echo json_encode(["success" => false, "error" => "Demande inconnue"]);
        break;
}
