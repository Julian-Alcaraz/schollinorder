import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:schollinorder/UI/src/models/bloque.dart';
import 'package:schollinorder/UI/src/models/curso.dart';
import 'package:schollinorder/UI/src/pages/login/event_google.dart';

class AlumnoPage extends StatefulWidget {
  @override
  _AlumnoPageState createState() => _AlumnoPageState();
}

class _AlumnoPageState extends State<AlumnoPage> {
  List<String> listaDias = [
    "Lunes",
    "Martes",
    "Miercoles",
    "Jueves",
    "Viernes"
  ];
  List<String> listaTurnos = ["Teoria", "Taller"];
  List<Bloque> listaDependiendoTurno = [];
  String valorTurno = "";
  String valorDia = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final controller = Get.put(Controller());

  @override
  void initState() {
    valorTurno = listaTurnos.first;
    valorDia = listaDias.first;
    listaDependiendoTurno = teoriaTarde;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: drawer(context),
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                // Nombre del Curso
                _nombreCurso(),
                //Botones Desplegables
                Container(
                  height: 110,
                  //decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //primer boton
                      _botonDesplegableTurno(),
                      //segundo boton
                      _botonDesplegableDia(),
                    ],
                  ),
                ),
                //tabla horarios
                _tablaHorario(listaDependiendoTurno),
                //Boton Ir a home
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

  Widget appBar() {
    return AppBar(
      leading: Image.asset(
        "assets/logo.jpg",
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
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  Widget drawer(context) {
    return Drawer(
      child: Material(
        color: Colors.indigo.shade100,
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 58,
                      backgroundImage: Image.network(
                              controller.googleAccount.value.photoUrl ?? '')
                          .image,
                    ),
                    Text(controller.googleAccount.value.displayName ?? '',
                        style: Get.textTheme.headline3),
                  ],
                ),
              ),
            ),
            ListTile(
              focusColor: Colors.amber,
              title: Text("Datos Personales"),
              tileColor: Colors.indigo.shade300,
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/DatosPersonales");
              },
            ),
            Spacer(),
            ListTile(
              focusColor: Colors.amber,
              title: Text("Cerrar Sesion"),
              tileColor: Color(0xFF364562),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Cerrar Sesion"),
                    content: Text("¿Seguro que desea cerrar la sesion?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            controller.logut();
                            Navigator.of(context)
                                .pushReplacementNamed("/Login");
                          },
                          child: Text("Si")),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("No")),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _nombreCurso() {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 30),
      padding: EdgeInsets.all(12),
      height: 65,
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
    );
  }

  Widget _tablaHorario(List<Bloque> lista) {
    return Container(
      height: 370,
      child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) => _hora(lista[index])),
    );
  }

  Widget _hora(Bloque bloque) {
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
            "${bloque.horaDeCatedra.horas}",
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
            "${bloque.materia}",
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
            child: Text("${bloque.asistencia}"),
          ),
        ),
      ],
    );
  }

  Widget _botonDesplegableTurno() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Colors.indigo.shade200,
          width: 2,
        ),
        color: Colors.indigo.shade100,
      ),
      child: DropdownButton<String>(
        //PERSONALIZACION
        dropdownColor: Colors.indigo.shade100,
        hint: Text(
          "",
          style: TextStyle(color: Colors.black),
        ),
        //FUNCIONALIDAD
        items: listaTurnos.map((String showedOption) {
          return DropdownMenuItem(
            value: showedOption,
            child: Text(showedOption),
          );
        }).toList(),
        onChanged: (selectedOption) {
          setState(() {
            valorTurno = selectedOption;
          });
          _cambioDeturno(valorTurno);
        },
        value: valorTurno,
      ),
    );
  }

  void _cambioDeturno(valor) {
    listaDependiendoTurno = [];
    if (valor == "Taller") {
      listaDependiendoTurno = tallerManana;
    } else {
      listaDependiendoTurno = teoriaTarde;
    }
    setState(() {});
  }

  Widget _botonDesplegableDia() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
          "",
          style: TextStyle(color: Colors.black),
        ),
        //FUNCIONALIDAD
        items: listaDias.map((String showedOption) {
          return DropdownMenuItem(
            value: showedOption,
            child: Text(showedOption),
          );
        }).toList(),
        onChanged: (selectedOption) {
          setState(() {
            valorDia = selectedOption;
          });
        },
        value: valorDia,
      ),
    );
  }
}
