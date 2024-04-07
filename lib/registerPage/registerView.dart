import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Supprimer l'AppBar
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Logo (rendre l'image plus grande)
              Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Texte d'inscription
              Text(
                'Inscription',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              // Champs de saisie avec espacement vertical
              RegistrationFormField(label: 'Prénom'),
              SizedBox(height: 12),
              RegistrationFormField(label: 'Nom'),
              SizedBox(height: 12),
              RegistrationFormField(
                  label: 'Email', keyboardType: TextInputType.emailAddress),
              SizedBox(height: 12),
              RegistrationFormField(label: 'Mot de passe', obscureText: true),
              SizedBox(height: 12),
              RegistrationFormField(
                  label: 'Téléphone', keyboardType: TextInputType.phone),
              SizedBox(height: 20),
              // Texte pour la page de connexion
              GestureDetector(
                onTap: () {
                  // Mettez ici la navigation vers la page de connexion
                },
                child: Text(
                  'Déjà inscrit ? Connectez-vous',
                  style: TextStyle(
                    color: Colors.blue, // Texte en bleu
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Bouton d'inscription personnalisé
              ElevatedButton(
                onPressed: () {
                  // Mettez ici votre logique d'inscription
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Couleur du bouton
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Bords arrondis
                  ),
                  side: BorderSide(color: Colors.black), // Bordure noire
                ),
                child: Container(
                  width: double.infinity, // Bouton plein largeur
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Text(
                      'S\'inscrire',
                      style: TextStyle(
                        color: Colors.white, // Texte blanc
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;

  const RegistrationFormField({
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
      ),
    );
  }
}
