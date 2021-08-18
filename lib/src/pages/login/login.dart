import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        backgroundColor: Color(0xFF364562),
        title: Text('Inicio de sesión'),
        centerTitle: true,
        elevation: 8,
      ),
      body: Center(
        child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                border: Border.all(color: Colors.black))),
      ),
    );
  }
}
