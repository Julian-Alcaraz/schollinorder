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
              border: Border.all(color: Colors.black)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                campousuario(),
                campocontrasena(),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Iniciar Sesion'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF364562),
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 15)),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/CrearCuenta");
                  },
                  child: Text('Crear Cuenta'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF364562),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget campousuario() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: TextField(
        decoration: InputDecoration(
      hintText: "Usuario/Email",
    )),
  );
}

Widget campocontrasena() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Contraseña",
        )),
  );
}
