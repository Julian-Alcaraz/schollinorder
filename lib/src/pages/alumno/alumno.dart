import 'package:flutter/material.dart';

class AlumnoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alumno"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          "hola alumno",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
