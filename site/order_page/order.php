<?php
require_once("../db_connect.php");
require("../function.php");
//isAdmin();

if ($_SERVER["REQUEST_METHOD"] == "POST") $method = $_POST;
else $method = $_GET;

switch($method['opt']){


    // - selection de commande par id : parmet de voir les commande selon l'id client
    // - vérification de l'id user ou l'id sneakers
    case 'select_users_id':
        if (isset($_SESSION["users_id"])){
            $req=$db->prepare("SELECT * from orders where users_id =  ?");
            $req->execute([$_SESSION["users_id"]]);
            $order=$req->fetch(PDO::FETCH_ASSOC);
            echo json_encode(['sucess'=>true,'order'=>$order]);
        }else{
            echo json_encode(['sucess'=>false,'msg'=>"pas de commande avec cette id"]);
        }

    break;

    case 'select_shopping_list_by_users_id':
        if (isset($_SESSION["users_id"])) {
            $req = $db->prepare("SELECT * FROM shopping_list WHERE users_id = ?");
            $req->execute([$_SESSION["users_id"]]);
            $order = $req->fetchAll(PDO::FETCH_ASSOC);
    
            // Si la liste est vide, renvoyer un message sans la clé shopping_list
            if (empty($order)) {
                echo json_encode(['success' => false, 'msg' => "Votre panier est vide."]);
            } else {
                echo json_encode(['success' => true, 'shopping_list' => $order]);
            }
        } else {
            echo json_encode(['success' => false, 'msg' => "Pas de commande avec cette ID."]);
        }
        break;
    
    

        case 'select_user':
            if (isset($_POST["users_id"])) {
                $req = $db->prepare("SELECT * FROM orders WHERE buyer_id = ?");
                $req->execute([$_POST["users_id"]]);
                $orders = $req->fetchAll(PDO::FETCH_ASSOC);
        
                if ($orders) {
                    echo json_encode(['success' => true, 'orders' => $orders]);
                } else {
                    echo json_encode(['success' => false, 'msg' => "Aucune commande trouvée pour cet utilisateur."]);
                }
            } else {
                echo json_encode(['success' => false, 'msg' => "Paramètre users_id manquant."]);
            }
            break;
        

    case 'insert':
        // Vérifier si les données POST existent
        if (!isset($_POST["nom"], $_POST["price"], $_POST["sneaker_id"], $_POST["seller_id"])) {
            echo json_encode(["success" => false, "msg" => "Champs manquants dans la commande"]);
            exit;
        }
    
        try {
            $req = $db->prepare("
                INSERT INTO orders (etat_c, date_de_commande, buyer_id, sneaker_id, nom, price, seller_id)
                VALUES (:etat_c, :date_de_commande, :buyer_id, :sneaker_id, :nom, :price, :seller_id)
            ");
    
            $req->bindValue(":etat_c", $_POST["status"], PDO::PARAM_STR);
            $req->bindValue(":date_de_commande", $_POST["order_date"], PDO::PARAM_STR);
            $req->bindValue(":buyer_id", $_POST["buyer_id"], PDO::PARAM_INT);
            $req->bindValue(":sneaker_id", $_POST["sneaker_id"], PDO::PARAM_INT);
            $req->bindValue(":nom", $_POST["nom"], PDO::PARAM_STR);
            $req->bindValue(":price", (float) $_POST["price"], PDO::PARAM_STR);
            $req->bindValue(":seller_id", $_POST["seller_id"], PDO::PARAM_INT);
    
            $req->execute();
    
            echo json_encode(["success" => true, "msg" => "Commande ajoutée avec succès"]);
        } catch (PDOException $e) {
            echo json_encode(["success" => false, "msg" => "Erreur SQL : " . $e->getMessage()]);
        }
        break;
    
        case 'empty_shopping_list':
            if (isset($method['user_id'])) {
                $user_id = $method['user_id'];
                $req = $db->prepare("DELETE FROM shopping_list WHERE users_id = ?");
                $req->execute([$user_id]);
                echo json_encode(["success" => true]);
            } else {
                echo json_encode(["success" => false, "msg" => "Aucun utilisateur spécifié."]);
            }
            break;
        
    case 'delete_item_from_shopping_list':
        if (isset($method['user_id'], $method['sneaker_id'])) {
            $user_id = $method['user_id'];
            $sneaker_id = $method['sneaker_id'];
            
            $req = $db->prepare("DELETE FROM shopping_list WHERE users_id = ? AND sneakers_id = ?");
            $req->execute([$user_id, $sneaker_id]);
            
            echo json_encode(["success" => true]);
        } else {
            echo json_encode(["success" => false, "msg" => "Paramètres manquants."]);
        }
        break;
            
    default:
        echo json_encode(["sucess"=>false, "msg"=>"demande inconnu"]);

}