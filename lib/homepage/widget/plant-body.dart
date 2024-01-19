import 'package:flutter/material.dart';

class PlantBody extends StatelessWidget {
  const PlantBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
     child: Center(
       child: Column(children: [
        SizedBox(height: 10,),
       Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
       height: 100,
       width: 100,),
        Text('data'),
        Text('93 rue Beaumet'),
        Text('hgs69')
       ]),
     ),
    );
  }
}