import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:schollinorder/UI/src/pages/login/event_google.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _keyForm = GlobalKey<FormState>();
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /* Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 80, left: 20, right: 20, bottom: 20),
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
                                print("error");
                              }
                            },
                            child: Text('Iniciar Sesion'),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF364562),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
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
          ), */
          Center(child: _GoogleSignIn()),
        ],
      ),
    );
  }
}

class _GoogleSignIn extends StatelessWidget {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Obx(() {
        if (controller.googleAccount.value == null)
          return buildLoginButton();
        else
          return buildProfileView(context);
      }),
    );
  }

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      backgroundColor: Colors.deepPurple[300],
      icon: FaIcon(FontAwesomeIcons.google, color: Colors.black),
      label: Text('Iniciar sesion con google'),
      onPressed: () {
        controller.login();
      },
    );
  }

  Column buildProfileView(context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Text(
        "Ya Iniciaste Sesion!",
        style: TextStyle(fontSize: 25, color: Colors.green),
      ),
      Text("Pulsa el boton para Ingresar"),
      ActionChip(
        avatar: Icon(Icons.logout),
        label: Text(
          'Ingresar',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed("/Home");
        },
      ),
    ]);
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
