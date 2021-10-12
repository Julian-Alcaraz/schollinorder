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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  border: Border.all(color: Colors.black)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  campoemail(),
                  camponombre(),
                  campoapellido(),
                  campodni(),
                  campotipocuenta(),
                  campocurso(),
                  campocontrasena(),
                  campoconfirmacioncontrasena(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Registrarse'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF364562),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget campoemail() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Email",
      ),
    ),
  );
}

Widget camponombre() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Nombre",
      ),
    ),
  );
}

Widget campoapellido() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Apellido",
      ),
    ),
  );
}

Widget campodni() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        hintText: "DNI",
      ),
    ),
  );
}

Widget campotipocuenta() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Tipo Cuenta",
      ),
    ),
  );
}

Widget campocurso() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Curso",
      ),
    ),
  );
}

Widget campocontrasena() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Ingrese su contraseña",
      ),
    ),
  );
}

Widget campoconfirmacioncontrasena() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Ingresela de nuevo",
      ),
    ),
  );
}
