<?php
require_once("../../db_connect.php");
session_start();

// Activer l'affichage des erreurs
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    if (isset($data["plantName"], $data["ownerAddress"], $data["ownerCity"], $data["ownerPostalCode"], $data["ownerCountry"], $data["id_user"], $data["imageSrc"])) {
        // Préparer la requête SQL
        $req = $db->prepare("INSERT INTO plantes (name_plante, image, localisation, id_user) VALUES (?, ?, ?, ?)");

        // Préparer les données
        $localisation = $data['ownerAddress'] . ', ' . $data['ownerCity'] . ', ' . $data['ownerPostalCode'] . ', ' . $data['ownerCountry'];
        $imageSrc = $data["imageSrc"];  // Assurez-vous que cette variable est correctement définie

        // Exécuter la requête
        try {
            $success = $req->execute([$data["plantName"], $imageSrc, $localisation, $data["id_user"]]);

            if ($success) {
                echo json_encode(["success" => true, "message" => "Insertion réussie"]);
            } else {
                echo json_encode(["success" => false, "error" => "Échec de l'insertion"]);
            }
        } catch (PDOException $e) {
            echo json_encode(["success" => false, "error" => "Erreur de base de données: " . $e->getMessage()]);
        }
    } else {
        echo json_encode(["success" => false, "error" => "Données incomplètes pour l'insertion"]);
    }
} else {
    echo json_encode(["success" => false, "error" => "Méthode de requête invalide"]);
}
?>
