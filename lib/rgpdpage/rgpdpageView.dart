import 'package:flutter/material.dart';

class RgpdView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Termes et Conditions CGU"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Couleur du texte
              ),
              children: [
                TextSpan(
                  text: 'Conditions Générales d\'Utilisation\n\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: '1. Introduction\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'Bienvenue sur notre application de gardiennage de plantes. En utilisant notre service, vous acceptez les présentes Conditions Générales d\'Utilisation (CGU).\n\n',
                ),
                TextSpan(
                  text: '2. Utilisation des Données Utilisateurs\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'Nous collectons et utilisons vos données personnelles conformément à notre Politique de Confidentialité. Vos données sont nécessaires pour fournir et améliorer nos services.\n\n',
                ),
                TextSpan(
                  text: '3. Inscription\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'Pour utiliser notre service, vous devez créer un compte en fournissant des informations exactes et complètes. Vous êtes responsable de la confidentialité de votre mot de passe et de toutes les activités liées à votre compte.\n\n',
                ),
                TextSpan(
                  text: '4. Responsabilités des Utilisateurs\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'En tant qu\'utilisateur, vous êtes responsable de la plante que vous confiez et de celle que vous gardez. Vous devez respecter les engagements pris avec les autres utilisateurs.\n\n',
                ),
                TextSpan(
                  text: '5. Propriété Intellectuelle\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'Tous les contenus disponibles sur notre application, y compris les textes, images, et logos, sont protégés par des droits de propriété intellectuelle.\n\n',
                ),
                TextSpan(
                  text: '6. Limitation de Responsabilité\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'Nous ne pouvons être tenus responsables des dommages directs ou indirects résultant de l\'utilisation de notre service.\n\n',
                ),
                TextSpan(
                  text: '7. Modification des CGU\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'Nous nous réservons le droit de modifier ces CGU à tout moment. Les modifications entreront en vigueur dès leur publication sur notre site.\n\n',
                ),
                TextSpan(
                  text: '8. Contact\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'Pour toute question concernant ces CGU, veuillez nous contacter à support@arosaje.com.\n\n',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
