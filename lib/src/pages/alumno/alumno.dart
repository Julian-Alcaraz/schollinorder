import 'package:flutter/material.dart';
import 'package:schollinorder/src/models/bloque.dart';
import 'package:schollinorder/src/models/curso.dart';

class AlumnoPage extends StatelessWidget {
  final _listaDias = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes"];
  final _listaTurnos = ["Teoria", "Taller     "];
  final String a = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
          child: Column(
        children: [
          DrawerHeader(child: Text("Bienvenido Alumno")),
          Spacer(),
          ListTile(
            tileColor: Color(0xFF364562),
            title: Text("Cerrar Sesion"),
            onTap: () {},
          ),
        ],
      )),
      appBar: AppBar(
        leading: Container(
          width: 50,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset(
              "assets/logo.jpg",
            ),
          ),
        ),

        backgroundColor: Color(0xFF364562), // color del appbar fondo
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_rounded, size: 35),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10))),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                // Nombre del Curso
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 30),
                  padding: EdgeInsets.all(12),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.indigo.shade200,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.indigo.shade100,
                  ),
                  child: Text(
                    "Curso : ${sextoPrimera.ano} ${sextoPrimera.divsion}",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //Botones Desplegables
                Container(
                  height: 110,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //primero
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.indigo.shade200,
                            width: 2,
                          ),
                          color: Colors.indigo.shade100,
                        ),
                        child: DropdownButton(
                          //PERSONALIZACION

                          dropdownColor: Colors.indigo.shade100,
                          hint: Text(
                            "Turno",
                            style: TextStyle(color: Colors.black),
                          ),
                          //FUNCIONALIDAD
                          items: _listaTurnos
                              .map((a) =>
                                  DropdownMenuItem(value: a, child: Text(a)))
                              .toList(),
                          onChanged: (a) {
                            print(a);
                          },
                        ),
                      ),
                      //segundo
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: Colors.indigo.shade200,
                              width: 2,
                            ),
                            color: Colors.indigo.shade100),
                        child: DropdownButton(
                          //PERSONALIZACION
                          dropdownColor: Colors.indigo.shade100,

                          hint: Text(
                            "Dias",
                            style: TextStyle(color: Colors.black),
                          ),
                          //FUNCIONALIDAD
                          items: _listaDias
                              .map((String a) =>
                                  DropdownMenuItem(value: a, child: Text(a)))
                              .toList(),
                          onChanged: (a) {
                            print(a);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //tabla magica de los horarios
                Container(
                  height: 370,
                  decoration: BoxDecoration(/* color: Colors.amber */),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _hora(),
                      _hora(),
                      _hora(),
                      _hora(),
                      _hora(),
                      _hora(),
                      _hora(),
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: ElevatedButton(
                        child: Text("Ir a home"),
                        onPressed: () {
                          Navigator.of(context).pop("/Home");
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _hora() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        height: 50,
        width: 55,
        decoration: BoxDecoration(
          color: Colors.indigo.shade100,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          //"13:30\n14:10",
          "${bloque.horasCatedra.horas}",
        ),
      ),
      Container(
        height: 50,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.indigo.shade100,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          //"Apellido\nNombre",
          "${bloque.profesor.apellido}\n ${bloque.profesor.nombre}",
        ),
      ),
      Container(
        height: 50,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.indigo.shade100,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          "Materia",
          //textAlign: TextAlign.center,
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.indigo.shade100,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 0.5),
          ),
          child: Text("P"),
        ),
      ),
    ],
  );
}
