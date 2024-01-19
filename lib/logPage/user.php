<?php
$db=mysqli_connect('localhost','root','','arosaje_app');
if(!$db){
    echo "Database connection failed";
}
$email= $_GET['email'];
$password= $_GET['mot_de_passe'];

$sql="SELECT * FROM user WHERE email='".$email."' AND mot_de_passe='".$password."' "
?>