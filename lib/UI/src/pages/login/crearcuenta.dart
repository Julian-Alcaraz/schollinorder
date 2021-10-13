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
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator: (value) => value.isEmpty ? "Campo requerido" : null,
      ));
}

Widget camponombre() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Nombre",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator: (value) => value.isEmpty ? "Campo requerido" : null,
      ));
}

Widget campoapellido() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Apellido",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator: (value) => value.isEmpty ? "Campo requerido" : null,
      ));
}

Widget campodni() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "DNI",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator: (value) => value.isEmpty ? "Campo requerido" : null,
      ));
}

Widget campotipocuenta() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Tipo Cuenta",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator: (value) => value.isEmpty ? "Campo requerido" : null,
      ));
}

Widget campocurso() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Curso",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator: (value) => value.isEmpty ? "Campo requerido" : null,
      ));
}

Widget campocontrasena() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Ingrese su contraseña",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator: (value) => value.isEmpty ? "Campo requerido" : null,
      ));
}

Widget campoconfirmacioncontrasena() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Ingresela de nuevo",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator: (value) => value.isEmpty ? "Campo requerido" : null,
      ));
}
