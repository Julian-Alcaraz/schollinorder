import 'package:flutter/material.dart';

class ProfesorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profesor"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          "hola profesor",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
