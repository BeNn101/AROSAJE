<?php
require_once("../../db_connect.php");
session_start(); // Permet de démarrer la session de l'utilisateur
$list_message=[];
function findListIndex($list_message, $destinataire) {
    foreach ($list_message as $index => $list) {
        // Check if the destinataire of the first message in the list matches the current destinataire
        if (!empty($list) && $list[0]["id_destinataire"] === $destinataire) {
            return $index;
        }
    }
    return false; // Return false if no matching list is found
}

if(isset($_SESSION["id_user"])){
    $req = $db->prepare("SELECT * FROM historique_tchat WHERE id_user = ? ");
    $req->execute([$_SESSION["id_user"]]);
    $message = $req->fetchAll(PDO::FETCH_ASSOC);
    for ($i = 0; $i < count($message); $i++) {
        $currentMessage = $message[$i];
        $destinataire = $currentMessage["id_destinataire"];
    
        $listIndex = findListIndex($list_message, $destinataire);
    
        if ($listIndex !== false) {
            $list_message[$listIndex][] = $currentMessage;
        } else {
            $list_message[] = [$currentMessage];
        }
    }
    print_r($list_message);


    // Reste a faire :
    // Récuperer la date de l'écriture du message 
    // 
}

// Cas ou l'utilisateur est inconnu de la BDD 

?>