import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
              Text(
                'Inscription',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
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
              GestureDetector(
                onTap: () {
                  Get.offNamed("/login");
                },
                child: Text(
                  'Déjà inscrit ? Connectez-vous',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Bouton d'inscription personnalisé
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // Mettez ici votre logique d'inscription
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Fond blanc
                    onPrimary: Colors.black, // Texte noir
                    elevation: 5, // Ombre noire
                    shadowColor: Colors.black, // Couleur de l'ombre
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Bords arrondis
                      side: BorderSide(
                          color: Colors.black, width: 2), // Bordure noire
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'S\'inscrire',
                      style: TextStyle(
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
          labelStyle: TextStyle(color: Colors.black), // Couleur du label
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.green,
                width: 2), // Bordure verte lorsque le champ est sélectionné
          ),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
      ),
    );
  }
}
