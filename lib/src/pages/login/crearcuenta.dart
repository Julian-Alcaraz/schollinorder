import 'package:flutter/material.dart';

class CrearCuenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        backgroundColor: Color(0xFF364562),
        title: Text('Registrarse'),
        centerTitle: true,
        elevation: 8,
      ),
      body: Center(
        child: Text('En proceso'),
      ),
    );
  }
}
