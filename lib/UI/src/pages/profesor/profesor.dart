import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollinorder/UI/src/models/bloque.dart';
import 'package:schollinorder/UI/src/pages/login/event_google.dart';

class ProfesorPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: drawer(context),
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
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              _horarioclases(),
              _tablaHorarios(teoriaTardeProfesor),
              Spacer(),
              botonNotificar(context),
              Container(
                //boton ir home
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
                    content: Text("??Seguro que desea cerrar la sesion?"),
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

  Widget _tablaHorarios(List<Bloque> lista) {
    return Container(
      height: 370,
      child: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) => _hora(lista[index]),
      ),
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
          child: Text("Curso: ${bloque.curso.ano} ${bloque.curso.divsion}"),
        ),
        Container(
          height: 50,
          width: 110,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.indigo.shade100,
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Text(
            "Materia: ${bloque.materia}",
          ),
        ),
      ],
    );
  }

  Widget botonNotificar(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      //boton notifical faltas
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/CargarFaltasPage");
        },
        child: Text(
          "Notificar Faltas",
          style: TextStyle(fontSize: 22),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.indigo.shade100,
          onPrimary: Colors.black,
          minimumSize: Size(200, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _horarioclases() {
    return Container(
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
        "Horario de Clases",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
