<?php
if(isset($_SESSION["id_user"])){
    // requète PHP qui te permet de récuperer tous les messages d'une personnes
    $req = $db->query("SELECT * FROM historique_tchat");
    $message = $req->fetchAll(PDO::FETCH_ASSOC);

    // filtrer les messages par personnes a qui il les envoi et récuperer les information qui les concernent
    // boucle qui va trier un message selon sont expediteur et le ranger dans une liste 

    // Trier les messages par utilisateur 

    // Si l'utilisateur existe déjà alors 
    
    // Envisager le cas ou pas de message 
}

// Cas ou l'utilisateur est inconnu de la BDD 

?>