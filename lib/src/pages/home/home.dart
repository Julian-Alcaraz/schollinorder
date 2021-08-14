import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF364562),
          leading: Image.asset(
            "assets/logo.jpg",
            width: 50,
          ),
          title: Text(
            "Pagina de redireccionamiento",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              _botonAlumno(context),
              SizedBox(height: 20),
              _botonProfesor(context),
              SizedBox(height: 20),
              _botonAdministrativo(context),
              SizedBox(height: 20),
              _botonLogin(context),
            ],
          ),
        ));
  }
}

Widget _botonAlumno(context) {
  return Container(
    child: ElevatedButton(
      child: Text("Alumnos"),
      onPressed: () {
        Navigator.of(context).pushNamed("/Alumnos");
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF364562),
      ),
    ),
  );
}

Widget _botonLogin(context) {
  return Container(
    child: ElevatedButton(
      child: Text("Login"),
      onPressed: () {
        Navigator.of(context).pushNamed("/Login");
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF364562),
      ),
    ),
  );
}

Widget _botonProfesor(context) {
  return Container(
    decoration: BoxDecoration(),
    child: ElevatedButton(
      child: Text(
        "profesor",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed("/Profesor");
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF364562),
      ),
    ),
  );
}

Widget _botonAdministrativo(context) {
  return Container(
    child: ElevatedButton(
      child: Text("Administrativos"),
      onPressed: () {
        Navigator.of(context).pushNamed("/Administrativos");
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF364562),
      ),
    ),
  );
}
