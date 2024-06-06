<?php
require_once("../../db_connect.php");
session_start();

// Activer l'affichage des erreurs
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);
    if (isset($data["plantName"], $data["ownerAddress"], $data["ownerCity"], $data["ownerPostalCode"], $data["ownerCountry"], $data["id_user"])) {
        // Préparer la requête SQL
        $req = $db->prepare("INSERT INTO plantes (name_plante, image, localisation, id_user) VALUES (?, ?, ?, ?)");
        $localisation = $data['ownerAddress'] . ', ' . $data['ownerCity'] . ', ' . $data['ownerPostalCode'] . ', ' . $data['ownerCountry'];
        $success = $req->execute([$data["plantName"], $data["imageBase64"], $localisation, $data["id_user"]]);

        if ($success) {
            echo json_encode(["success" => true, "message" => "Insertion successful"]);
        } else {
            echo json_encode(["success" => false, "error" => "Insertion failed"]);
        }
    } else {
        echo json_encode(["success" => false, "error" => "Incomplete data for insertion"]);
    }
} else {
    echo json_encode(["success" => false, "error" => "Invalid request method"]);
}
?>
