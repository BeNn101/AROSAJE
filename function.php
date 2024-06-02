<?
session_start();
print_r($_SESSION["user"]);

function is_connected(){
    if(!$_SESSION["user"]){
        echo json_encode(["success"=>"false", "error"=>"vous n'ètes pas connecté"]);
        die;
    }
    
}
