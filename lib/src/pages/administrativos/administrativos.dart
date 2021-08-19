import 'package:flutter/material.dart';

class AdministrativosPages extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: drawer(),
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
                  Navigator.of(context).pushNamed("/VerDatos");
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
                  Navigator.of(context).pushNamed("/CargarFaltas");
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
                  Navigator.of(context).pushNamed("/ModificarHorario");
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF364562), minimumSize: Size(200, 95)),
                child: Text(
                  "Modificar \nhorario de curso ",
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

  Widget drawer() {
    return Drawer();
  }
}
