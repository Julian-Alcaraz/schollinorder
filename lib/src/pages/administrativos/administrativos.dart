import 'package:flutter/material.dart';

class AdministrativosPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Administrativos"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          "hola admin",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
