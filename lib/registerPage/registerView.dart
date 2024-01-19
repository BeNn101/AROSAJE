import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 70),
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
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 12),
              RegistrationFormField(
                label: 'Mot de passe',
                obscureText: true,
              ),
              SizedBox(height: 12),
              RegistrationFormField(
                label: 'Téléphone',
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Déjà inscrit ? Connectez-vous',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  side: BorderSide(color: Colors.black),
                ),
                child: Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'S\'inscrire',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
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
          filled: true,
          fillColor: Colors.grey[200], 
          border: OutlineInputBorder(),
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
      ),
    );
  }
}
