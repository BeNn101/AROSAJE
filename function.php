<?
function is_connected(){
    if(!$_SESSION["connected"]){
        echo json_encode(["success"=>"false", "error"=>"vous n'ètes pas connecté"]);
        die;
    }
    
}
?>
