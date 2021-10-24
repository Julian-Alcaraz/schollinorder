import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
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
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Form(
                    key: _keyForm,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CircleAvatar(
                            maxRadius: 70,
                            backgroundImage: AssetImage("assets/logo.jpg"),
                          ),
                        ),
                        campousuario(),
                        campocontrasena(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_keyForm.currentState.validate()) {
                                print("muy bien inicio valido");
                                Navigator.of(context).pushNamed("/Home");
                              } else {
                                print("erro");
                              }
                            },
                            child: Text('Iniciar Sesion'),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF364562),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/CrearCuenta");
                            },
                            child: Text('Crear Cuenta'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget campousuario() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Usuario/Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      validator: (email) {
        if (email.isEmpty) {
          return ("Correo electronico obligatorio");
        }
        if (!RegExp("^[a-zA-Z0-9+.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(email)) {
          return ("Porfavor ingrese un email valido");
        }
        return null;
      },
    ),
  );
}

Widget campocontrasena() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Contraseña",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
      validator: (pass) {
        if (pass.isEmpty) {
          return ("Contraseña obligatorio");
        }
        return null;
      },
    ),
  );
}
