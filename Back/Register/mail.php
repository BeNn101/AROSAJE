<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../../vendor/autoload.php';

$mail = new PHPMailer(true);

try {
    $mail->isSMTP();
    $mail->Host       = 'smtp.gmail.com';
    $mail->SMTPAuth   = true;
    $mail->Username   = 'salmon.hugo69330@gmail.com'; // Remplacez par votre adresse Gmail réelle
    $mail->Password   = 'cleu fufd ghyc xmad'; // Remplacez par votre mot de passe Gmail ou mot de passe d'application
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
    $mail->Port       = 465;

    $mail->setFrom('salmon.hugo69330@gmail.com', 'Test PHPMailer');
    $mail->addAddress('salmon.hugo69330@gmail.com', 'Récepteur'); // Remplacez par l'adresse de réception

    $mail->isHTML(true);
    $mail->Subject = 'Test PHPMailer';
    $mail->Body    = 'Ceci est un test d\'envoi d\'email avec PHPMailer.';

    $mail->send();
    echo 'Le message a été envoyé.';
} catch (Exception $e) {
    echo "Le message n'a pas pu être envoyé. Mailer Error: {$mail->ErrorInfo}";
}
