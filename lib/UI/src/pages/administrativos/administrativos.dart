import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollinorder/UI/src/pages/login/event_google.dart';

class AdministrativosPages extends StatelessWidget {
  final controller = Get.put(Controller());

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: drawer(context),
      appBar: AppBar(
        backgroundColor: Color(0xFF364562),
        leading: Container(
          width: 50,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset(
              "assets/logo.jpg",
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle_rounded,
              size: 35,
            ),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/CargarDatos");
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF364562), minimumSize: Size(200, 95)),
                child: Text(
                  "Cargar datos \nde profesor ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/VerDatos2");
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF364562), minimumSize: Size(200, 95)),
                child: Text(
                  "Ver datos \nde profesor ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/CargarCursos");
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF364562), minimumSize: Size(200, 95)),
                child: Text(
                  "Cargar Curso ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: ElevatedButton(
                onPressed: () {
                  //Navigator.of(context).pushNamed("/CargarFaltas");
                  Navigator.of(context).pushNamed("/Desarrollo");
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF364562), minimumSize: Size(200, 95)),
                child: Text(
                  "Cargar faltas\nde profesores ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/CargarHorarioCurso");
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF364562), minimumSize: Size(200, 95)),
                child: Text(
                  "Cargar horario\n   de curso ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (20),
                  ),
                ),
              ),
            ),
          ],
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
}
