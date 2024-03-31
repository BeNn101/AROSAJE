<?php
// Connexion à la base de données
$host = 'localhost'; // ou l'IP du serveur de base de données
$username = 'root';
$password = '';
$dbname = 'arosaje_db';

// Création de la connexion avec PDO pour utiliser les requêtes préparées
try {
    $db = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    // Activation des exceptions pour les erreurs
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("Échec de la connexion : " . $e->getMessage());
}

// Début du suivi du temps
$tempsDebut = microtime(true);

// Préparation de la requête pour récupérer les données utilisateur
$req = $db->prepare("SELECT * FROM user");

// Exécution de la requête
$req->execute();

// Récupération des résultats
$resultats = $req->fetchAll(PDO::FETCH_ASSOC);

// Fin du suivi du temps
$tempsFin = microtime(true);

// Calcul de la durée d'exécution
$dureeExecution = $tempsFin - $tempsDebut;

// Affichage des résultats
// foreach ($resultats as $utilisateur) {
//     echo "ID: " . $utilisateur['id'] . ", Nom: " . $utilisateur['nom'] . ", Email: " . $utilisateur['email'] . "<br>";
// }

echo "La récupération des données utilisateurs a pris $dureeExecution secondes.";

?>
