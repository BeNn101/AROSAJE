<?php
require_once("../../db_connect.php");
session_start();
require("../../function.php");

if (!is_connected()) {
    header('Location: ../LoginPage/login.html');
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") $method = $_POST;
else $method = $_GET;

switch($method["opt"]) {
    case 'select_all':
        $req = $db->prepare("SELECT * FROM plantes");
        $req->execute();
        $plantes = $req->fetch(PDO::FETCH_ASSOC);
        echo json_encode(["success"=> true, "plantes"=>$plantes]); 
        break;
    case 'add':
        // Insertion d'une nouvelle plante
        if (isset($_POST["coord"], $_POST["name_plante"], $_SESSION["id_user"], $_FILES["plante_img"])) {
            $req = $db->prepare("INSERT INTO plantes (name_plante, image, localisation, id_user) VALUES (:name_plante, :image, :localisation, :id_user)");
            $req->bindValue(":name_plante", $_POST["name_plante"]);
            $req->bindValue(":localisation", $_POST["coord"]);
            $req->bindValue(":id_user", $_SESSION["id_user"]);

            if (isset($_FILES['plante_img'])) {
                // Récupère les informations sur le fichier
                $file_name = $_FILES['plante_img']['name'];
                $file_tmp = $_FILES['plante_img']['tmp_name'];
                $file_size = $_FILES['plante_img']['size'];
                $file_error = $_FILES['plante_img']['error'];
            
                // Vérifie s'il y a une erreur lors de l'envoi du fichier
                if ($file_error === 0) {
                    // Vérifie si le fichier est une image
                    $file_ext = pathinfo($file_name, PATHINFO_EXTENSION);
                    $allowed_ext = array('jpg', 'jpeg', 'png', 'gif');
                    
                    if (in_array($file_ext, $allowed_ext)) {
                        // Détermine le chemin de destination réel
                        $upload_dir = 'asset/';
                        $destination = $upload_dir . $file_name;
            
                        // Assurez-vous que le répertoire de destination existe, sinon, créez-le
                        if (!file_exists($upload_dir)) {
                            mkdir($upload_dir, 0777, true);
                        }
            
                        // Problème avec l'ajout d'image lié à l'impossibilité d'afficher le file_tmp et la destination en même temps
                        if (move_uploaded_file($file_tmp, $destination)) {
                            // Affiche l'image téléchargée
                            echo "<img src='$destination'>";
                        } else {
                            echo "Erreur lors de l'enregistrement du fichier.";
                        }
                    } else {
                        echo "Le fichier doit être une image de type JPG, JPEG, PNG ou GIF.";
                    }
                } else {
                    echo "Erreur lors de l'envoi du fichier.";
                }

                $req->bindValue(":image", $destination);
                $req->execute();
                echo json_encode((["success"=>true]));
            }
        }            
        break;
    
    default:
        echo json_encode(["success" => false, "error" => "Demande inconnue"]);
        break;
}
?>
