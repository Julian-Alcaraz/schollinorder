import 'package:flutter/material.dart';

class ModificarHorarioCurso extends StatefulWidget {
  @override
  _ModificarHorarioCursoState createState() => _ModificarHorarioCursoState();
}

class _ModificarHorarioCursoState extends State<ModificarHorarioCurso> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: drawer(),
      appBar: appBar(),
      body: Center(
        child: Text("New page"),
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

  Widget drawer() {
    return Drawer(
      child: Material(
        color: Colors.indigo.shade100,
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(maxRadius: 60),
                    Text("Nombre Alumno"),
                  ],
                ),
              ),
            ),
            ListTile(
              focusColor: Colors.amber,
              title: Text("Notificaciones"),
              tileColor: Colors.indigo.shade300,
              onTap: () {},
            ),
            Spacer(),
            ListTile(
              focusColor: Colors.amber,
              title: Text("Cerrar Sesion"),
              tileColor: Color(0xFF364562),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/Login");
              },
            ),
          ],
        ),
      ),
    );
  }
}
