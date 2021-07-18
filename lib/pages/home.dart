import 'package:flutter/material.dart';

class Myhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink.shade100,
        appBar: AppBar(
          title: Text("Prueba 1"),
        ),
        body: Container(
          child: Text(
            "Hola Mundo",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
