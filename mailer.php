<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php'; // Assurez-vous que le fichier autoload.php est correctement inclus avec le chemin correct

function mailer($to, $subject, $body)
{
    $mail = new PHPMailer(true); // Utilisez true pour activer les exceptions

    try {
        $mail->IsHTML(true);
        $mail->SMTPDebug = 0;
        $mail->SMTPAuth = true; // Activez l'authentification SMTP
        $mail->SMTPSecure = "tls";
        $mail->Host = "smtp.mail.outlook.com";
        $mail->Port = 587;
        $mail->Username = "max.beaumet@ecoles-epsi.com";
        $mail->Password = "Mixmax201202!";
        $mail->SetFrom("max.beaumet@ecoles-epsi.com", "Bienvenue");

        $mail->Subject = $subject;

        // Configuration du contenu du message
        $mail->Body = "<html>\n";
        $mail->Body .= "<body style=\"font-family:Verdana, Verdana, Geneva, sans-serif; font-size:12px; color:#666666;\">\n";
        $mail->Body .= "<p>Bienvenue dans la famille ! Tu vas maintenant pouvoir vendre et acheter les meilleures sneakers du moment</p>";
        $mail->Body .= "</body>\n";
        $mail->Body .= "</html>\n";

        $mail->AddAddress($to);

        if (!$mail->Send()) {
            throw new Exception('Mail error: ' . $mail->ErrorInfo);
        } else {
            return true;
        }
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
        return false; // Gérer l'erreur et retourner false en cas d'échec
    }
}

// Exemple d'utilisation
$result = mailer('destinataire@example.com', 'Sujet du message', 'Corps du message');

if ($result) {
    echo 'Le courriel a été envoyé avec succès.';
} else {
    echo 'Erreur lors de l\'envoi du courriel.';
}
?>