<?php
require_once("../db_connect.php");
session_start();

// Assuming you're using POST method to get 'opt'
$method_opt = isset($_POST['opt']) ? $_POST['opt'] : null;
print_r($method_opt);

if (isset($_SESSION["id_user"])) {
    $req = $db->prepare("SELECT * FROM plantes WHERE id_user=?");
    $req->execute([$_SESSION["id_user"]]);
    $plantes = $req->fetchAll(PDO::FETCH_ASSOC); // Use fetchAll to get all matching records
    echo json_encode(["success" => true, "plantes" => $plantes]);
} else {
    echo json_encode(["success" => false, "error" => "Session id_user not set"]);
}

switch ($method_opt) {
    case 'select_id':
        break;
    case 'insert':
        if (isset($_POST["name"], $_POST["firstname"], $_POST['lastname'], $_POST["adresse"], $_POST["ville"], $_POST["code_postal"], $_POST["pays"], $_SESSION["id_user"])) {            print_r($_POST);
            if (isset($_FILES['image_plante'])) {
                $file_name = $_FILES['image_plante']['name'];
                $file_tmp = $_FILES['image_plante']['tmp_name'];
                $file_size = $_FILES['image_plante']['size'];
                $file_error = $_FILES['image_plante']['error'];
            
                if ($file_error === 0) {
                    $file_ext = pathinfo($file_name, PATHINFO_EXTENSION);
                    $allowed_ext = array('jpg', 'jpeg', 'png', 'gif');
                    if (in_array($file_ext, $allowed_ext)) {
                        $destination = 'plante_image/' . $file_name;
                        if (move_uploaded_file($file_tmp, $destination)) {
                            $adresse = $_POST["adresse"].' '.$_POST["ville"].' '.$_POST["code_postal"].' '.$_POST["pays"];
                            $req = $db->prepare("INSERT INTO plantes (name_plante,localisation,image,id_user) VALUES (:name,:localisation,:image_plante,:id_user)");
                            $req->bindValue(":name", $_POST["name"]);
                            $req->bindValue(":id_user", $_SESSION["id_user"]);
                            $req->bindValue(":localisation", $adresse);
                            $req->bindValue(":image_plante", $destination);                            
                            $req->execute();
                            if ($success) {
                                echo json_encode(["success" => true, "message" => "Plante added successfully"]);
                            } else {
                                echo json_encode(["success" => false, "error" => "Insertion failed"]);
                            }
            
                            echo json_encode(["success" => true, "msg" => "Inscription réussie"]);
                        } else {
                            echo json_encode(["success" => false, "error" => "Erreur lors de l'enregistrement de l'image"]);
                        }
                    } else {
                        echo json_encode(["success" => false, "error" => "Le fichier doit être une image de type JPG, JPEG, PNG ou GIF"]);
                    }
                } else {
                    echo json_encode(["success" => false, "error" => "Erreur lors de l'envoi du fichier"]);
                }
            } else {
                echo json_encode(["success" => false, "error" => "Aucun fichier sélectionné"]);
            }
            }


        break;
    default:
        echo json_encode(["success" => false, "error" => "Unknown request"]);
        break;
}
?>
