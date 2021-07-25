import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow.shade100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Pagina de redireccionamiento",
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
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
            ],
          ),
        ));
  }
}

Widget _botonAlumno(context) {
  return Container(
    child: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed("/Alumnos");
      },
    ),
  );
}

Widget _botonProfesor(context) {
  return Container(
    child: FloatingActionButton(
      child: Icon(Icons.pause),
      onPressed: () {
        Navigator.of(context).pushNamed("/Profesor");
      },
    ),
  );
}

Widget _botonAdministrativo(context) {
  return Container(
    child: FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: () {
        Navigator.of(context).pushNamed("/Administrativos");
      },
    ),
  );
}
